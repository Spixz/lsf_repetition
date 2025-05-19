import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/common_widgets/empty.dart';
import 'package:apprendre_lsf/features/cards/view/widgets/create_deck_dialog.dart';
import 'package:apprendre_lsf/features/cards/view/providers/cards/selected_decks_notifier.dart';
import 'package:apprendre_lsf/features/cards/view/providers/cards/current_step_notifier.dart';

class FAB extends ConsumerWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(createCardStepProvider);

    return switch (currentPage) {
      CreateCardStep.selectDeck => FloatingActionButton(
        tooltip: context.tr("CreateADeck"),
        onPressed:
            () => showDialog(
              context: context,
              builder:
                  (_) => CreateDeckDialog(
                    onSuccess:
                        (int createdDeckId) => ref
                            .read(selectedDecksProvider.notifier)
                            .add(createdDeckId),
                  ),
            ),
        child: const Icon(Icons.add),
      ),
      _ => Empty(),
    };
  }
}
