// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FullCardImpl _$$FullCardImplFromJson(Map<String, dynamic> json) =>
    _$FullCardImpl(
      card: CardModel.fromJson(json['card'] as Map<String, dynamic>),
      retentionCard:
          json['retentionCard'] == null
              ? null
              : RetentionCard.fromJson(
                json['retentionCard'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$$FullCardImplToJson(_$FullCardImpl instance) =>
    <String, dynamic>{
      'card': instance.card,
      'retentionCard': instance.retentionCard,
    };
