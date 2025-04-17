import 'package:flutter/widgets.dart';
import 'package:flutter_command/flutter_command.dart';

import 'package:collection/collection.dart';

import 'package:apprendre_lsf/data/repositories/decks/decks_repository.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/utils/result.dart';

enum CreateCardStep { selectDeck, addDetails, review }

class CreateCardViewmodel {
  final DecksRepository _decksRepository;
  final ValueNotifier<List<int>> selectedDecksIds = ValueNotifier(const []);
  final PageController pageViewController = PageController();
  final ValueNotifier<CreateCardStep> _currentPage =
      ValueNotifier(CreateCardStep.selectDeck);
  final CardModel cardToCreate;

  late Command<void, Result<List<DeckModel>>> getAllDecks;
  late Command<void, Result<void>> createCards;

  CreateCardViewmodel(
      {required this.cardToCreate, required DecksRepository deckRepository})
      : _decksRepository = deckRepository {
    // getAllDecks = Command.createAsyncNoParam(
    //   _getAllDecks,
    //   initialValue: const Result.ok([]),
    // );
    createCards = Command.createAsyncNoParam(_createCards,
        initialValue: const Result.ok(null));
    getAllDecks.execute();
  }

  void dispose() {
    selectedDecksIds.dispose();
    pageViewController.dispose();
    _currentPage.dispose();
    getAllDecks.dispose();
    createCards.dispose();
  }

  CreateCardStep get currentPage => _currentPage.value;

  void addDeckToSelectedDecks(int deckId) {
    selectedDecksIds.value = selectedDecksIds.value + [deckId];
    // selectedDecksIds.value = List.of(selectedDecksIds.value)..add(deckId);
  }

  void removeFromSelectedDecks(int deckId) {
    selectedDecksIds.value = List.of(selectedDecksIds.value)..remove(deckId);
  }

  void onCreateDeckSuccess(int deckId) {
    getAllDecks.execute();
    addDeckToSelectedDecks(deckId);
    //TODO: recuperer le nouveau deck et l'ajouter a la liste des selectedDecks;
  }

  void onPageChange(int currentPageIndex) {
    _currentPage.value =
        CreateCardStep.values.elementAtOrNull(currentPageIndex) ??
            CreateCardStep.selectDeck;
  }

  Future<Result<void>> _createCards() {
    final cardsToAdd = selectedDecksIds.value.map(
      (deckId) => cardToCreate.copyWith(deckId: deckId),
    );
    return _decksRepository.createCards(cards: cardsToAdd.toList());
  }

  // Future<Result<List<DeckModel>>> _getAllDecks() async {
  //   try {
  //     return _decksRepository.getAllDecks();
  //   } catch (err, st) {
  //     print(st);
  //     return Result.error(Exception(err));
  //   }
  // }
}
