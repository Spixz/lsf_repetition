import 'package:apprendre_lsf/shared/data/revision/providers/selected_revision_mode_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apprendre_lsf/shared/data/database/drift_database.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/features/dictionary/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/features/review_cards/data/providers/revision_usecase_notifier.dart';

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
        RevisionMode.training;
    RevisionState revisionState = container.read(revisionUsecaseProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);

    //verify the first card is the most recently added
    expect(
      container.read(revisionUsecaseProvider).cardToRevise?.card.name,
      "card 1",
    );
    expect(
      container.read(revisionUsecaseProvider).cardsLeft,
      allStoredCards.length,
    );
  });

  test('Test after again answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.training;
    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);

    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.again);

    //random answers just to skip the actuals cards
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionUsecaseProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('Test after hard answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.training;
    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);

    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.hard);

    //random answers just to skip the actuals cards
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionUsecaseProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('Test after good answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.training;
    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);

    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.good);

    //random answers just to skip the actuals cards
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionUsecaseProvider).cardToRevise,
      allStoredCards.first,
    );
  });

  test('After easy answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.training;
    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);
    //4 Cards to study

    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    //random answers just to skip the actuals cards
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    // The first card revised is now the first one
    expect(
      container.read(revisionUsecaseProvider).cardToRevise,
      allStoredCards.first,
    );
    // Anserwing easy a second time should remove it
    // cause after two easy answer the card is removed
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.easy);

    expect(
      container.read(revisionUsecaseProvider).cardsLeft,
      allStoredCards.length - 1,
    );
  });

  test('Test revision done', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.training;
    await container.read(revisionUsecaseProvider.notifier).init(allStoredCards);

    for (int i = 0; i < allStoredCards.length; i++) {
      await container
          .read(revisionUsecaseProvider.notifier)
          .submitAnswer(RetentionRating.easy);
      await container
          .read(revisionUsecaseProvider.notifier)
          .submitAnswer(RetentionRating.easy);
    }

    expect(container.read(revisionUsecaseProvider.notifier).revisionDone, true);
  });
}
