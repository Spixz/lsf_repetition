import 'package:apprendre_lsf/domain/database/drift_database.dart';
import 'package:fsrs/fsrs.dart' as fsrs;

import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

extension RetentionRatingExtension on RetentionRating {
  fsrs.Rating toFsrsRating() => fsrs.Rating.values[index];
}

extension RetentionStateExtension on RetentionState {
  fsrs.State toFsrsState() => fsrs.State.values[index];
}

extension FsrsStateExtension on fsrs.State {
  RetentionState toRetentionState() => RetentionState.values[index];
}

extension RetentionCardExtension on RetentionCard {
  fsrs.Card toFsrsCard() => fsrs.Card.def(
    due,
    lastReview,
    stability,
    difficulty,
    elapsedDays,
    scheduledDays,
    reps,
    lapses,
    state.toFsrsState(),
  );

  RetentionTableData toRetentionTableDatas() => RetentionTableData(
    cardId: cardId ?? -1,
    due: due,
    lastReview: lastReview,
    stability: stability,
    difficulty: difficulty,
    elapsedDays: elapsedDays,
    scheduledDays: scheduledDays,
    reps: reps,
    lapses: lapses,
    state: state,
  );
}

extension FsrsCardExtension on fsrs.Card {
  RetentionCard toRetentionCard() => RetentionCard(
    due: due,
    lastReview: lastReview,
    stability: stability,
    difficulty: difficulty,
    elapsedDays: elapsedDays,
    scheduledDays: scheduledDays,
    reps: reps,
    lapses: lapses,
    state: state.toRetentionState(),
  );
}

extension RetentionTableExtension on RetentionTableData {
  RetentionCard toRetentionCard() => RetentionCard(
    cardId: cardId,
    due: due,
    lastReview: lastReview,
    stability: stability,
    difficulty: difficulty,
    elapsedDays: elapsedDays,
    scheduledDays: scheduledDays,
    reps: reps,
    lapses: lapses,
    state: state,
  );
}
