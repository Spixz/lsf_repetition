// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retention_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RetentionCardImpl _$$RetentionCardImplFromJson(Map<String, dynamic> json) =>
    _$RetentionCardImpl(
      due: DateTime.parse(json['due'] as String),
      lastReview: DateTime.parse(json['lastReview'] as String),
      stability: (json['stability'] as num).toDouble(),
      difficulty: (json['difficulty'] as num).toDouble(),
      elapsedDays: (json['elapsedDays'] as num).toInt(),
      scheduledDays: (json['scheduledDays'] as num).toInt(),
      reps: (json['reps'] as num).toInt(),
      lapses: (json['lapses'] as num).toInt(),
      state: $enumDecode(_$RetentionStateEnumMap, json['state']),
    );

Map<String, dynamic> _$$RetentionCardImplToJson(_$RetentionCardImpl instance) =>
    <String, dynamic>{
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
