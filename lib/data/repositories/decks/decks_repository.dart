import 'package:apprendre_lsf/utils/exceptions.dart';
import 'package:drift/drift.dart';
import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/mappers/cards_table_card_model_mapper.dart';
import 'package:apprendre_lsf/domain/mappers/decks_table_deck_model_mapper.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/utils/result.dart';

class DecksRepository {
  final AppDriftDatabase _driftDatabase;

  DecksRepository({required AppDriftDatabase driftDatabase})
    : _driftDatabase = driftDatabase;

  Future<int> createDeck({required DeckModel deck}) async {
    try {
      final deckId = await _driftDatabase.decksTable.insertOne(
        deck.toCompanion,
      );
      return deckId;
    } catch (err, st) {
      print(st);
      throw DetailedException(
        cause: err,
        detailedMessage: "Erreur lors de la création du deck.",
        trace: st,
      );
    }
  }

  Future<List<DeckModel>> getAllDecks() async {
    try {
      final decksTableData = await _driftDatabase.managers.decksTable.get();
      final decks = decksTableData.map((deckData) => deckData.toDeckModel);
      return decks.toList();
    } catch (err, st) {
      print(st);
      throw DetailedException(
        cause: err,
        detailedMessage:
            "Une erreur s'est produite durant la récupération des decks",
      );
    }
  }

  Stream<List<DeckModel>> getAllDecksStream() {
    return _driftDatabase.managers.decksTable
        .watch()
        .map((deckList) => deckList.map((deck) => deck.toDeckModel).toList())
        .asBroadcastStream();
  }

  Future<Result<int>> createCard({required CardModel card}) async {
    try {
      final cardId = await _driftDatabase.cardsTable.insertOne(
        card.toCompanion(),
      );
      return Result.ok(cardId);
    } catch (err, st) {
      print(st);
      return Result.error(Exception("Erreur lors de la création de la carte."));
    }
  }

  Future<Result<void>> createCards({required List<CardModel> cards}) async {
    try {
      // _driftDatabase.cardsTable.insertOne(cards.first.toCompanion());
      await _driftDatabase.batch((batch) {
        // batch.insert(_driftDatabase.cardsTable, cards.first.toCompanion());
        batch.insertAll(
          _driftDatabase.cardsTable,
          cards.map((card) => card.toCompanion()),
        );
      });
      return Result.ok(null);
    } catch (err, st) {
      print(st);
      return Result.error(Exception("Erreur lors de la création de la carte."));
    }
  }
}
