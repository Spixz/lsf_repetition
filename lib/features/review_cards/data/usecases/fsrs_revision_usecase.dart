import 'package:fsrs/fsrs.dart' as fsrs;

import 'package:apprendre_lsf/shared/data/cards/mappers/retention_card_fsrs_card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';

class FSRSRevisionUsecase extends RevisionLogic {
  FSRSRevisionUsecase({required super.cardsRepository});

  @override
  Future<RevisionState> init(List<FullCard>? cards) async {
    final cardLefts = await cardsRepository.getDueCards();

    state = RevisionState(
      cardToRevise: cardLefts.firstOrNull,
      cardsLeft: cardLefts.length,
    );
    return state;
  }

  @override
  Future<RevisionState> submitAnswer(RetentionRating rating) async {
    final FullCard card = state.cardToRevise!;
    final fsrsInst = fsrs.FSRS();
    final now = DateTime.now();
    final schedulingCards = fsrsInst.repeat(
      card.retentionCard!.toFsrsCard(),
      now,
    );

    final fsrs.Card updatedFsrsCard =
        schedulingCards[rating.toFsrsRating()]!.card;
    final RetentionCard retentionCardToUpdate = updatedFsrsCard
        .toRetentionCard()
        .copyWith(cardId: card.card.id);

    await cardsRepository.updateRetentionCard(retentionCardToUpdate);
    final cardLefts = await cardsRepository.getDueCards();

    state = RevisionState(
      cardToRevise: cardLefts.firstOrNull,
      cardsLeft: cardLefts.length,
    );
    return state;
  }
}