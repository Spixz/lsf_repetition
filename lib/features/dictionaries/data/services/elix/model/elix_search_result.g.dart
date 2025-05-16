// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elix_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElixSearchResultImpl _$$ElixSearchResultImplFromJson(
  Map<String, dynamic> json,
) => _$ElixSearchResultImpl(
  name: json['name'] as String,
  typology: json['typology'] as String,
  meanings:
      (json['meanings'] as List<dynamic>)
          .map((e) => ElixMeaning.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$ElixSearchResultImplToJson(
  _$ElixSearchResultImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'typology': instance.typology,
  'meanings': instance.meanings,
};
