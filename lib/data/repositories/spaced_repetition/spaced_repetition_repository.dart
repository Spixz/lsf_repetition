import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

abstract class SpacedRepetitonRepository {
  /// Create a new retention card
  RetentionCard createCard();

  /// Review the card and return it's new version with updated
  /// fsrs parameters
  RetentionCard reviewCard(RetentionCard card, RetentionRating rating);
}
