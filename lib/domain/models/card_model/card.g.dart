// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardImpl _$$CardImplFromJson(Map<String, dynamic> json) => _$CardImpl(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  typology: json['typology'] as String,
  meaning: json['meaning'] as String,
  videosSigns:
      (json['videosSigns'] as List<dynamic>).map((e) => e as String).toList(),
  sourceDictionnary: $enumDecode(
    _$LsfDictionaryNameEnumMap,
    json['sourceDictionnary'],
  ),
  dictionnarySignId: (json['dictionnarySignId'] as num?)?.toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$CardImplToJson(
  _$CardImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'typology': instance.typology,
  'meaning': instance.meaning,
  'videosSigns': instance.videosSigns,
  'sourceDictionnary': _$LsfDictionaryNameEnumMap[instance.sourceDictionnary]!,
  'dictionnarySignId': instance.dictionnarySignId,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$LsfDictionaryNameEnumMap = {
  LsfDictionaryName.elix: 'elix',
  LsfDictionaryName.spreadthesign: 'spreadthesign',
};
