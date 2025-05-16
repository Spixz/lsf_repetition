import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/global_providers.dart';

typedef DeleteDeckInfos = ({List<int> deckIds, bool deleteCards});

final deleteDeckNotifierProvider =
    AutoDisposeAsyncNotifierProvider<DeleteDeckNotifier, bool>(
      DeleteDeckNotifier.new,
    );

class DeleteDeckNotifier extends AutoDisposeAsyncNotifier<bool> {
  @override
  FutureOr<bool> build() => false;

  Future<void> call({
    required List<int> deckIds,
    bool deleteCards = false,
  }) async {
    try {
      state = AsyncLoading();
      for (final deckId in deckIds) {
        final cardsInside = await ref
            .read(cardsRepositoryProvider)
            .getCardsOfADeck(deckId);
        final cardIds = cardsInside.map((card) => card.card.id!).toList();

        if (deleteCards) {
          ref
              .read(cardsRepositoryProvider)
              .deleteCards(cardsIds: cardIds); //+cardinfos
        } else {
          ref
              .read(decksRepositoryProvider)
              .updateParentDeck(cardsIds: cardIds, newValue: null);
        }
        await ref.read(decksRepositoryProvider).deleteDecks(deckIds: [deckId]);
      }
      state = AsyncData(true);
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }
}
