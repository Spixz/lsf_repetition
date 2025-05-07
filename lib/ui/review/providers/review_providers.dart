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

  Future submitAnswer(RetentionRating rating) async {
    state = await logic.submitAnswer(rating);
  }

  bool get revisionDone =>
      state is! RevisionStateInitial &&
      state.cardToRevise == null &&
      state.cardsLeft <= 0;
}



// UI :
// @override
// Widget build() {
// 	final revSate = ref.watch<RevisionProvider>;
// 	final showSignFirst = ref.watch<bool>(showSignFirstProvider);

// 	//ne sera logiquement plus RevisionStateInitial après le 1er submitAnswer
// 	if (revSate is not RevisionError) {
// 		return RevisionError();	
// 	}
// 	if (revSate is not RevisionStateInitial && revState.cardToRevise == null) {
// 		return RevisionEnd();
// 	}
// 	return Column(
// 			children: [
// 				ToogleQuestionMode(showSignFirst),
// 				Question(revSate.cardToRevise),
// 			]
// 		)
// 		onTap() => ref.read<RevisionProvider>.submitAnswer(user_answer);
// 	}
// }

