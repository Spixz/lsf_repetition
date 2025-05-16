import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';

//gere le stocakge des decks dans la memoire
abstract class DeckRepository {
  Future<int> createDeck({required DeckModel deck});

  Future<List<DeckModel>> getAllDecks();
  Stream<List<DeckModel>> getAllDecksStream();

  Future<void> updateParentDeck({required List<int> cardsIds, int? newValue});

  Future<void> deleteDecks({required List<int> deckIds});
}
