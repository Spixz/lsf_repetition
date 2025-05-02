import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/mappers/cards_table_card_model_mapper.dart';
import 'package:apprendre_lsf/domain/mappers/decks_table_deck_model_mapper.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/domain/mappers/deck_infos_table_deck_infos_model_mapper.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_deck_infos.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/utils/exceptions.dart';

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

  Stream<List<FullCard>> getAllCards() {
    final db = _driftDatabase;
    final query = db.select(db.cardsTable).join([
      innerJoin(
        db.cardDeckInfoTable,
        db.cardDeckInfoTable.cardId.isExp(db.cardsTable.id),
      ),
    ]);
    final simple = db.select(db.cardsTable).watch();

    return query.watch().map((rows) {
      return rows.map((row) {
        return FullCard(
          card: row.readTable(db.cardsTable).toCardModel(),
          deckInfos:
              row.readTableOrNull(db.cardDeckInfoTable)?.toCardDeckInfo(),
        );
      }).toList();
    }).asBroadcastStream();
  }

  Future<List<FullCard>> getCardsOfADeck(int deckId) async {
    final db = _driftDatabase;
    final query = db.select(db.cardDeckInfoTable)
      ..where((info) => info.deckId.equals(deckId));
    // ..orderBy([(card) => OrderingTerm(expression: card.name)]);
    final joinedQuery = query.join([
      innerJoin(
        db.cardsTable,
        db.cardsTable.id.isExp(db.cardDeckInfoTable.cardId),
      ),
    ]);
    final joinedQueryResult = await joinedQuery.get();
    final result = joinedQueryResult.map(
      (row) => FullCard(
        card: row.readTable(db.cardsTable).toCardModel(),
        deckInfos: row.readTable(db.cardDeckInfoTable).toCardDeckInfo(),
      ),
    );

    return result.toList();
  }

  /// Store a FullCard in the DB by storing each part in different table.
  ///
  /// FullCard.[CardModel] in [CardsTable].
  /// FullCard.[CardDeckInfo] in [CardDeckInfoTable].
  /// The insert of [CardModel] inside [CardTable] is made first so it's id can be
  /// use to make the link with the [CardDeckInfo].
  Future<int> createCard({required FullCard fullCard}) async {
    final card = fullCard.card.toCompanion();
    final cardId = await _driftDatabase.cardsTable.insertOne(card);

    if (fullCard.deckInfos != null) {
      final deckInfos = fullCard.deckInfos!.copyWith(cardId: cardId);
      await _driftDatabase.cardDeckInfoTable.insertOne(deckInfos.toCompanion());
    }
    return cardId;
  }

  Future<void> createCards({required List<FullCard> fullCards}) async {
    final createResp = await Future.wait(
      fullCards.map((full) => createCard(fullCard: full)),
    );
    // final createdCardsId = createResp.whereType<AsyncData>().map((data) => data.value as int);
    return;
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
    (db.update(db.cardDeckInfoTable)..where(
      (info) => info.deckId.isIn(cardsIds),
    )).write(CardDeckInfoTableCompanion(deckId: Value(newValue)));
  }

  /// Stored card
  // CardModel initSpaceRepetitionForCard() {

  // }
}
