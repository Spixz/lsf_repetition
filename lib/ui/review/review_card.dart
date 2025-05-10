import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';
import 'package:apprendre_lsf/ui/review/review_carousel.dart';
import 'package:apprendre_lsf/ui/review/providers/review_ui_providers.dart';

class ReviewCard extends ConsumerWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revisionState = ref.watch(revisionLogicProvider);
    final revisionDone = ref.read(revisionLogicProvider.notifier).revisionDone;
    final reverseCard = ref.watch(reverseCardProvider);
    final showAnswer = ref.watch(showAnswerProvider);

    if (revisionDone) return _revisionDone(context, ref);
    if (revisionState.cardToRevise == null) return Empty();

    final card = revisionState.cardToRevise!.card;

    if (showAnswer) {
      return _displayQuestionAndAnswer(card);
    } else if (reverseCard) {
      return _displayVideos(card.videosSigns);
    } else {
      return _displayCardName(card);
    }
  }

  Widget _displayCardName(CardModel card) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(card.name, style: TextStyle(fontSize: 21)),
    );
  }

  Widget _displayVideos(List<String> videosSigns) {
    return Column(
      children: [
        Expanded(child: ReviewCarousel(videoUrls: videosSigns)),
        ReviewCarouselPositionIndicator(lenght: videosSigns.length),
      ],
    );
  }

  Widget _displayQuestionAndAnswer(CardModel card) {
    return Column(
      children: [
        _displayCardName(card),
        Expanded(child: _displayVideos(card.videosSigns)),
      ],
    );
  }

  Widget _revisionDone(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(context.tr("ReviewDone")),
        TextButton(
          onPressed: () {
            context.pop();
            ref.read(revisionLogicProvider.notifier).reset();
          },
          child: Text(context.tr("Close")),
        ),
      ],
    );
  }
}
