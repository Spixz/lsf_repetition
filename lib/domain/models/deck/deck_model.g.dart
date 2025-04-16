// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeckModelImpl _$$DeckModelImplFromJson(Map<String, dynamic> json) =>
    _$DeckModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      id: (json['id'] as num?)?.toInt(),
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$DeckModelImplToJson(_$DeckModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
