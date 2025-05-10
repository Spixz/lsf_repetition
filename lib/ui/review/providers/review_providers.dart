import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/domain/models/revision_logic.dart';

final selectedRevisionModeProvider = StateProvider((_) => RevisionMode.blanc);


final revisionLogicProvider =
    NotifierProvider<RevisionLogicNotifier, RevisionState>(
      RevisionLogicNotifier.new,
    );

class RevisionLogicNotifier extends Notifier<RevisionState> {
  late RevisionLogic logic;

  @override
  RevisionState build() {
    final revisionMode = ref.watch(selectedRevisionModeProvider);
    final deckRepository = ref.watch(decksRepositoryProvider);

    if (revisionMode == RevisionMode.blanc) {
      logic = BlancLogic(deckRepository: deckRepository);
    } else {
      logic = FSRSRevisionLogic(deckRepository: deckRepository);
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

  bool get revisionDone =>
      state is! RevisionStateInitial &&
      state.cardToRevise == null &&
      state.cardsLeft <= 0;
}
