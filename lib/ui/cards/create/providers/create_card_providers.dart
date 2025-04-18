import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

enum CreateCardStep { selectDeck, addDetails, review }

final createCardStepProvider =
    NotifierProvider<CurrentPageNotifier, CreateCardStep>(
      CurrentPageNotifier.new,
    );

class CurrentPageNotifier extends Notifier<CreateCardStep> {
  @override
  build() => CreateCardStep.selectDeck;

  void updateFromPageIndex(int index) {
    state =
        CreateCardStep.values.elementAtOrNull(index) ??
        CreateCardStep.selectDeck;
  }
}

final createCardsProvider =
    NotifierProvider<CreateCardNotifier, AsyncValue<void>>(
      CreateCardNotifier.new,
    );

class CreateCardNotifier extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() => AsyncLoading();

  Future call({required CardModel card, required List<int> deckIds}) async {
    final deckRepository = ref.watch(decksRepositoryProvider);

    try {
      state = AsyncLoading();
      final cardsToAdd = deckIds.map((deckId) => card.copyWith(deckId: deckId));
      deckRepository.createCards(cards: cardsToAdd.toList());
      state = AsyncData(null);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}



final selectedDecksProvider =
    AutoDisposeNotifierProvider<SelectedDecksNotifier, List<int>>(
      SelectedDecksNotifier.new,
    );

class SelectedDecksNotifier extends AutoDisposeNotifier<List<int>> {
  @override
  List<int> build() => [];

  void add(int deckId) => state = state + [deckId];
  void remove(int deckId) =>
      state = List.of(state)..remove(deckId); //pas sence marcher
}
