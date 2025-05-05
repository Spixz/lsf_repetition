// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retention_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RetentionCard _$RetentionCardFromJson(Map<String, dynamic> json) {
  return _RetentionCard.fromJson(json);
}

/// @nodoc
mixin _$RetentionCard {
  int? get cardId => throw _privateConstructorUsedError;
  DateTime get due => throw _privateConstructorUsedError;
  DateTime get lastReview => throw _privateConstructorUsedError;
  double get stability => throw _privateConstructorUsedError;
  double get difficulty => throw _privateConstructorUsedError;
  int get elapsedDays => throw _privateConstructorUsedError;
  int get scheduledDays => throw _privateConstructorUsedError;
  int get reps => throw _privateConstructorUsedError;
  int get lapses => throw _privateConstructorUsedError;
  RetentionState get state => throw _privateConstructorUsedError;

  /// Serializes this RetentionCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RetentionCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RetentionCardCopyWith<RetentionCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetentionCardCopyWith<$Res> {
  factory $RetentionCardCopyWith(
    RetentionCard value,
    $Res Function(RetentionCard) then,
  ) = _$RetentionCardCopyWithImpl<$Res, RetentionCard>;
  @useResult
  $Res call({
    int? cardId,
    DateTime due,
    DateTime lastReview,
    double stability,
    double difficulty,
    int elapsedDays,
    int scheduledDays,
    int reps,
    int lapses,
    RetentionState state,
  });
}

