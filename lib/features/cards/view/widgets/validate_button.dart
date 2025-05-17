import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/features/cards/view/providers/create_card_providers.dart';

class ValidateButton extends ConsumerWidget {
  const ValidateButton({required this.card, super.key});
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
          children: [Text("Validate", style: TextStyle(fontSize: 16))],
        ),
      ),
    );
  }
}
