import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:apprendre_lsf/domain/models/retention_card/retention_card.dart';

part 'card_deck_infos.freezed.dart';
part 'card_deck_infos.g.dart';

@freezed
class CardDeckInfo with _$CardDeckInfo {
  const factory CardDeckInfo({
    required int cardId,
    required int deckId,
    required RetentionCard retentionCard,
    @Default([]) List<String> tags,
    DateTime? createdAt,
  }) = _CardDeckInfo;

  factory CardDeckInfo.initial({required int deckId, int? cardId}) =>
      CardDeckInfo(
        cardId: cardId ?? -1,
        deckId: deckId,
        retentionCard: RetentionCard.initial(),
      );

  factory CardDeckInfo.fromJson(Map<String, dynamic> json) =>
      _$CardDeckInfoFromJson(json);
}
