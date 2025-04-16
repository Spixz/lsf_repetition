// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elix_meaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElixMeaningImpl _$$ElixMeaningImplFromJson(Map<String, dynamic> json) =>
    _$ElixMeaningImpl(
      id: (json['id'] as num?)?.toInt(),
      wordId: (json['wordId'] as num).toInt(),
      definition: json['definition'] as String,
      wordSigns:
          (json['wordSigns'] as List<dynamic>)
              .map((e) => ElixMedia.fromJson(e as Map<String, dynamic>))
              .toList(),
      definitionSigns:
          (json['definitionSigns'] as List<dynamic>)
              .map((e) => ElixMedia.fromJson(e as Map<String, dynamic>))
              .toList(),
      sourceUrl: json['sourceUrl'] as String,
    );

Map<String, dynamic> _$$ElixMeaningImplToJson(_$ElixMeaningImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wordId': instance.wordId,
      'definition': instance.definition,
      'wordSigns': instance.wordSigns,
      'definitionSigns': instance.definitionSigns,
      'sourceUrl': instance.sourceUrl,
    };
