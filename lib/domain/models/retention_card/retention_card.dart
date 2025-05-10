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
  static RetentionRating fromIndex(int index) => RetentionRating.values[index];

  final int val;
}

@freezed
class RetentionCard with _$RetentionCard {
  factory RetentionCard({
    int? cardId,
    required DateTime due,
    required DateTime lastReview,
    @Default(0) double stability,
    @Default(0) double difficulty,
    @Default(0) int elapsedDays,
    @Default(0) int scheduledDays,
    @Default(0) int reps,
    @Default(0) int lapses,
    @Default(RetentionState.newState) RetentionState state,
  }) = _RetentionCard;

  factory RetentionCard.initial() =>
      RetentionCard(due: DateTime.now(), lastReview: DateTime.now());

  factory RetentionCard.fromJson(Map<String, dynamic> json) =>
      _$RetentionCardFromJson(json);
}
