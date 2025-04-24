// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullCardImpl _$$FullCardImplFromJson(Map<String, dynamic> json) =>
    _$FullCardImpl(
      card: Card.fromJson(json['card'] as Map<String, dynamic>),
      deckInfos:
          json['deckInfos'] == null
              ? null
              : CardDeckInfo.fromJson(
                json['deckInfos'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$FullCardImplToJson(_$FullCardImpl instance) =>
    <String, dynamic>{'card': instance.card, 'deckInfos': instance.deckInfos};
