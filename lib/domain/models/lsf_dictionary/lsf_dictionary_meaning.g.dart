// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lsf_dictionary_meaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LsfDictionaryMeaningImpl _$$LsfDictionaryMeaningImplFromJson(
  Map<String, dynamic> json,
) => _$LsfDictionaryMeaningImpl(
  definition: json['definition'] as String,
  wordSigns:
      (json['wordSigns'] as List<dynamic>)
          .map((e) => LsfDictionaryMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
  definitionSigns:
      (json['definitionSigns'] as List<dynamic>)
          .map((e) => LsfDictionaryMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$LsfDictionaryMeaningImplToJson(
  _$LsfDictionaryMeaningImpl instance,
) => <String, dynamic>{
  'definition': instance.definition,
  'wordSigns': instance.wordSigns,
  'definitionSigns': instance.definitionSigns,
};
