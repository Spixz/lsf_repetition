import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/common_widgets/empty.dart';
import 'package:apprendre_lsf/features/user_progress/view/providers/total_added_cards_provider.dart';
import 'package:apprendre_lsf/features/user_progress/view/providers/total_learned_cards_provider.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalLearnedCards = ref
        .watch(totalLearnedCardsProvider)
        .maybeWhen(data: (count) => count, orElse: () => 0);

    final totalAddedCards = ref
        .watch(totalAddedCardsProvider)
        .maybeWhen(data: (count) => count, orElse: () => 0);

    return Scaffold(
      appBar: AppBar(title: Text("Statistiques")),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              Text(context.tr("Total"), style: TextStyle(fontSize: 24)),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _CardInfos(
                        value: totalAddedCards.toString(),
                        label: context.tr("AddedSigns"),
                      ),
                      _separator(),
                      _CardInfos(
                        value: totalLearnedCards.toString(),
                        label: context.tr("SignsLearned"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _separator() {
    return Container(
      height: 40,
      width: 3,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Empty(),
    );
  }
}

class _CardInfos extends StatelessWidget {
  const _CardInfos({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Text(label),
      ],
    );
  }
}
