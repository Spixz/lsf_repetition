// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elix_suggestion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElixSuggestionResponseImpl _$$ElixSuggestionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ElixSuggestionResponseImpl(
  data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$$ElixSuggestionResponseImplToJson(
  _$ElixSuggestionResponseImpl instance,
) => <String, dynamic>{'data': instance.data, 'total': instance.total};
