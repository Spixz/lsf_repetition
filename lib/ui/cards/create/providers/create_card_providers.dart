import 'dart:async';

import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/global_providers.dart';

enum CreateCardStep { selectDeck, addDetails, review }

final createCardStepProvider =
    NotifierProvider<CurrentPageNotifier, CreateCardStep>(
      CurrentPageNotifier.new,
    );

class CurrentPageNotifier extends Notifier<CreateCardStep> {
  @override
  build() => CreateCardStep.selectDeck;

  void updateFromPageIndex(int index) {
    state =
        CreateCardStep.values.elementAtOrNull(index) ??
        CreateCardStep.selectDeck;
  }
}

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
      final deckRepository = ref.watch(decksRepositoryProvider);
      List<FullCard> cardsToAdd;

      if (deckIds.isEmpty) {
        cardsToAdd = [
          FullCard(card: card, retentionCard: RetentionCard.initial()),
        ];
      } else {
        cardsToAdd =
            deckIds
                .map(
                  (deckId) => FullCard(
                    card: card.copyWith(deckId: deckId),
                    retentionCard: RetentionCard.initial(),
                  ),
                )
                .toList();
      }

      await deckRepository.createCards(fullCards: cardsToAdd);
      state = AsyncData(true);
    } catch (err, st) {
      state = AsyncError(err, st);
    }
  }
}

final selectedDecksProvider =
    AutoDisposeNotifierProvider<SelectedDecksNotifier, List<int>>(
      SelectedDecksNotifier.new,
    );

class SelectedDecksNotifier extends AutoDisposeNotifier<List<int>> {
  @override
  List<int> build() => [];

  void add(int deckId) => state = state + [deckId];
  void remove(int deckId) =>
      state = List.of(state)..remove(deckId); //pas sence marcher
}
