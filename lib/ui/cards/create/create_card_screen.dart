import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';
import 'package:apprendre_lsf/ui/decks/create/create_deck_dialog.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_model.dart';
import 'package:apprendre_lsf/ui/cards/create/providers/create_card_providers.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
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
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
            onPageChanged: onChange,
            children: <Widget>[SizedBox.expand(child: SelectDecks())],
          ),
          _NextButton(card: cardToCreate),
        ],
      ),
      floatingActionButton: _FAB(),
    );
  }

  void _onCardCreation(BuildContext context, AsyncValue<void> result) {
    result.when(
      data: (data) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SuccessSnackbar(message: context.tr("CreatedCard")));
        Navigator.of(context).pop();
      },
      error: (err, st) {
        debugPrint(err.toString());
        debugPrintStack(stackTrace: st);
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
          return CenteredMessage(message: context.tr("CreateADeckBefore"));
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

class _NextButton extends ConsumerWidget {
  const _NextButton({required this.card, super.key});
  final CardModel card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDecks = ref.watch(selectedDecksProvider);
    final enabled = selectedDecks.isNotEmpty;

    return Positioned(
      bottom: 100,
      child: SizedBox(
        width: context.width,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              if (enabled) {
                ref
                    .read(createCardsProvider.notifier)
                    .call(card: card, deckIds: selectedDecks);
                return;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                WarningSnackbar(message: context.tr("SelectAtLeastOneDeck")),
              );
            },
            style: _buttonStyle(enabled),
            child: Text(
              context.tr("Next"),
              style: TextStyle(
                color: enabled ? Colors.black : Colors.black.withAlpha(100),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle(bool enabled) => ButtonStyle(
    minimumSize: WidgetStatePropertyAll(Size(50, 40)),
    elevation: WidgetStatePropertyAll(enabled ? 10 : 4),
    backgroundColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.error)) {
        return Colors.red;
      }
      return enabled
          ? Colors.purple.shade200
          : Colors.purple.shade200.withAlpha(150);
    }),
    textStyle: WidgetStatePropertyAll(
      TextStyle(
        fontSize: 18,
        // fontWeight: FontWeight.w300,
      ),
    ),
  );
}
