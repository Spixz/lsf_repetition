import 'package:collection/collection.dart';
import 'package:fsrs/fsrs.dart' as fsrs;

import 'package:apprendre_lsf/data/repositories/decks/decks_repository.dart';
import 'package:apprendre_lsf/domain/mappers/retention_card_fsrs_card.dart';
import 'package:apprendre_lsf/domain/models/card_model/full_card.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

enum RevisionMode { blanc, fsrs }

class RevisionState {
  RevisionState({required this.cardsLeft, this.cardToRevise});

  int cardsLeft;
  FullCard? cardToRevise;
}

class RevisionStateInitial extends RevisionState {
  RevisionStateInitial() : super(cardsLeft: 0, cardToRevise: null);
}

class RevisionStateError extends RevisionState {
  RevisionStateError() : super(cardsLeft: 0, cardToRevise: null);
}

abstract class RevisionLogic {
  RevisionLogic({required this.deckRepository});

  final DecksRepository deckRepository;
  late RevisionState state;

  Future<RevisionState> init(List<FullCard>? cards);
  Future<RevisionState> submitAnswer(RetentionRating rating);
}

class BlancLogic extends RevisionLogic {
  BlancLogic({required super.deckRepository});

  final removeAfterXEasy = 2;
  List<FullCard> _cardsToRevise = [];
  final List<FullCard> _cardInSuccess = [];

  @override
  Future<RevisionState> init(List<FullCard>? cards) async {
    if (cards == null) {
      state = RevisionStateError();
      return state;
    }

    _cardsToRevise = cards.map((card) => card.copyWith()).toList();
    _cardsToRevise =
        _cardsToRevise
            .sortedBy((card) => card.card.createdAt!)
            .reversed
            .toList();

    state = RevisionState(
      cardToRevise: _cardsToRevise.firstOrNull,
      cardsLeft: _cardsToRevise.length,
    );
    return state;
  }

  @override
  Future<RevisionState> submitAnswer(RetentionRating rating) async {
    try {
      final actualCard = state.cardToRevise!;
      final timesCardSuccess =
          _cardInSuccess
              .where((card) => actualCard.card.id == card.card.id)
              .length;

      switch (rating) {
        case (RetentionRating.easy):
          if (timesCardSuccess + 1 < removeAfterXEasy) {
            reinsertCardAtPercent(actualCard, 0.8);
          }
          _cardInSuccess.add(actualCard);
          break;
        case (RetentionRating.good):
          reinsertCardAtPercent(actualCard, 0.5);
          break;
        case (RetentionRating.hard):
          insertAfterNCards(actualCard, 2);
          break;
        case (RetentionRating.again):
          insertAfterNCards(actualCard, 1);
      }

      _cardsToRevise.removeAt(0);

      state = RevisionState(
        cardToRevise: _cardsToRevise.firstOrNull,
        cardsLeft: _cardsToRevise.length,
      );
      return state;
    } catch (_) {
      return RevisionStateError();
    }
  }

  //      poped | NEXT
  //0 => [actual, ici]
  //1 => [actual, next, ici]
  void insertAfterNCards(FullCard card, int inXCard) {
    try {
      _cardsToRevise.insert(inXCard + 1, card);
    } catch (_) {
      _cardsToRevise.add(card);
    }
  }

  //[3] 50% => index 1 [x, ici, x, x]
  void reinsertCardAtPercent(FullCard card, double percent) {
    final index = (_cardsToRevise.length * percent).truncate();
    insertAfterNCards(card, index);
  }
}

class FSRSRevisionLogic extends RevisionLogic {
  FSRSRevisionLogic({required super.deckRepository});

  @override
  Future<RevisionState> init(List<FullCard>? cards) async {
    final cardLefts = await deckRepository.getDueCards();

    state = RevisionState(
      cardToRevise: cardLefts.firstOrNull,
      cardsLeft: cardLefts.length,
    );
    return state;
  }

  @override
  Future<RevisionState> submitAnswer(RetentionRating rating) async {
    final FullCard card = state.cardToRevise!;
    final fsrsInst = fsrs.FSRS();
    final now = DateTime.now();
    final schedulingCards = fsrsInst.repeat(
      card.retentionCard!.toFsrsCard(),
      now,
    );

    final fsrs.Card updatedFsrsCard =
        schedulingCards[rating.toFsrsRating()]!.card;
    final RetentionCard retentionCardToUpdate = updatedFsrsCard
        .toRetentionCard()
        .copyWith(cardId: card.card.id);

    await deckRepository.updateRetentionCard(retentionCardToUpdate);
    final cardLefts = await deckRepository.getDueCards();

    state = RevisionState(
      cardToRevise: cardLefts.firstOrNull,
      cardsLeft: cardLefts.length,
    );
    return state;
  }
}
