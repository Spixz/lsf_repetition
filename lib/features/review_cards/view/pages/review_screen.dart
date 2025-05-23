import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/core/size.dart';
import 'package:apprendre_lsf/features/review_cards/data/providers/revision_usecase_notifier.dart';
import 'package:apprendre_lsf/features/review_cards/view/widgets/rating_bar.dart';
import 'package:apprendre_lsf/features/review_cards/view/widgets/review_card.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:apprendre_lsf/features/review_cards/view/providers/review_ui_providers_export.dart';

class ReviewScreen extends ConsumerStatefulWidget {
  const ReviewScreen({required this.title, super.key});
  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {
  late RevisionState revisionState;

  @override
  Widget build(BuildContext context) {
    revisionState = ref.watch(revisionUsecaseProvider);
    final revisonDone = ref.read(revisionUsecaseProvider.notifier).revisionDone;
    final showAnswer = ref.watch(showAnswerProvider);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(widget.title, maxLines: 1)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(revisionUsecaseProvider.notifier).reset();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            _header(context),
            Expanded(child: ReviewCard()),
            if (!revisonDone) _bottomBar(showAnswer),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_displayCardsLeft(context), _SwapAnswerAndQuestion()],
      ),
    );
  }

  Widget _displayCardsLeft(BuildContext context) {
    return Text(
      context.tr("XLeft", args: [revisionState.cardsLeft.toString()]),
    );
  }

  Widget _bottomBar(bool showAnswer) {
    if (showAnswer) return RatingBarButtons();
    return _ShowAnswerBt();
  }
}

class _SwapAnswerAndQuestion extends ConsumerWidget {
  const _SwapAnswerAndQuestion({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reverseCard = ref.watch(reverseCardProvider);

    return IconButton(
      onPressed:
          () => ref.read(reverseCardProvider.notifier).state = !reverseCard,
      icon: Icon(Icons.sync_alt_sharp),
    );
  }
}

class _ShowAnswerBt extends ConsumerWidget {
  const _ShowAnswerBt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAnswer = ref.watch(showAnswerProvider);

    return InkWell(
      onTap: () {
        ref.read(indexVideoSelectedRevisionScreenProvider.notifier).state = 0;
        ref.read(showAnswerProvider.notifier).state = !showAnswer;
      },
      child: Container(
        height: navbarHeight,
        width: double.infinity,
        color: Colors.grey.shade400,
        child: Align(
          alignment: Alignment.center,
          child: Text(context.tr("ShowTheAnswer")),
        ),
      ),
    );
  }
}
