// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map<String, dynamic> json) =>
    _$CardModelImpl(
      name: json['name'] as String,
      typology: json['typology'] as String,
      meaning: json['meaning'] as String,
      videosSigns:
          (json['videosSigns'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      sourceDictionnary: $enumDecode(
        _$LsfDictionaryNameEnumMap,
        json['sourceDictionnary'],
      ),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      deckId: (json['deckId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      dictionnarySignId: (json['dictionnarySignId'] as num?)?.toInt(),
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CardModelImplToJson(
  _$CardModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'typology': instance.typology,
  'meaning': instance.meaning,
  'videosSigns': instance.videosSigns,
  'sourceDictionnary': _$LsfDictionaryNameEnumMap[instance.sourceDictionnary]!,
  'tags': instance.tags,
  'deckId': instance.deckId,
  'id': instance.id,
  'dictionnarySignId': instance.dictionnarySignId,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$LsfDictionaryNameEnumMap = {
  LsfDictionaryName.elix: 'elix',
  LsfDictionaryName.spreadthesign: 'spreadthesign',
};
