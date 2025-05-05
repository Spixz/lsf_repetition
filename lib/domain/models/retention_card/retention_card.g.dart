// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retention_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RetentionCardImpl _$$RetentionCardImplFromJson(Map<String, dynamic> json) =>
    _$RetentionCardImpl(
      cardId: (json['cardId'] as num?)?.toInt(),
      due: DateTime.parse(json['due'] as String),
      lastReview: DateTime.parse(json['lastReview'] as String),
      stability: (json['stability'] as num?)?.toDouble() ?? 0,
      difficulty: (json['difficulty'] as num?)?.toDouble() ?? 0,
      elapsedDays: (json['elapsedDays'] as num?)?.toInt() ?? 0,
      scheduledDays: (json['scheduledDays'] as num?)?.toInt() ?? 0,
      reps: (json['reps'] as num?)?.toInt() ?? 0,
      lapses: (json['lapses'] as num?)?.toInt() ?? 0,
      state:
          $enumDecodeNullable(_$RetentionStateEnumMap, json['state']) ??
          RetentionState.newState,
    );

Map<String, dynamic> _$$RetentionCardImplToJson(_$RetentionCardImpl instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'due': instance.due.toIso8601String(),
      'lastReview': instance.lastReview.toIso8601String(),
      'stability': instance.stability,
      'difficulty': instance.difficulty,
      'elapsedDays': instance.elapsedDays,
      'scheduledDays': instance.scheduledDays,
      'reps': instance.reps,
      'lapses': instance.lapses,
      'state': _$RetentionStateEnumMap[instance.state]!,
    };

const _$RetentionStateEnumMap = {
  RetentionState.newState: 'newState',
  RetentionState.learning: 'learning',
  RetentionState.review: 'review',
  RetentionState.relearning: 'relearning',
};
