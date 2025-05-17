import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsrs/fsrs.dart' as fsrs;

import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:apprendre_lsf/shared/data/cards/mappers/retention_card_fsrs_card.dart';
import 'package:apprendre_lsf/features/review_cards/data/usecases/fsrs_revision_usecase.dart';
import 'package:apprendre_lsf/features/review_cards/data/usecases/training_revision_usecase.dart';
import 'package:apprendre_lsf/shared/data/revision/providers/selected_revision_mode_provider.dart';

final revisionUsecaseProvider =
    NotifierProvider<RevisionUsecaseNotifier, RevisionState>(
      RevisionUsecaseNotifier.new,
    );

class RevisionUsecaseNotifier extends Notifier<RevisionState> {
  late RevisionLogic logic;

  @override
  RevisionState build() {
    final revisionMode = ref.watch(selectedRevisionModeProvider);
    final cardsRepository = ref.watch(cardsRepositoryProvider);

    if (revisionMode == RevisionMode.training) {
      logic = TrainingRevisionUsecase(cardsRepository: cardsRepository);
    } else {
      logic = FSRSRevisionUsecase(cardsRepository: cardsRepository);
    }
    return RevisionStateInitial();
  }

  Future init(List<FullCard>? cards) async {
    state = await logic.init(cards);
  }

  void reset() {
    state = RevisionStateInitial();
  }

  Future submitAnswer(RetentionRating rating) async {
    state = await logic.submitAnswer(rating);
  }

  Duration calculateDurationBeforeNextDue(RetentionRating rating) {
    final fsrsInst = fsrs.FSRS();
    final now = DateTime.now();
    final schedules = fsrsInst.repeat(
      state.cardToRevise!.retentionCard!.toFsrsCard(),
      now,
    );

    final nextDueAt = schedules[rating.toFsrsRating()]!.card.due;
    return Duration(seconds: nextDueAt.difference(now).inSeconds);
  }

  bool get revisionDone =>
      state is! RevisionStateInitial &&
      state.cardToRevise == null &&
      state.cardsLeft <= 0;
}
