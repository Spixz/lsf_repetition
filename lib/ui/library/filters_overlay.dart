import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/domain/models/card_model/cards_filter.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
class CardsFilterSettingsOverlay extends ConsumerWidget {
  const CardsFilterSettingsOverlay({
    required this.overlayController,
    super.key,
  });

  final OverlayPortalController overlayController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 21),
            padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 35),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(243, 237, 247, 1), //Colors.grey.shade200,
              border: Border(top: BorderSide(color: Colors.transparent)),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              spacing: 10,
              children: [
                _FilterByCreationDate(),
                SizedBox(height: 2),
                _FilterByLearningState(),
              ],
            ),
          ),
          Positioned(
            right: 7,
            child: IconButton(
              onPressed: () => overlayController.toggle(),
              icon: const Icon(
                Icons.cancel_sharp,
                size: 36,
                color: Color.fromRGBO(107, 97, 134, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterByCreationDate extends StatelessWidget {
  const _FilterByCreationDate({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      spacing: 12,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5,
          children: [
            Icon(Icons.swap_vert, size: 21, color: primaryColor),
            Text(
              context.tr("SortByCreationDate"),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _DateFilterChoiceTip(
              label: context.tr("Recent"),
              dateFilter: DateFilter.recent,
            ),
            _DateFilterChoiceTip(
              label: context.tr("Oldest"),
              dateFilter: DateFilter.oldest,
            ),
          ],
        ),
      ],
    );
  }
}

class _DateFilterChoiceTip extends ConsumerWidget {
  const _DateFilterChoiceTip({
    required this.label,
    required this.dateFilter,
    super.key,
  });

  final String label;
  final DateFilter dateFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(cardsFilterProvider);

    return ChoiceChip(
      label: Text(label),
      labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      labelStyle: TextStyle(fontSize: 12),
      selected: filter.dateFilter == dateFilter,
      onSelected: (_) {
        if (filter.dateFilter == dateFilter) {
          ref.read(cardsFilterProvider.notifier).updateDateFilter(null);
        } else {
          ref.read(cardsFilterProvider.notifier).updateDateFilter(dateFilter);
        }
      },
    );
  }
}

class _FilterByLearningState extends StatelessWidget {
  const _FilterByLearningState({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      spacing: 12,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 5,
          children: [
            Icon(Icons.psychology, size: 21, color: primaryColor),
            Text(
              context.tr("LearningState"),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            _RetentionStateChoiceTip(
              label: context.tr("ToLearn"),
              retentionState: RetentionState.newState,
            ),
            _RetentionStateChoiceTip(
              label: context.tr("InLearning"),
              retentionState: RetentionState.learning,
            ),
            _RetentionStateChoiceTip(
              label: context.tr("Learned"),
              retentionState: RetentionState.review,
            ),
          ],
        ),
      ],
    );
  }
}

class _RetentionStateChoiceTip extends ConsumerWidget {
  const _RetentionStateChoiceTip({
    required this.label,
    required this.retentionState,
    super.key,
  });

  final String label;
  final RetentionState retentionState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(cardsFilterProvider);

    return ChoiceChip(
      label: Text(label),
      labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      labelStyle: TextStyle(fontSize: 12),
      selected: filter.retentionState == retentionState,
      onSelected: (_) {
        if (filter.retentionState == retentionState) {
          ref.read(cardsFilterProvider.notifier).updateRetentionState(null);
        } else {
          ref
              .read(cardsFilterProvider.notifier)
              .updateRetentionState(retentionState);
        }
      },
    );
  }
}
