import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_meaning.dart';
import 'package:apprendre_lsf/domain/models/lsf_dictionary/lsf_dictionary_search_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/card_model/card.dart';
import 'package:apprendre_lsf/domain/models/card_model/card_deck_infos.dart';

part 'full_card.freezed.dart';
part 'full_card.g.dart';

@freezed
class FullCard with _$FullCard {
  const FullCard._();

  const factory FullCard({required CardModel card, CardDeckInfo? deckInfos}) =
      _FullCard;


  bool get belongToADeck => deckInfos != null;

  factory FullCard.fromJson(Map<String, dynamic> json) =>
      _$FullCardFromJson(json);
}
