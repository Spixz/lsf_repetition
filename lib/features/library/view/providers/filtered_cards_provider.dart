import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/data/cards/providers/cards_repository_provider.dart';
import 'package:apprendre_lsf/features/library/view/providers/card_filter_notifier.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card_export.dart';

//TODO : convert this filter in drift query to improve performance
final filteredCardsProvider = AutoDisposeProvider<AsyncValue<List<FullCard>>>((
  ref,
) {
  final allCards = ref.watch(allCardsProvider);
  final filter = ref.watch(cardsFilterProvider);

  if (!filter.hasActiveFilters) return allCards;
  if (allCards.hasValue) {
    final filteredCards =
        allCards.value!.where((card) {
          if (filter.retentionState != null &&
              card.retentionCard?.state != filter.retentionState) {
            return false;
          }
          if (filter.deck != null && card.card.deckId != filter.deck!.id) {
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
