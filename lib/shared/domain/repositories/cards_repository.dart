import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

/// gere le stockage des cartes dans ma memoire
abstract class CardsRepository {
  /// Store a FullCard in the DB by storing each part in different table.
  ///
  /// [CardModel] FullCard.card stored in drift [CardsTable].
  /// [RetentionCard] FullCard.retentionCard in drift [RetentionTable].
  /// The insert of [CardModel] inside [CardsTable] is made first so it's id can be
  /// use to make the link with the [RetentionTable].
  Future<int> createCard({required FullCard fullCard});
  Future<void> createCards({required List<FullCard> fullCards});
  
  Future<List<FullCard>> getAllCards();
  Stream<List<FullCard>> getAllCardsStream();
  Future<List<FullCard>> getCardsAddedSinceXDays(int days);
  Future<List<FullCard>> getDueCards();
  Stream<List<FullCard>> getDueCardsStream();
  Future<List<FullCard>> getCardsOfADeck(int deckId);

  Future<void> updateRetentionCard(RetentionCard retention);

  Future<void> deleteCards({required List<int> cardsIds});
  Future<void> deleteCardsFromDeck({required List<int> deckIds});
}
