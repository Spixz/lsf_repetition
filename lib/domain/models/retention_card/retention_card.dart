import 'package:freezed_annotation/freezed_annotation.dart';

part 'retention_card.freezed.dart';
part 'retention_card.g.dart';

enum RetentionState { newState, learning, review, relearning }

enum RetentionRating {
  again(1),
  hard(2),
  good(3),
  easy(4);

  const RetentionRating(this.val);

  final int val;
}

@freezed
class RetentionCard with _$RetentionCard {

const factory RetentionCard({
    required DateTime due,
    required DateTime lastReview,
    required double stability,
    required double difficulty,
    required int elapsedDays,
    required int scheduledDays,
    required int reps,
    required int lapses,
    required RetentionState state,
  }) = _RetentionCard;

  factory RetentionCard.fromJson(Map<String, dynamic> json) => _$RetentionCardFromJson(json);
}