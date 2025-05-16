import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:drift/drift.dart';

import 'package:apprendre_lsf/shared/data/cards/mappers/cards_table_card_model_mapper.dart';
import 'package:apprendre_lsf/shared/data/database/drift_database.dart';
import 'package:apprendre_lsf/shared/data/cards/mappers/retention_card_fsrs_card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/repositories/cards_repository.dart';

class CardsRepositoryImpl extends CardsRepository {
  final AppDriftDatabase _driftDatabase;

  CardsRepositoryImpl({required AppDriftDatabase driftDatabase})
    : _driftDatabase = driftDatabase;

  /// Store a FullCard in the DB by storing each part in different table.
  ///
  /// [CardModel] FullCard.card stored in drift [CardsTable].
  /// [RetentionCard] FullCard.retentionCard in drift [RetentionTable].
  /// The insert of [CardModel] inside [CardsTable] is made first so it's id can be
  /// use to make the link with the [RetentionTable].
  @override
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

  @override
  Future<void> createCards({required List<FullCard> fullCards}) async {
    final createResp = await Future.wait(
      fullCards.map((full) => createCard(fullCard: full)),
    );
    // final createdCardsId = createResp.whereType<AsyncData>().map((data) => data.value as int);
  }

  @override
  Future<List<FullCard>> getAllCards() {
    return getAllCardsStream().first;
  }

  @override
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

  @override
  Future<List<FullCard>> getCardsAddedSinceXDays(int days) {
    final db = _driftDatabase;
    final selectSince = DateTime.now().subtract(Duration(days: days));
    final query =
        db.select(db.cardsTable)
          ..where((card) => card.createdAt.isBiggerThanValue(selectSince))
          ..orderBy([(card) => OrderingTerm.desc(card.createdAt)]);

    return _joinCardsRetentionToCardsTable(query);
  }

  @override
  Future<List<FullCard>> getDueCards() {
    final db = _driftDatabase;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
    final query = db.select(db.retentionTable)
      ..where((retention) => retention.due.unixepoch.isSmallerThanValue(now));
    return _joinCardsTableToCardRetention(query);
  }

  @override
  Stream<List<FullCard>> getDueCardsStream() {
    final db = _driftDatabase;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).toInt();
    final query = db.select(db.retentionTable)
      ..where((retention) => retention.due.unixepoch.isSmallerThanValue(now));
    return _joinCardsTableToCardRetentionStream(query);
  }

  @override
  Future<List<FullCard>> getCardsOfADeck(int deckId) async {
    final db = _driftDatabase;
    final query =
        db.select(db.cardsTable)
          ..where((card) => card.deckId.equals(deckId))
          ..orderBy([(card) => OrderingTerm.desc(card.createdAt)]);

    return _joinCardsRetentionToCardsTable(query);
  }

  @override
  Future<void> updateRetentionCard(RetentionCard retention) async {
    final cardId = retention.cardId;
    if (cardId == null) return;

    await _driftDatabase.managers.retentionTable
        .filter((retItem) => retItem.cardId.id.equals(retention.cardId))
        .update((retItem) => retention.toRetentionTableDatas());
  }

  @override
  Future<void> deleteCards({required List<int> cardsIds}) async {
    await _driftDatabase.cardsTable.deleteWhere(
      (card) => card.id.isIn(cardsIds),
    );
  }

  @override
  Future<void> deleteCardsFromDeck({required List<int> deckIds}) async {
    _driftDatabase.cardsTable.deleteWhere((card) => card.id.isIn(deckIds));
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
}
