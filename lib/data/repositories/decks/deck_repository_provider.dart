import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/domain/models/card_model/cards_filter.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

final allDecksProvider =
    NotifierProvider<AllDeckNotifier, AsyncValue<List<DeckModel>>>(
      AllDeckNotifier.new,
    );

final getDeckByIdProvider = AutoDisposeProviderFamily<DeckModel?, int>((
  ref,
  deckId,
) {
  final allDecks = ref.watch(allDecksProvider);
  return allDecks.maybeWhen(
    data: (decks) => decks.firstWhereOrNull((deck) => deck.id == deckId),
    orElse: () => null,
  );
});

final allCardsProvider = StreamProvider<List<FullCard>>(
  (ref) => ref.watch(decksRepositoryProvider).getAllCards(),
);

final cardsFilterProvider = NotifierProvider<CardsFilterNotifier, CardsFilter>(
  CardsFilterNotifier.new,
);

class CardsFilterNotifier extends Notifier<CardsFilter> {
  @override
  CardsFilter build() => CardsFilter();

  Timer? _timer;

  void updateName(String value) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(milliseconds: 300),
      (_) => state = state.copyWith(name: value),
    );
  }

  void updateDateFilter(DateFilter? date) =>
      state = state.copyWith(dateFilter: date);

  void updateRetentionState(RetentionState? retention) =>
      state = state.copyWith(retentionState: retention);

  void updateDeck(DeckModel? deck) => state = state.copyWith(deck: deck);

  void copyFrom(CardsFilter filter) => state = filter;
}

final filteredCardsProvider = Provider<AsyncValue<List<FullCard>>>((ref) {
  final allCards = ref.watch(allCardsProvider);
  final filter = ref.watch(cardsFilterProvider);

  if (!filter.hasActiveFilters) return allCards;
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

    if (filter.name.isNotEmpty) {
      filteredCards.retainWhere(
        (card) =>
            card.card.name.toLowerCase().contains(filter.name.toLowerCase()),
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
