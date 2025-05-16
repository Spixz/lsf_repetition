// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lsf_dictionary_search_hint_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LsfDictionarySearchHintResultImpl
_$$LsfDictionarySearchHintResultImplFromJson(Map<String, dynamic> json) =>
    _$LsfDictionarySearchHintResultImpl(
      word: json['word'] as String,
      source: $enumDecode(_$LsfDictionaryNameEnumMap, json['source']),
    );

Map<String, dynamic> _$$LsfDictionarySearchHintResultImplToJson(
  _$LsfDictionarySearchHintResultImpl instance,
) => <String, dynamic>{
  'word': instance.word,
  'source': _$LsfDictionaryNameEnumMap[instance.source]!,
};

const _$LsfDictionaryNameEnumMap = {
  LsfDictionaryName.elix: 'elix',
  LsfDictionaryName.spreadthesign: 'spreadthesign',
};
