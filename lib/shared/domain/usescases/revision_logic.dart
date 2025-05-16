import 'package:apprendre_lsf/shared/domain/repositories/cards_repository.dart';

import 'package:apprendre_lsf/shared/domain/models/card/full_card.dart';
import 'package:apprendre_lsf/shared/domain/models/retention_card/retention_card.dart';

enum RevisionMode { training, fsrs }

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
  RevisionLogic({required this.cardsRepository});

  final CardsRepository cardsRepository;
  late RevisionState state;

  Future<RevisionState> init(List<FullCard>? cards);
  Future<RevisionState> submitAnswer(RetentionRating rating);
}
