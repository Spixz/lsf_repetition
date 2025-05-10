import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/core/size.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';
import 'package:apprendre_lsf/ui/review/providers/review_ui_providers.dart';

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
        child: Align(
          alignment: Alignment.center,
          child: Text(
            rating.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
