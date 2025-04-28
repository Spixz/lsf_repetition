// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cards_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardsFilter _$CardsFilterFromJson(Map<String, dynamic> json) {
  return _CardsFilter.fromJson(json);
}

/// @nodoc
mixin _$CardsFilter {
  DateFilter? get dateFilter => throw _privateConstructorUsedError;
  RetentionState? get retentionState => throw _privateConstructorUsedError;
  DeckModel? get deck => throw _privateConstructorUsedError;

  /// Serializes this CardsFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardsFilterCopyWith<CardsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsFilterCopyWith<$Res> {
  factory $CardsFilterCopyWith(
    CardsFilter value,
    $Res Function(CardsFilter) then,
  ) = _$CardsFilterCopyWithImpl<$Res, CardsFilter>;
  @useResult
  $Res call({
    DateFilter? dateFilter,
    RetentionState? retentionState,
    DeckModel? deck,
  });

  $DeckModelCopyWith<$Res>? get deck;
}

/// @nodoc
class _$CardsFilterCopyWithImpl<$Res, $Val extends CardsFilter>
    implements $CardsFilterCopyWith<$Res> {
  _$CardsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFilter = freezed,
    Object? retentionState = freezed,
    Object? deck = freezed,
  }) {
    return _then(
      _value.copyWith(
            dateFilter:
                freezed == dateFilter
                    ? _value.dateFilter
                    : dateFilter // ignore: cast_nullable_to_non_nullable
                        as DateFilter?,
            retentionState:
                freezed == retentionState
                    ? _value.retentionState
                    : retentionState // ignore: cast_nullable_to_non_nullable
                        as RetentionState?,
            deck:
                freezed == deck
                    ? _value.deck
                    : deck // ignore: cast_nullable_to_non_nullable
                        as DeckModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeckModelCopyWith<$Res>? get deck {
    if (_value.deck == null) {
      return null;
    }

    return $DeckModelCopyWith<$Res>(_value.deck!, (value) {
      return _then(_value.copyWith(deck: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardsFilterImplCopyWith<$Res>
    implements $CardsFilterCopyWith<$Res> {
  factory _$$CardsFilterImplCopyWith(
    _$CardsFilterImpl value,
    $Res Function(_$CardsFilterImpl) then,
  ) = __$$CardsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateFilter? dateFilter,
    RetentionState? retentionState,
    DeckModel? deck,
  });

  @override
  $DeckModelCopyWith<$Res>? get deck;
}

/// @nodoc
class __$$CardsFilterImplCopyWithImpl<$Res>
    extends _$CardsFilterCopyWithImpl<$Res, _$CardsFilterImpl>
    implements _$$CardsFilterImplCopyWith<$Res> {
  __$$CardsFilterImplCopyWithImpl(
    _$CardsFilterImpl _value,
    $Res Function(_$CardsFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateFilter = freezed,
    Object? retentionState = freezed,
    Object? deck = freezed,
  }) {
    return _then(
      _$CardsFilterImpl(
        dateFilter:
            freezed == dateFilter
                ? _value.dateFilter
                : dateFilter // ignore: cast_nullable_to_non_nullable
                    as DateFilter?,
        retentionState:
            freezed == retentionState
                ? _value.retentionState
                : retentionState // ignore: cast_nullable_to_non_nullable
                    as RetentionState?,
        deck:
            freezed == deck
                ? _value.deck
                : deck // ignore: cast_nullable_to_non_nullable
                    as DeckModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardsFilterImpl extends _CardsFilter {
  const _$CardsFilterImpl({this.dateFilter, this.retentionState, this.deck})
    : super._();

  factory _$CardsFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardsFilterImplFromJson(json);

  @override
  final DateFilter? dateFilter;
  @override
  final RetentionState? retentionState;
  @override
  final DeckModel? deck;

  @override
  String toString() {
    return 'CardsFilter(dateFilter: $dateFilter, retentionState: $retentionState, deck: $deck)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardsFilterImpl &&
            (identical(other.dateFilter, dateFilter) ||
                other.dateFilter == dateFilter) &&
            (identical(other.retentionState, retentionState) ||
                other.retentionState == retentionState) &&
            (identical(other.deck, deck) || other.deck == deck));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateFilter, retentionState, deck);

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardsFilterImplCopyWith<_$CardsFilterImpl> get copyWith =>
      __$$CardsFilterImplCopyWithImpl<_$CardsFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardsFilterImplToJson(this);
  }
}

abstract class _CardsFilter extends CardsFilter {
  const factory _CardsFilter({
    final DateFilter? dateFilter,
    final RetentionState? retentionState,
    final DeckModel? deck,
  }) = _$CardsFilterImpl;
  const _CardsFilter._() : super._();

  factory _CardsFilter.fromJson(Map<String, dynamic> json) =
      _$CardsFilterImpl.fromJson;

  @override
  DateFilter? get dateFilter;
  @override
  RetentionState? get retentionState;
  @override
  DeckModel? get deck;

  /// Create a copy of CardsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardsFilterImplCopyWith<_$CardsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
