import 'package:drift/drift.dart';

import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/mappers/cards_table_card_model_mapper.dart';
import 'package:apprendre_lsf/domain/mappers/decks_table_deck_model_mapper.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/utils/exceptions.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/domain/mappers/retention_card_fsrs_card.dart';

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

  Stream<List<DeckModel>> getAllDecksStream() {
    return _driftDatabase.managers.decksTable
        .watch()
        .map((deckList) => deckList.map((deck) => deck.toDeckModel).toList())
        .asBroadcastStream();
  }

  Future<void> deleteDecks({required List<int> deckIds}) async {
    _driftDatabase.decksTable.deleteWhere((deck) => deck.id.isIn(deckIds));
  }

  Future<void> deleteCardsFromDeck({required List<int> deckIds}) async {
    _driftDatabase.cardsTable.deleteWhere((card) => card.id.isIn(deckIds));
  }

  Stream<List<FullCard>> getAllCardsStream() {
    final db = _driftDatabase;
    final query = db.select(db.cardsTable).join([
      innerJoin(
        db.retentionTable,
        db.retentionTable.cardId.isExp(db.cardsTable.id),
      ),
    ])..orderBy([OrderingTerm.desc(db.cardsTable.createdAt)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return FullCard(
          card: row.readTable(db.cardsTable).toCardModel(),
          retentionCard:
              row.readTableOrNull(db.retentionTable)?.toRetentionCard(),
        );
      }).toList();
    }).asBroadcastStream();
  }

  Future<List<FullCard>> getAllCards() {
    return getAllCardsStream().first;
  }

  Future<List<FullCard>> getCardsAddedSinceXDays(int days) {
    final db = _driftDatabase;
    final selectSince = DateTime.now().subtract(Duration(days: days));
    final query =
        db.select(db.cardsTable)
          ..where((card) => card.createdAt.isBiggerThanValue(selectSince))
          ..orderBy([(card) => OrderingTerm.desc(card.createdAt)]);

    return _joinCardsRetentionToCardsTable(query);
  }

  Future<List<FullCard>> getCardsOfADeck(int deckId) async {
    final db = _driftDatabase;
    final query =
        db.select(db.cardsTable)
          ..where((card) => card.deckId.equals(deckId))
          ..orderBy([(card) => OrderingTerm.desc(card.createdAt)]);

    return _joinCardsRetentionToCardsTable(query);
  }

  Future<List<FullCard>> _joinCardsRetentionToCardsTable(
    SimpleSelectStatement query,
  ) async {
    final db = _driftDatabase;
    final joinedQuery = query.join([
      innerJoin(
        db.retentionTable,
        db.retentionTable.cardId.isExp(db.cardsTable.id),
      ),
    ])..orderBy([OrderingTerm.desc(db.cardsTable.createdAt)]);

    final joinedQueryResult = await joinedQuery.get();
    final result = joinedQueryResult.map(
      (row) => FullCard(
        card: row.readTable(db.cardsTable).toCardModel(),
        retentionCard: row.readTable(db.retentionTable).toRetentionCard(),
      ),
    );

    return result.toList();
  }

  Future<List<FullCard>> _joinCardsTableToCardRetention(
    SimpleSelectStatement query,
  ) async {
    final db = _driftDatabase;
    final joinedQuery = query.join([
      innerJoin(
        db.cardsTable,
        db.cardsTable.id.isExp(db.retentionTable.cardId),
      ),
    ])..orderBy([OrderingTerm.desc(db.cardsTable.createdAt)]);

    final joinedQueryResult = await joinedQuery.get();
    final result = joinedQueryResult.map(
      (row) => FullCard(
        card: row.readTable(db.cardsTable).toCardModel(),
        retentionCard: row.readTable(db.retentionTable).toRetentionCard(),
      ),
    );

    return result.toList();
  }

  Stream<List<FullCard>> _joinCardsTableToCardRetentionStream(
    SimpleSelectStatement query,
  ) {
    final db = _driftDatabase;
    final joinedQuery = query.join([
      innerJoin(
        db.cardsTable,
        db.cardsTable.id.isExp(db.retentionTable.cardId),
      ),
    ])..orderBy([OrderingTerm.desc(db.cardsTable.createdAt)]);

    final joinedQueryResult = joinedQuery.watch();
    return joinedQueryResult.map(
      (List<TypedResult> streamContent) =>
          streamContent
              .map(
                (row) => FullCard(
                  card: row.readTable(db.cardsTable).toCardModel(),
                  retentionCard:
                      row.readTable(db.retentionTable).toRetentionCard(),
                ),
              )
              .toList(),
    );
  }

  /// Store a FullCard in the DB by storing each part in different table.
  ///
  /// [CardModel] FullCard.card stored in drift [CardsTable].
  /// [RetentionCard] FullCard.retentionCard in drift [RetentionTable].
  /// The insert of [CardModel] inside [CardsTable] is made first so it's id can be
  /// use to make the link with the [RetentionTable].
  Future<int> createCard({required FullCard fullCard}) async {
    final card = fullCard.card.toCompanion();
    final cardId = await _driftDatabase.cardsTable.insertOne(card);

    if (fullCard.retentionCard != null) {
      final retention = fullCard.retentionCard!.copyWith(cardId: cardId);
      await _driftDatabase.retentionTable.insertOne(
        retention.toRetentionTableDatas(),
      );
    }
    return cardId;
  }

  Future<void> createCards({required List<FullCard> fullCards}) async {
    final createResp = await Future.wait(
      fullCards.map((full) => createCard(fullCard: full)),
    );
    // final createdCardsId = createResp.whereType<AsyncData>().map((data) => data.value as int);
  }

  Future<void> updateRetentionCard(RetentionCard retention) async {
    final cardId = retention.cardId;
    if (cardId == null) return;

    await _driftDatabase.managers.retentionTable
        .filter((retItem) => retItem.cardId.id.equals(retention.cardId))
        .update((retItem) => retention.toRetentionTableDatas());
  }

  Future<List<FullCard>> getDueCards() {
    final db = _driftDatabase;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
    final query = db.select(db.retentionTable)
      ..where((retention) => retention.due.unixepoch.isSmallerThanValue(now));
    return _joinCardsTableToCardRetention(query);
  }

  Stream<List<FullCard>> getDueCardsStream() {
    final db = _driftDatabase;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
    final query = db.select(db.retentionTable)
      ..where((retention) => retention.due.unixepoch.isSmallerThanValue(now));
    return _joinCardsTableToCardRetentionStream(query);
  }

  Future<void> deleteCards({required List<int> cardsIds}) async {
    await _driftDatabase.cardsTable.deleteWhere(
      (card) => card.id.isIn(cardsIds),
    );
  }

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
