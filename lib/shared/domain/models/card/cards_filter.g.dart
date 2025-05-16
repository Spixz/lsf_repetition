// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardsFilterImpl _$$CardsFilterImplFromJson(Map<String, dynamic> json) =>
    _$CardsFilterImpl(
      name: json['name'] as String? ?? "",
      dateFilter: $enumDecodeNullable(_$DateFilterEnumMap, json['dateFilter']),
      retentionState: $enumDecodeNullable(
        _$RetentionStateEnumMap,
        json['retentionState'],
      ),
      deck:
          json['deck'] == null
              ? null
              : DeckModel.fromJson(json['deck'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CardsFilterImplToJson(_$CardsFilterImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateFilter': _$DateFilterEnumMap[instance.dateFilter],
      'retentionState': _$RetentionStateEnumMap[instance.retentionState],
      'deck': instance.deck,
    };

const _$DateFilterEnumMap = {
  DateFilter.recent: 'recent',
  DateFilter.oldest: 'oldest',
};

const _$RetentionStateEnumMap = {
  RetentionState.newState: 'newState',
  RetentionState.learning: 'learning',
  RetentionState.review: 'review',
  RetentionState.relearning: 'relearning',
};
