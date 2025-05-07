import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

part 'full_card.freezed.dart';
part 'full_card.g.dart';

@freezed
class FullCard with _$FullCard {
  const FullCard._();

  const factory FullCard({required CardModel card, RetentionCard? retentionCard}) =
      _FullCard;

  bool get belongToADeck => card.deckId != null;

  factory FullCard.fromJson(Map<String, dynamic> json) =>
      _$FullCardFromJson(json);
}
