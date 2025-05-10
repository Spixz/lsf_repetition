import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/core/size.dart';
import 'package:apprendre_lsf/ui/review/providers/review_providers.dart';
import 'package:apprendre_lsf/ui/review/rating_bar.dart';
import 'package:apprendre_lsf/ui/review/review_card.dart';
import 'package:apprendre_lsf/ui/review/providers/review_ui_providers.dart';

class ReviewScreen extends ConsumerWidget {
  const ReviewScreen({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revisionState = ref.watch(revisionLogicProvider);
    final revisonDone = ref.read(revisionLogicProvider.notifier).revisionDone;
    final showAnswer = ref.watch(showAnswerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title, maxLines: 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(revisionLogicProvider.notifier).reset();
            Navigator.of(context).pop();
          },
        ),
        // backgroundColor: Color.fromRGBO(115, 17, 195, 1),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(10.0),
        //   child: Text("salut"),
        // ),
      ),
      body: Column(
        children: [
          _header(context, revisionState.cardsLeft),
          Expanded(child: ReviewCard()),
          if (!revisonDone) _bottomBar(showAnswer),
        ],
      ),
    );
  }

  Widget _header(BuildContext context, int cardsLeft) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _displayCardsLeft(context, cardsLeft),
          _SwapAnswerAndQuesion(),
        ],
      ),
    );
  }

  Widget _displayCardsLeft(BuildContext context, int left) {
    return Text(context.tr("XLeft", args: [left.toString()]));
  }

  Widget _bottomBar(bool showAnswer) {
    if (showAnswer) return RatingBarButtons();
    return _ShowAnswerBt();
  }
}

class _SwapAnswerAndQuesion extends ConsumerWidget {
  const _SwapAnswerAndQuesion({super.key});

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
      onTap: () => ref.read(showAnswerProvider.notifier).state = !showAnswer,
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
