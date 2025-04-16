// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lsf_dictionary_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LsfDictionarySearchResultImpl _$$LsfDictionarySearchResultImplFromJson(
  Map<String, dynamic> json,
) => _$LsfDictionarySearchResultImpl(
  name: json['name'] as String,
  typology: json['typology'] as String,
  meanings:
      (json['meanings'] as List<dynamic>)
          .map((e) => LsfDictionaryMeaning.fromJson(e as Map<String, dynamic>))
          .toList(),
  dictionaryName: $enumDecode(
    _$LsfDictionaryNameEnumMap,
    json['dictionaryName'],
  ),
  language: json['language'] as String,
);

Map<String, dynamic> _$$LsfDictionarySearchResultImplToJson(
  _$LsfDictionarySearchResultImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'typology': instance.typology,
  'meanings': instance.meanings,
  'dictionaryName': _$LsfDictionaryNameEnumMap[instance.dictionaryName]!,
  'language': instance.language,
};

const _$LsfDictionaryNameEnumMap = {
  LsfDictionaryName.elix: 'elix',
  LsfDictionaryName.spreadthesign: 'spreadthesign',
};
