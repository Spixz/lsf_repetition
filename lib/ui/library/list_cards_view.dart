import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/deck/deck_model.dart';
import 'package:apprendre_lsf/ui/cards/delete/providers/delete_card_provider.dart';
import 'package:apprendre_lsf/ui/core/customs_snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';

import 'package:apprendre_lsf/data/repositories/decks/deck_repository_provider.dart';
import 'package:apprendre_lsf/ui/core/centered_message.dart';
import 'package:apprendre_lsf/ui/core/loading_circle.dart';
import 'package:apprendre_lsf/utils/extensions/extensions.dart';

class ListCardsView extends ConsumerWidget {
  const ListCardsView({super.key});

  void _onCardDeletion(BuildContext context, AsyncValue result) {
    result.when(
      data: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SuccessSnackbar(message: context.tr("CardDeletionSuccess")),
        );
      },
      error: (err, st) {
        debugPrint(err.toString());
        debugPrintStack(stackTrace: st);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(ErrorSnackbar(message: context.tr("CardDeletionError")));
      },
      loading: () => null,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allCards = ref.watch(allCardsProvider);

    ref.listen(
      deleteCardNotifierProvider,
      (_, result) => _onCardDeletion(context, result),
    );

    return allCards.when(
      data: (allCards) {
        return ListView.builder(
          itemCount: allCards.length,
          itemBuilder: (context, index) {
            final card = allCards[index];
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
                        (BuildContext context) => DeleteCardDialog(card: card),
                  ),
            ),
          ],
    );
  }
}

class DeleteCardDialog extends ConsumerWidget {
  const DeleteCardDialog({required this.card, super.key});

  final FullCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DeckModel? deck;

    if (card.belongToADeck) {
      deck = ref.watch(getDeckByIdProvider(card.deckInfos!.deckId));
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
}

// class _PopUpMenu extends StatelessWidget {
//   const _PopUpMenu({required this.viewModel});

//   final ArticleCardViewmodel viewModel;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PopupMenuButton(
//           icon: Icon(
//             Icons.more_vert,
//             color:
//                 (viewModel.article.status.notGenerated)
//                     ? Colors.grey.shade500
//                     : null,
//           ),
//           itemBuilder:
//               (BuildContext context) => <PopupMenuEntry<dynamic>>[
//                 PopupMenuItem(
//                   onTap: () {
//                     viewModel.playNext();
//                     context.read<DynamicTrackingService>().track(
//                       TrackingEvents.listenAfter.name,
//                     );
//                   },
//                   child: Text(context.tr('listenAfter')),
//                 ),
//                 PopupMenuItem(
//                   onTap: () {
//                     viewModel.addAtTheEnd();
//                     context.read<DynamicTrackingService>().track(
//                       TrackingEvents.addEndPlaylist.name,
//                     );
//                   },
//                   child: Text(context.tr('addEndOfReadingList')),
//                 ),
//                 PopupMenuItem(
//                   onTap: () {
//                     launchUrl(context, viewModel.article.url);
//                     context.read<DynamicTrackingService>().track(
//                       TrackingEvents.openInBrowser.name,
//                     );
//                   },
//                   child: Text(context.tr('OpenInBrowser')),
//                 ),
//                 PopupMenuItem(
//                   child: Text(
//                     context.tr('Delete'),
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                   onTap: () {
//                     context.read<DynamicTrackingService>().track(
//                       TrackingEvents.delete.name,
//                     );
//                     if (viewModel.articleIsInPlay()) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         WarningSnackbar(
//                           message: context.tr("ErrorCantDeletePlayingArticle"),
//                         ),
//                       );
//                       return;
//                     }
//                     if (viewModel.article.status.inGeneration) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         WarningSnackbar(
//                           message: context.tr(
//                             "ErrorArticleDeletionWhileGenerating",
//                           ),
//                         ),
//                       );
//                       return;
//                     }
//                     viewModel.deleteArticle.execute();
//                   },
//                 ),
//               ],
//         ),
//       ],
//     );
//   }
// }
