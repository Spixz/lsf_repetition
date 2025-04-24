// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_deck_infos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardDeckInfoImpl _$$CardDeckInfoImplFromJson(Map<String, dynamic> json) =>
    _$CardDeckInfoImpl(
      cardId: (json['cardId'] as num).toInt(),
      deckId: (json['deckId'] as num).toInt(),
      retentionCard: RetentionCard.fromJson(
        json['retentionCard'] as Map<String, dynamic>,
      ),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CardDeckInfoImplToJson(_$CardDeckInfoImpl instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'deckId': instance.deckId,
      'retentionCard': instance.retentionCard,
      'tags': instance.tags,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