/// @nodoc
class _$RetentionCardCopyWithImpl<$Res, $Val extends RetentionCard>
    implements $RetentionCardCopyWith<$Res> {
  _$RetentionCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RetentionCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? due = null,
    Object? lastReview = null,
    Object? stability = null,
    Object? difficulty = null,
    Object? elapsedDays = null,
    Object? scheduledDays = null,
    Object? reps = null,
    Object? lapses = null,
    Object? state = null,
  }) {
    return _then(
      _value.copyWith(
            cardId:
                freezed == cardId
                    ? _value.cardId
                    : cardId // ignore: cast_nullable_to_non_nullable
                        as int?,
            due:
                null == due
                    ? _value.due
                    : due // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            lastReview:
                null == lastReview
                    ? _value.lastReview
                    : lastReview // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            stability:
                null == stability
                    ? _value.stability
                    : stability // ignore: cast_nullable_to_non_nullable
                        as double,
            difficulty:
                null == difficulty
                    ? _value.difficulty
                    : difficulty // ignore: cast_nullable_to_non_nullable
                        as double,
            elapsedDays:
                null == elapsedDays
                    ? _value.elapsedDays
                    : elapsedDays // ignore: cast_nullable_to_non_nullable
                        as int,
            scheduledDays:
                null == scheduledDays
                    ? _value.scheduledDays
                    : scheduledDays // ignore: cast_nullable_to_non_nullable
                        as int,
            reps:
                null == reps
                    ? _value.reps
                    : reps // ignore: cast_nullable_to_non_nullable
                        as int,
            lapses:
                null == lapses
                    ? _value.lapses
                    : lapses // ignore: cast_nullable_to_non_nullable
                        as int,
            state:
                null == state
                    ? _value.state
                    : state // ignore: cast_nullable_to_non_nullable
                        as RetentionState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RetentionCardImplCopyWith<$Res>
    implements $RetentionCardCopyWith<$Res> {
  factory _$$RetentionCardImplCopyWith(
    _$RetentionCardImpl value,
    $Res Function(_$RetentionCardImpl) then,
  ) = __$$RetentionCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? cardId,
    DateTime due,
    DateTime lastReview,
    double stability,
    double difficulty,
    int elapsedDays,
    int scheduledDays,
    int reps,
    int lapses,
    RetentionState state,
  });
}

/// @nodoc
class __$$RetentionCardImplCopyWithImpl<$Res>
    extends _$RetentionCardCopyWithImpl<$Res, _$RetentionCardImpl>
    implements _$$RetentionCardImplCopyWith<$Res> {
  __$$RetentionCardImplCopyWithImpl(
    _$RetentionCardImpl _value,
    $Res Function(_$RetentionCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RetentionCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? due = null,
    Object? lastReview = null,
    Object? stability = null,
    Object? difficulty = null,
    Object? elapsedDays = null,
    Object? scheduledDays = null,
    Object? reps = null,
    Object? lapses = null,
    Object? state = null,
  }) {
    return _then(
      _$RetentionCardImpl(
        cardId:
            freezed == cardId
                ? _value.cardId
                : cardId // ignore: cast_nullable_to_non_nullable
                    as int?,
        due:
            null == due
                ? _value.due
                : due // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        lastReview:
            null == lastReview
                ? _value.lastReview
                : lastReview // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        stability:
            null == stability
                ? _value.stability
                : stability // ignore: cast_nullable_to_non_nullable
                    as double,
        difficulty:
            null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                    as double,
        elapsedDays:
            null == elapsedDays
                ? _value.elapsedDays
                : elapsedDays // ignore: cast_nullable_to_non_nullable
                    as int,
        scheduledDays:
            null == scheduledDays
                ? _value.scheduledDays
                : scheduledDays // ignore: cast_nullable_to_non_nullable
                    as int,
        reps:
            null == reps
                ? _value.reps
                : reps // ignore: cast_nullable_to_non_nullable
                    as int,
        lapses:
            null == lapses
                ? _value.lapses
                : lapses // ignore: cast_nullable_to_non_nullable
                    as int,
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as RetentionState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RetentionCardImpl implements _RetentionCard {
  _$RetentionCardImpl({
    this.cardId,
    required this.due,
    required this.lastReview,
    this.stability = 0,
    this.difficulty = 0,
    this.elapsedDays = 0,
    this.scheduledDays = 0,
    this.reps = 0,
    this.lapses = 0,
    this.state = RetentionState.newState,
  });

  factory _$RetentionCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$RetentionCardImplFromJson(json);

  @override
  final int? cardId;
  @override
  final DateTime due;
  @override
  final DateTime lastReview;
  @override
  @JsonKey()
  final double stability;
  @override
  @JsonKey()
  final double difficulty;
  @override
  @JsonKey()
  final int elapsedDays;
  @override
  @JsonKey()
  final int scheduledDays;
  @override
  @JsonKey()
  final int reps;
  @override
  @JsonKey()
  final int lapses;
  @override
  @JsonKey()
  final RetentionState state;

  @override
  String toString() {
    return 'RetentionCard(cardId: $cardId, due: $due, lastReview: $lastReview, stability: $stability, difficulty: $difficulty, elapsedDays: $elapsedDays, scheduledDays: $scheduledDays, reps: $reps, lapses: $lapses, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetentionCardImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.due, due) || other.due == due) &&
            (identical(other.lastReview, lastReview) ||
                other.lastReview == lastReview) &&
            (identical(other.stability, stability) ||
                other.stability == stability) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.elapsedDays, elapsedDays) ||
                other.elapsedDays == elapsedDays) &&
            (identical(other.scheduledDays, scheduledDays) ||
                other.scheduledDays == scheduledDays) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.lapses, lapses) || other.lapses == lapses) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cardId,
    due,
    lastReview,
    stability,
    difficulty,
    elapsedDays,
    scheduledDays,
    reps,
    lapses,
    state,
  );

  /// Create a copy of RetentionCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RetentionCardImplCopyWith<_$RetentionCardImpl> get copyWith =>
      __$$RetentionCardImplCopyWithImpl<_$RetentionCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RetentionCardImplToJson(this);
  }
}

abstract class _RetentionCard implements RetentionCard {
  factory _RetentionCard({
    final int? cardId,
    required final DateTime due,
    required final DateTime lastReview,
    final double stability,
    final double difficulty,
    final int elapsedDays,
    final int scheduledDays,
    final int reps,
    final int lapses,
    final RetentionState state,
  }) = _$RetentionCardImpl;

  factory _RetentionCard.fromJson(Map<String, dynamic> json) =
      _$RetentionCardImpl.fromJson;

  @override
  int? get cardId;
  @override
  DateTime get due;
  @override
  DateTime get lastReview;
  @override
  double get stability;
  @override
  double get difficulty;
  @override
  int get elapsedDays;
  @override
  int get scheduledDays;
  @override
  int get reps;
  @override
  int get lapses;
  @override
  RetentionState get state;

  /// Create a copy of RetentionCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RetentionCardImplCopyWith<_$RetentionCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
