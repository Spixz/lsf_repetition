import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:apprendre_lsf/ui/core/loading_circle.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/cards/delete/providers/delete_card_provider.dart';
import 'package:apprendre_lsf/ui/core/customs_snackbars.dart';
import 'package:apprendre_lsf/ui/library/filters_overlay.dart';
import 'package:apprendre_lsf/routing/routes_name.dart';
import 'package:apprendre_lsf/ui/dictionaries/search/widgets/meaning/videos_dialog/dialog_meaning_videos.dart';
import 'package:apprendre_lsf/ui/core/empty.dart';

class ListCardsView extends ConsumerWidget {
  const ListCardsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _SearchBar(),
        _SelectedDeckChip(),
        Expanded(child: _ListCards()),
      ],
    );
  }
}

class _SearchBar extends ConsumerWidget {
  _SearchBar({super.key});
  final OverlayPortalController overlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCards = ref.watch(cardsFilterProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 8, right: 14),
      child: SearchAnchor(
        builder: (context, _) {
          return SearchBar(
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            onChanged:
                (query) =>
                    ref.read(cardsFilterProvider.notifier).updateName(query),
            leading: OverlayPortal(
              controller: overlayController,
              child: const Icon(Icons.search),
              overlayChildBuilder:
                  (context) => CardsFilterSettingsOverlay(
                    overlayController: overlayController,
                  ),
            ),
            trailing: <Widget>[
              Tooltip(
                message: 'Display filter',
                child: IconButton(
                  onPressed: () => overlayController.toggle(),
                  icon: Icon(
                    Icons.filter_alt,
                    color:
                        filteredCards.hasActiveFiltersExceptDeckAndName
                            ? context.primaryColor
                            : null,
                  ),
                ),
              ),
              Tooltip(
                message: 'Settings',
                child: IconButton(
                  onPressed: () => context.pushNamed(Routes.settings.name),
                  icon: Icon(Icons.settings),
                ),
              ),
            ],
          );
        },
        suggestionsBuilder: (_, __) => [],
      ),
    );
  }
}

class _ListCards extends ConsumerWidget {
  const _ListCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCards = ref.watch(filteredCardsProvider);

    return allCards.when(
      data: (cards) {
        return ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];

            return ListTile(
              title: Text(card.card.name),
              subtitle: SizedBox(
                height: 30,
                child: TextScroll(
                  card.card.meaning,
                  delayBefore: Duration(seconds: 1),
                  pauseBetween: Duration(seconds: 3),
                ),
              ),
              isThreeLine: false,
              trailing: _PopUpMenu(card: card),
              onTap:
                  () => showDialog(
                    context: context,
                    builder: (_) => DialogMeaningVideos(fullcard: card),
                  ),
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

class _SelectedDeckChip extends ConsumerWidget {
  const _SelectedDeckChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(cardsFilterProvider);

    if (filter.deck == null) {
      return Empty();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Chip(
            label: Text(filter.deck!.name),
            backgroundColor: Color.fromRGBO(236, 230, 240, 0.578),
            onDeleted: () {
              ref.read(cardsFilterProvider.notifier).updateDeck(null);
            },
          ),
        ],
      ),
    );
  }
}

class _PopUpMenu extends ConsumerWidget {
  const _PopUpMenu({required this.card, super.key});

  final FullCard card;

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
                        (BuildContext context) => _DeleteCardDialog(card: card),
                  ),
            ),
          ],
    );
  }
}

class _DeleteCardDialog extends ConsumerWidget {
  const _DeleteCardDialog({required this.card, super.key});

  final FullCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeckModel? deck;

    ref.listen(
      deleteCardNotifierProvider,
      (_, result) => _onCardDeletion(context, result),
    );

    if (card.belongToADeck) {
      deck = ref.watch(getDeckByIdProvider(card.card.deckId!));
    }

    return AlertDialog(
      title: Text(context.tr("CardDeletion")),
      content: _deletionConfirmationText(context, deck),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel deletion'),
          child: Text(context.tr("No")),
        ),
        TextButton(
          onPressed: () {
            ref.read(deleteCardNotifierProvider.notifier).call([card.card.id!]);
            Navigator.pop(context, 'Valid deletion');
          },
          child: Text(context.tr("Yes")),
        ),
      ],
    );
  }

  Widget _deletionConfirmationText(BuildContext context, DeckModel? deck) {
    if (deck != null) {
      return Text(
        context.tr(
          "ConfirmationCardDeletionFromDeck",
          args: [card.card.name, deck.name],
        ),
      );
    }
    return Text(context.tr("ConfirmationCardDeletion", args: [card.card.name]));
  }

  void _onCardDeletion(BuildContext context, AsyncValue result) {
    result.when(
      data: (wasExecuted) {
        if (wasExecuted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SuccessSnackbar(message: context.tr("CardDeletionSuccess")),
          );
        }
      },
      error: (err, st) {
        debugPrint(err.toString());
        debugPrint(st.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(ErrorSnackbar(message: context.tr("CardDeletionError")));
      },
      loading: () => null,
    );
  }
}
