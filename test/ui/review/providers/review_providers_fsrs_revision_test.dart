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
        .read(decksRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    RevisionState revisionState = container.read(revisionLogicProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionLogicProvider.notifier).init(null);

    //verify that the card without retention and with a due date
    //superior at now are not returned
    final dueCards =
        await container.read(decksRepositoryProvider).getDueCards();
    expect(dueCards.map((card) => card.card.name).toList(), ["test4", "test3"]);

    //verify the first card is the most recently added of the due
    expect(
      container.read(revisionLogicProvider).cardToRevise?.card.name,
      "test4",
    );

    expect(container.read(revisionLogicProvider).cardsLeft, 1);
  });

  test('Test removed of the due to list after answer', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    await container
        .read(decksRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    RevisionState revisionState = container.read(revisionLogicProvider);

    // test state before initialisation
    expect(revisionState, isA<RevisionStateInitial>());

    await container.read(revisionLogicProvider.notifier).init(null);

    //verify that the card without retention and with a due date
    //superior at now are not returned
    final dueCardsBeforeAnswer =
        await container.read(decksRepositoryProvider).getDueCards();
    await container
        .read(revisionLogicProvider.notifier)
        .submitAnswer(RetentionRating.again);
    final dueCardsAfterAnswer =
        await container.read(decksRepositoryProvider).getDueCards();
    expect(dueCardsAfterAnswer.length, dueCardsBeforeAnswer.length - 1);

    expect(
      container.read(revisionLogicProvider).cardToRevise?.card.name,
      "test3",
    );

    expect(container.read(revisionLogicProvider).cardsLeft, 0);
  });

  test('Test review is done', () async {
    final container = ProviderContainer(
      overrides: [driftDatabaseProvider.overrideWithValue(db)],
    );
    await container
        .read(decksRepositoryProvider)
        .createCards(fullCards: allStoredCards);

    container.read(selectedRevisionModeProvider.notifier).state =
        RevisionMode.fsrs;
    await container.read(revisionLogicProvider.notifier).init(null);

    final dueCardsBeforeAnswer =
        await container.read(decksRepositoryProvider).getDueCards();
    for (int i = 0; i < dueCardsBeforeAnswer.length; i++) {
      await container
          .read(revisionLogicProvider.notifier)
          .submitAnswer(RetentionRating.easy);
    }
    final dueCardsAfterAnswer =
        await container.read(decksRepositoryProvider).getDueCards();

    expect(dueCardsAfterAnswer.length, 0);
    expect(container.read(revisionLogicProvider.notifier).revisionDone, true);
  });
}
