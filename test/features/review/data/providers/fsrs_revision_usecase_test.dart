import 'package:apprendre_lsf/shared/data/revision/providers/selected_revision_mode_provider.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:apprendre_lsf/shared/data/database/drift_database.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/features/dictionaries/domain/models/lsf_dictionary_search_result.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/features/review_cards/data/providers/review_providers.dart';

final CardModel basicCard = CardModel(
  id: 1,
  name: "test1",
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
      due: DateTime.now().add(Duration(days: 4)),
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
      due: DateTime.now().subtract(Duration(days: 10)),
      lastReview: DateTime.now(),
      state: RetentionState.learning,
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
      due: DateTime.now().subtract(Duration(days: 10)),
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

  test('Test fsrs logic initialisation', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    await container
        .read(cardsRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    RevisionState revisionState = container.read(revisionUsecaseProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionUsecaseProvider.notifier).init(null);

    //verify that the card without retention and with a due date
    //superior at now are not returned
    final dueCards =
        await container.read(cardsRepositoryProvider).getDueCards();
    expect(dueCards.map((card) => card.card.name).toList(), ["test4", "test3"]);

    //verify the first card is the most recently added of the due
    expect(
      container.read(revisionUsecaseProvider).cardToRevise?.card.name,
      "test4",
    );

    expect(container.read(revisionUsecaseProvider).cardsLeft, 2);
  });

  test('Test removed of the due to list after answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    await container
        .read(cardsRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    RevisionState revisionState = container.read(revisionUsecaseProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionUsecaseProvider.notifier).init(null);

    //verify that the card without retention and with a due date
    //superior at now are not returned
    final dueCardsBeforeAnswer =
        await container.read(cardsRepositoryProvider).getDueCards();
    await container
        .read(revisionUsecaseProvider.notifier)
        .submitAnswer(RetentionRating.again);
    final dueCardsAfterAnswer =
        await container.read(cardsRepositoryProvider).getDueCards();
    expect(dueCardsAfterAnswer.length, dueCardsBeforeAnswer.length - 1);

    expect(
      container.read(revisionUsecaseProvider).cardToRevise?.card.name,
      "test3",
    );

    expect(container.read(revisionUsecaseProvider).cardsLeft, 1);
  });

  test('Test review is done', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    await container
        .read(cardsRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    await container.read(revisionUsecaseProvider.notifier).init(null);

    final dueCardsBeforeAnswer =
        await container.read(cardsRepositoryProvider).getDueCards();
    for (int i = 0; i < dueCardsBeforeAnswer.length; i++) {
      await container
          .read(revisionUsecaseProvider.notifier)
          .submitAnswer(RetentionRating.easy);
    }
    final dueCardsAfterAnswer =
        await container.read(cardsRepositoryProvider).getDueCards();

    expect(dueCardsAfterAnswer.length, 0);
    expect(container.read(revisionUsecaseProvider.notifier).revisionDone, true);
  });
}
