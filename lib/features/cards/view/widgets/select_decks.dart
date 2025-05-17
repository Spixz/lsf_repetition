import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/features/cards/view/providers/create_card_providers.dart';
import 'package:apprendre_lsf/shared/data/decks/providers/deck_repository_provider.dart';
import 'package:apprendre_lsf/common_widgets/centered_message.dart';

class SelectDecks extends ConsumerWidget {
  const SelectDecks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDecks = ref.watch(allDecksProvider);
    final selectedDecksIds = ref.watch(selectedDecksProvider);

    return allDecks.when(
      data: (allDecks) {
        if (allDecks.isEmpty) {
          return CenteredMessage(
            message: context.tr("OrganizeYourCardsInFolder"),
          );
        }
        return _buildAllDecksCheckbox(ref, allDecks, selectedDecksIds);
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(context.tr("AnErrorHasOccured"))),
    );
  }

  Widget _buildAllDecksCheckbox(
    WidgetRef ref,
    List<DeckModel> allDecks,
    List<int> selectedDecksIds,
  ) {
    return ListView.builder(
      itemCount: allDecks.length,
      itemBuilder: (_, index) {
        final deck = allDecks[index];
        final isSelected = selectedDecksIds.contains(deck.id);

        return CheckboxListTile(
          value: isSelected,
          onChanged: (value) {
            if (isSelected) {
              return ref.read(selectedDecksProvider.notifier).remove(deck.id!);
            } else {
              return ref.read(selectedDecksProvider.notifier).add(deck.id!);
            }
          },
          title: Text(deck.name),
        );
      },
    );
  }
}
