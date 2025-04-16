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

  Future<Result<int>> createDeck({required DeckModel deck}) async {
    try {
      final deckId =
          await _driftDatabase.decksTable.insertOne(deck.toCompanion());
      return Result.ok(deckId);
    } catch (err, st) {
      print(st);
      return Result.error(Exception("Erreur lors de la création du deck."));
    }
  }

  Future<Result<List<DeckModel>>> getAllDecks() async {
    try {
      final decksTableData = await _driftDatabase.managers.decksTable.get();
      final decks = decksTableData.map((deckData) => deckData.toDeckModel());
      return Result.ok(decks.toList());
    } catch (err, st) {
      print(st);
      return Result.error(Exception(
          "Une erreur s'est produite durant la récupération des decks"));
    }
  }

  Future<Result<int>> createCard({required CardModel card}) async {
    try {
      final cardId =
          await _driftDatabase.cardsTable.insertOne(card.toCompanion());
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
            _driftDatabase.cardsTable, cards.map((card) => card.toCompanion()));
      });
      return Result.ok(null);
    } catch (err, st) {
      print(st);
      return Result.error(Exception("Erreur lors de la création de la carte."));
    }
  }
}
