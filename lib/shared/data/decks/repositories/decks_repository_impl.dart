import 'package:drift/drift.dart';

import 'package:apprendre_lsf/shared/data/database/drift_database.dart';
import 'package:apprendre_lsf/shared/data/decks/mappers/decks_table_deck_model_mapper.dart';
import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/utils/exceptions.dart';
import 'package:apprendre_lsf/shared/domain/repositories/deck_repository.dart';

class DecksRepositoryImpl extends DeckRepository {
  final AppDriftDatabase _driftDatabase;

  DecksRepositoryImpl({required AppDriftDatabase driftDatabase})
    : _driftDatabase = driftDatabase;

  @override
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

  @override
  Future<List<DeckModel>> getAllDecks() async {
    try {
      final decksTableData =
          await _driftDatabase.managers.decksTable
              .orderBy((deck) => deck.name.asc())
              .get();
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

  @override
  Stream<List<DeckModel>> getAllDecksStream() {
    return _driftDatabase.managers.decksTable
        .watch()
        .map((deckList) => deckList.map((deck) => deck.toDeckModel).toList())
        .asBroadcastStream();
  }

  @override
  Future<void> deleteDecks({required List<int> deckIds}) async {
    _driftDatabase.decksTable.deleteWhere((deck) => deck.id.isIn(deckIds));
  }


  @override
  Future<void> updateParentDeck({
    required List<int> cardsIds,
    int? newValue,
  }) async {
    final db = _driftDatabase;
    (db.update(db.cardsTable)..where(
      (card) => card.id.isIn(cardsIds),
    )).write(CardsTableCompanion(deckId: Value(newValue)));
  }

  /// Stored card
  // CardModel initSpaceRepetitionForCard() {

  // }
}
