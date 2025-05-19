// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/shared/data/decks/providers/deck_repository_provider.dart';
import 'package:apprendre_lsf/common_widgets/common_widgets_export.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:apprendre_lsf/shared/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/features/cards/view/providers/decks/delete_deck_notifier.dart';
import 'package:apprendre_lsf/features/library/view/providers/checkbox_delete_deck_with_cards.dart';
import 'package:apprendre_lsf/features/library/view/providers/library_on_dispose_provider.dart';
import 'package:apprendre_lsf/shared/data/cards/providers/cards_repository_provider.dart';
import 'package:apprendre_lsf/features/library/view/providers/card_filter_notifier.dart';

class ListDecksView extends ConsumerWidget {
  const ListDecksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [Expanded(child: _ListDecks())]);
  }
}

class _ListDecks extends ConsumerWidget {
  const _ListDecks();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDecks = ref.watch(allDecksProvider);

    return allDecks.when(
      data: (decks) {
        if (decks.isEmpty) {
          return CenteredMessage(message: context.tr("NoDeckYet"));
        }
        return ListView.builder(
          itemCount: decks.length,
          itemBuilder: (context, index) {
            final deck = decks[index];
            final numberOfCards = ref
                .watch(getCardsOfADeckProvider(deck.id!))
                .maybeWhen(data: (cards) => cards.length, orElse: () => 0);

            return ListTile(
              title: Text(deck.name),
              subtitle: SizedBox(
                height: 30,
                child: TextScroll(
                  "$numberOfCards cards",
                  delayBefore: Duration(seconds: 1),
                  pauseBetween: Duration(seconds: 3),
                ),
              ),
              isThreeLine: false,
              trailing: _PopUpMenu(deck: deck),
              onTap: () {
                ref.read(cardsFilterProvider.notifier).clear();
                ref.read(cardsFilterProvider.notifier).updateDeck(deck);
                DefaultTabController.maybeOf(
                  context,
                )?.animateTo(LibraryTab.cards.index);
              },
            );
          },
        );
      },
      error:
          (_, __) => CenteredMessage(message: context.tr("ErrorLoadingCards")),
      loading: () => SizedBox(height: context.height, child: LoadingCircle()),
    );
  }
}

class _PopUpMenu extends ConsumerWidget {
  const _PopUpMenu({required this.deck});

  final DeckModel deck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      itemBuilder:
          (context) => [
            PopupMenuItem(
              child: Text(context.tr("Delete")),
              onTap:
                  () => showDialog<String>(
                    context: context,
                    builder:
                        (BuildContext context) => _DeleteDeckDialog(deck: deck),
                  ),
            ),
          ],
    );
  }
}

class _DeleteDeckDialog extends ConsumerStatefulWidget {
  const _DeleteDeckDialog({required this.deck});
  final DeckModel deck;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __DeleteDeckDialogState();
}

class __DeleteDeckDialogState extends ConsumerState<_DeleteDeckDialog> {
  @override
  Widget build(BuildContext context) {
    final numberOfCards = ref
        .watch(getCardsOfADeckProvider(widget.deck.id!))
        .maybeWhen(data: (cards) => cards.length, orElse: () => 0);

    ref.listen(
      deleteDeckNotifierProvider,
      (_, result) => _onDeckDeletion(context, result),
    );

    return AlertDialog(
      title: Text(context.tr("DeckDeletion")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Text(
            context.tr(
              "ConfirmationDeckDeletion",
              args: [widget.deck.name, "$numberOfCards"],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: ref.watch(checkboxStatusDeleteWithCardsProvider),
                onChanged: (newValue) {
                  ref
                      .read(checkboxStatusDeleteWithCardsProvider.notifier)
                      .state = newValue ?? false;
                },
              ),
              Expanded(
                child: Text(
                  context.tr("DeleteCardsItContain", args: ["$numberOfCards"]),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel deletion'),
          child: Text(context.tr("No")),
        ),
        TextButton(
          onPressed: () async {
            await ref
                .read(deleteDeckNotifierProvider.notifier)
                .call(
                  deckIds: [widget.deck.id!],
                  deleteCards: ref.read(checkboxStatusDeleteWithCardsProvider),
                );
            if (mounted) {
              Navigator.pop(context, 'Valid deletion');
            }
          },
          child: Text(context.tr("Yes")),
        ),
      ],
    );
  }

  void _onDeckDeletion(BuildContext context, AsyncValue result) {
    result.when(
      data: (wasExecuted) {
        if (wasExecuted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SuccessSnackbar(message: context.tr("DeckDeletionSuccess")),
          );
        }
      },
      error: (err, st) {
        debugPrint(err.toString());
        debugPrint(st.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(ErrorSnackbar(message: context.tr("DeckDeletionError")));
      },
      loading: () => null,
    );
  }
}
