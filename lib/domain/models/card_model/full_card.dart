import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_deck_infos.dart';

part 'full_card.freezed.dart';
part 'full_card.g.dart';

@freezed
class FullCard with _$FullCard {
  const factory FullCard({required Card card, CardDeckInfo? deckInfos}) = _FullCard;

  factory FullCard.fromJson(Map<String, dynamic> json) =>
      _$FullCardFromJson(json);
}
