import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_deck_infos.dart';
import 'package:apprendre_lsf/domain/models/card_model/cards_filter.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final allStoredDecks = [
  DeckModel(id: 1, name: "deck 1", description: "premier deck"),
  DeckModel(id: 2, name: "deck 2", description: "second deck"),
];

final Card basicCard = Card(
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
    card: basicCard.copyWith(name: "test2", id: 2, createdAt: DateTime(2001)),
    deckInfos: CardDeckInfo(
      cardId: 2,
      deckId: 1,
      retentionCard: RetentionCard(
        due: DateTime.now(),
        lastReview: DateTime.now(),
        state: RetentionState.learning,
      ),
    ),
  ),
  FullCard(
    card: basicCard.copyWith(name: "test3", id: 3, createdAt: DateTime(2002)),
    deckInfos: CardDeckInfo(
      cardId: 3,
      deckId: 2,
      retentionCard: RetentionCard(
        due: DateTime.now(),
        lastReview: DateTime.now(),
        state: RetentionState.review,
      ),
    ),
  ),
  FullCard(
    card: basicCard.copyWith(name: "test4", id: 4, createdAt: DateTime(2003)),
    deckInfos: CardDeckInfo(
      cardId: 4,
      deckId: 2,
      retentionCard: RetentionCard(
        due: DateTime.now(),
        lastReview: DateTime.now(),
        state: RetentionState.learning,
      ),
    ),
  ),
];

void main() {
  test('List all card without filter', () async {
    final container = ProviderContainer(
      overrides: [
        allCardsProvider.overrideWith((ref) => Stream.value(allStoredCards)),
        cardsFilterProvider.overrideWith((ref) => null),
      ],
    );

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
        cardsFilterProvider.overrideWith(
          (ref) => CardsFilter(dateFilter: DateFilter.oldest),
        ),
      ],
    );

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
        cardsFilterProvider.overrideWith(
          (ref) => CardsFilter(dateFilter: DateFilter.recent),
        ),
      ],
    );

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
        cardsFilterProvider.overrideWith(
          (ref) => CardsFilter(retentionState: RetentionState.learning),
        ),
      ],
    );

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
        cardsFilterProvider.overrideWith(
          (ref) => CardsFilter(
            retentionState: RetentionState.review,
            deck: DeckModel(id: 2, name: "deck 2", description: "second deck"),
          ),
        ),
      ],
    );

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
        cardsFilterProvider.overrideWith(
          (ref) => CardsFilter(
            retentionState: RetentionState.learning,
            dateFilter: DateFilter.recent,
          ),
        ),
      ],
    );

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
}
