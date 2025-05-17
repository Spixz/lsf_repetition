import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/features/cards/view/providers/create_card_providers.dart';
import 'package:apprendre_lsf/common_widgets/customs_snackbars.dart';
import 'package:apprendre_lsf/features/cards/view/widgets/fab.dart';
import 'package:apprendre_lsf/features/cards/view/widgets/select_decks.dart';
import 'package:apprendre_lsf/features/cards/view/widgets/validate_button.dart';

/// Page for selecting the decks to which the card will be added.
///
/// The user can use the plus button to create a new deck.
class CreateCardScreen extends ConsumerWidget {
  const CreateCardScreen({required this.cardToCreate, super.key});
  final CardModel cardToCreate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onStepChange =
        ref.read(createCardStepProvider.notifier).updateFromPageIndex;

    ref.listen(
      createCardsProvider,
      (_, next) => _onCardCreation(context, next),
    );

    return Scaffold(
      appBar: AppBar(actions: [ValidateButton(card: cardToCreate)]),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            PageView(
              onPageChanged: onStepChange,
              children: <Widget>[SizedBox.expand(child: SelectDecks())],
            ),
          ],
        ),
      ),
      floatingActionButton: FAB(),
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
