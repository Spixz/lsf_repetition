import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/card/card.dart';
import 'package:apprendre_lsf/global_providers.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

final createCardsProvider =
    NotifierProvider<CreateCardNotifier, AsyncValue<bool>>(
      CreateCardNotifier.new,
    );

class CreateCardNotifier extends Notifier<AsyncValue<bool>> {
  @override
  AsyncValue<bool> build() => AsyncData(false);

  Future call({required CardModel card, required List<int> deckIds}) async {
    try {
      state = AsyncLoading();
      final cardsRepository = ref.watch(cardsRepositoryProvider);
      List<FullCard> cardsToAdd;

      if (deckIds.isEmpty) {
        cardsToAdd = [
          FullCard(card: card, retentionCard: RetentionCard.initial()),
        ];
      } else {
        final cardsToAddInterable = deckIds.map(
          (deckId) => FullCard(
            card: card.copyWith(deckId: deckId),
            retentionCard: RetentionCard.initial(),
          ),
        );
        cardsToAdd = cardsToAddInterable.toList();
      }

      await cardsRepository.createCards(fullCards: cardsToAdd);
      state = AsyncData(true);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}
