import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/cards_filter.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/features/library/view/providers/card_filter_notifier.dart';
import 'package:apprendre_lsf/features/library/view/providers/filtered_cards_provider.dart';
import 'package:apprendre_lsf/shared/data/cards/providers/cards_repository_provider.dart';

final allStoredDecks = [
  DeckModel(id: 1, name: "deck 1", description: "premier deck"),
  DeckModel(id: 2, name: "deck 2", description: "second deck"),
];

final CardModel basicCard = CardModel(
  id: 1,
  name: "card 1",
  typology: "v",
  meaning: "uno",
  videosSigns: [],
  sourceDictionnary: LsfDictionaryName.elix,
  createdAt: DateTime(2000),
);

final allStoredCards = [
  FullCard(card: basicCard),
  FullCard(
    card: basicCard.copyWith(
      name: "test2",
      id: 2,
      deckId: 1,
      createdAt: DateTime(2001),
    ),
    retentionCard: RetentionCard(
      due: DateTime.now(),
      lastReview: DateTime.now(),
      state: RetentionState.learning,
    ),
  ),
  FullCard(
    card: basicCard.copyWith(
      name: "test3",
      id: 3,
      deckId: 2,
      createdAt: DateTime(2002),
    ),
    retentionCard: RetentionCard(
      due: DateTime.now(),
      lastReview: DateTime.now(),
      state: RetentionState.review,
    ),
  ),
  FullCard(
    card: basicCard.copyWith(
      name: "test4",
      id: 4,
      deckId: 2,
      createdAt: DateTime(2003),
    ),
    retentionCard: RetentionCard(
      due: DateTime.now(),
      lastReview: DateTime.now(),
      state: RetentionState.learning,
    ),
  ),
];

void main() {
  test('List all card without filter', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    container.read(cardsFilterProvider.notifier).copyFrom(CardsFilter());

    expect(
      container.read(filteredCardsProvider),
      AsyncLoading<List<FullCard>>(),
    );

    await container.pump();

    expect(container.read(filteredCardsProvider), AsyncData(allStoredCards));
  });

  test('Filter by the oldest card', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(dateFilter: DateFilter.oldest);

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    expect(filteredCardsIds, [1, 2, 3, 4]);
  });

  test('Filter by the newest card', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(dateFilter: DateFilter.recent);

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    expect(filteredCardsIds, [4, 3, 2, 1]);
  });

  test('Filter by learning state (learning)', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(retentionState: RetentionState.learning);

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    // The lists are equals but items are not obligatory in the same order.
    final areListEquals = const UnorderedIterableEquality().equals(
      filteredCardsIds,
      [2, 4],
    );

    expect(areListEquals, true);
  });

  test('Filter by deck and learning state (review)', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(
      retentionState: RetentionState.review,
      deck: DeckModel(id: 2, name: "deck 2", description: "second deck"),
    );

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    final areListEquals = const UnorderedIterableEquality().equals(
      filteredCardsIds,
      [3],
    );

    expect(areListEquals, true);
  });

  test('Filter by learning state (learning) and date (oldest)', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(
      retentionState: RetentionState.learning,
      dateFilter: DateFilter.recent,
    );

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    expect(filteredCardsIds, [4, 2]);
  });

  test('Filter by empty name (text query)', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(name: '');

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    expect(container.read(filteredCardsProvider), AsyncData(allStoredCards));
  });

  test('Filter by name', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
      ],
    );
    final filter = CardsFilter(name: 'te');

    container.read(cardsFilterProvider.notifier).copyFrom(filter);
    container.read(filteredCardsProvider);
    await container.pump();

    final filteredCardsIds =
        container
            .read(filteredCardsProvider)
            .value!
            .map((card) => card.card.id)
            .toList();

    expect(filteredCardsIds, [2, 3, 4]);
  });
}
