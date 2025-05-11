import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/core/size.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';
import 'package:apprendre_lsf/ui/review/providers/review_ui_providers.dart';
import 'package:apprendre_lsf/domain/models/revision_logic.dart';
import 'package:apprendre_lsf/utils/duration_formatter.dart';

class RatingBarButtons extends StatelessWidget {
  RatingBarButtons({super.key});
  final List<Color> ratingColors = [
    Colors.red,
    Colors.grey,
    Colors.green,
    Colors.blue.shade700,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        RetentionRating.values.length,
        (index) => Flexible(
          child: _RatingButton(
            rating: RetentionRating.fromIndex(index),
            color: ratingColors[index],
          ),
        ),
      ),
    );
  }
}

class _RatingButton extends ConsumerWidget {
  const _RatingButton({required this.rating, required this.color, super.key});
  final RetentionRating rating;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revisionMode = ref.watch(selectedRevisionModeProvider);
    final displayTimeBeforeNextDue = revisionMode == RevisionMode.fsrs;

    return InkWell(
      onTap: () {
        ref.read(revisionLogicProvider.notifier).submitAnswer(rating);
        ref.read(showAnswerProvider.notifier).state =
            !ref.read(showAnswerProvider);
      },
      child: Container(
        height: navbarHeight - 10,
        width: double.infinity,
        color: color,
        child:
            (displayTimeBeforeNextDue)
                ? _displayRatingWithNextDue(context, ref, rating)
                : _displayRatingOnly(rating),
      ),
    );
  }

  Widget _displayRatingOnly(RetentionRating rating) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        rating.name,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }

  Widget _displayRatingWithNextDue(
    BuildContext context,
    WidgetRef ref,
    RetentionRating rating,
  ) {
    final elapsedTime = ref
        .read(revisionLogicProvider.notifier)
        .calculateDurationBeforeNextDue(rating);
    final trEntry = DurationFormatter.abreviate(elapsedTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 3,
      children: [
        FittedBox(
          child: Text(
            context.tr(rating.name),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
        FittedBox(
          child: FittedBox(
            child: Text(
              context.tr(trEntry.i18nIndex, args: trEntry.args),
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
