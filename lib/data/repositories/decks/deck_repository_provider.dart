import 'dart:async';

import 'package:apprendre_lsf/domain/models/card_model/cards_filter.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';

final allDecksProvider =
    NotifierProvider<AllDeckNotifier, AsyncValue<List<DeckModel>>>(
      AllDeckNotifier.new,
    );

final allCardsProvider = StreamProvider<List<FullCard>>(
  (ref) => ref.watch(decksRepositoryProvider).getAllCards(),
);

final cardsFilterProvider = StateProvider<CardsFilter?>((_) => null);

final filteredCardsProvider = Provider<AsyncValue<List<FullCard>>>((ref) {
  final allCards = ref.watch(allCardsProvider);
  final filter = ref.watch(cardsFilterProvider);

  if (filter == null) return allCards;
  if (allCards.hasValue) {
    final filteredCards =
        allCards.value!.where((card) {
          if (filter.retentionState != null &&
              card.deckInfos?.retentionCard.state != filter.retentionState) {
            return false;
          }
          if (filter.deck != null &&
              card.deckInfos?.deckId != filter.deck!.id) {
            return false;
          }
          return true;
        }).toList();

    if (filter.dateFilter == DateFilter.recent) {
      filteredCards.sort(
        (a, b) => b.card.createdAt!.compareTo(a.card.createdAt!),
      );
    }

    if (filter.dateFilter == DateFilter.oldest) {
      filteredCards.sort(
        (a, b) => a.card.createdAt!.compareTo(b.card.createdAt!),
      );
    }
    return AsyncData(filteredCards.toList());
  }
  return allCards;
});

class AllDeckNotifier extends Notifier<AsyncValue<List<DeckModel>>> {
  late StreamSubscription allDecksStreamSubcription;

  @override
  AsyncValue<List<DeckModel>> build() {
    final allDeckStream =
        ref.watch(decksRepositoryProvider).getAllDecksStream();
    allDecksStreamSubcription = allDeckStream.listen((data) {
      state = AsyncData(data);
    });
    ref.onDispose(dispose);
    return AsyncLoading();
  }

  void dispose() {
    allDecksStreamSubcription.cancel();
  }
}
