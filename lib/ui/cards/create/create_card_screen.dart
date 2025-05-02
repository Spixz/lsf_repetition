import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_dialog.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/ui/cards/create/providers/create_card_providers.dart';
import 'package:apprendre_lsf/ui/core/customs_snackbars.dart';

/// Page for selecting the decks to which the card will be added.
///
/// The user can use the plus button to create a new deck.
class CreateCardScreen extends ConsumerWidget {
  const CreateCardScreen({required this.cardToCreate, super.key});
  final CardModel cardToCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onChange =
        ref.read(createCardStepProvider.notifier).updateFromPageIndex;

    ref.listen(
      createCardsProvider,
      (_, next) => _onCardCreation(context, next),
    );

    return Scaffold(
      appBar: AppBar(actions: [_ValidateButton(card: cardToCreate)]),
      body: Stack(
        children: [
          PageView(
            onPageChanged: onChange,
            children: <Widget>[SizedBox.expand(child: SelectDecks())],
          ),
        ],
      ),
      floatingActionButton: _FAB(),
    );
  }

  void _onCardCreation(BuildContext context, AsyncValue result) {
    result.when(
      data: (wasExecuted) {
        if (wasExecuted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SuccessSnackbar(message: context.tr("CreatedCard")));
          Navigator.of(context).pop();
        }
      },
      error: (err, st) {
        debugPrint(err.toString());
        debugPrint(st.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          ErrorSnackbar(message: context.tr("unexpectedErrorHasOccurred")),
        );
      },
      loading: () => null,
    );
  }
}

class _FAB extends ConsumerWidget {
  const _FAB({super.key});

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

class _ValidateButton extends ConsumerWidget {
  const _ValidateButton({required this.card, super.key});
  final CardModel card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDecks = ref.watch(selectedDecksProvider);

    return Padding(
      padding: EdgeInsets.only(right: 6),
      child: TextButton(
        onPressed: () {
          ref
              .read(createCardsProvider.notifier)
              .call(card: card, deckIds: selectedDecks);
        },
        child: Row(
          children: [
            Text("Validate", style: TextStyle(fontSize: 16)),
            // Icon(
            //   Icons.check,
            //   size: 32,
            //   color: Theme.of(context).colorScheme.primary,
            // ),
          ],
        ),
      ),
    );
  }
}
