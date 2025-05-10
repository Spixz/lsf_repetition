import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/domain/models/revision_logic.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';

final CardModel basicCard = CardModel(
  id: 1,
  name: "card 1",
  typology: "v",
  meaning: "uno",
  videosSigns: [],
  sourceDictionnary: LsfDictionaryName.elix,
  createdAt: DateTime(2003),
);

final allStoredCards = [
  FullCard(card: basicCard),
  FullCard(
    card: basicCard.copyWith(
      name: "test2",
      id: 2,
      deckId: 1,
      createdAt: DateTime(2002),
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
      createdAt: DateTime(2001),
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
      createdAt: DateTime(2000),
    ),
    retentionCard: RetentionCard(
      due: DateTime.now(),
      lastReview: DateTime.now(),
      state: RetentionState.learning,
    ),
  ),
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AppDriftDatabase db;

  setUp(() {
    db = AppDriftDatabase.executor(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('Test logic initialisation', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    RevisionState revisionState = container.read(revisionLogicProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionLogicProvider.notifier).init(allStoredCards);

    //verify the first card is the most recently added
    expect(
      container.read(revisionLogicProvider).cardToRevise?.card.name,
      "card 1",
    );
    expect(
      container.read(revisionLogicProvider).cardsLeft,
      allStoredCards.length,
    );
  });

  test('Test after again answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    await container.read(revisionLogicProvider.notifier).init(allStoredCards);

    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.again);

    //random answers just to skip the actuals cards
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionLogicProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('Test after hard answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    await container.read(revisionLogicProvider.notifier).init(allStoredCards);

    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.hard);

    //random answers just to skip the actuals cards
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionLogicProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('Test after good answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    await container.read(revisionLogicProvider.notifier).init(allStoredCards);

    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.good);

    //random answers just to skip the actuals cards
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionLogicProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('After easy answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    await container.read(revisionLogicProvider.notifier).init(allStoredCards);
    //4 Cards to study

    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    //random answers just to skip the actuals cards
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    // The first card revised is now the first one
    expect(
      container.read(revisionLogicProvider).cardToRevise,
      allStoredCards.first,
    );
    // Anserwing easy a second time should remove it
    // cause after two easy answer the card is removed
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionLogicProvider).cardsLeft,
      allStoredCards.length - 1,
    );
  });

  test('Test revision done', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.blanc;
    await container.read(revisionLogicProvider.notifier).init(allStoredCards);

    for (int i = 0; i < allStoredCards.length; i++) {
      await container
          .read(revisionLogicProvider.notifier)
          .submitAnswer(RetentionRating.easy);
      await container
          .read(revisionLogicProvider.notifier)
          .submitAnswer(RetentionRating.easy);
    }

    expect(container.read(revisionLogicProvider.notifier).revisionDone, true);
  });
}
