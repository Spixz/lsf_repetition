import 'package:apprendre_lsf/data/repositories/spaced_repetition/spaced_repetition_repository.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

class SpacedRepetitonRepositoryImpl extends SpacedRepetitonRepository {
  @override
  RetentionCard createCard() {
    throw Exception();
  }

  @override
  RetentionCard reviewCard(RetentionCard card, RetentionRating rating) {
    throw Exception();
  }
}
