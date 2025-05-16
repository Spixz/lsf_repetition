
import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';
import 'package:apprendre_lsf/shared/domain/usescases/revision_logic.dart';
import 'package:collection/collection.dart';

class TrainingRevisionUsecase extends RevisionLogic {
  TrainingRevisionUsecase({required super.cardsRepository});

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


