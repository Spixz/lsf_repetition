// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'full_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FullCard _$FullCardFromJson(Map<String, dynamic> json) {
  return _FullCard.fromJson(json);
}

/// @nodoc
mixin _$FullCard {
  Card get card => throw _privateConstructorUsedError;
  CardDeckInfo? get deckInfos => throw _privateConstructorUsedError;

  /// Serializes this FullCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FullCardCopyWith<FullCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FullCardCopyWith<$Res> {
  factory $FullCardCopyWith(FullCard value, $Res Function(FullCard) then) =
      _$FullCardCopyWithImpl<$Res, FullCard>;
  @useResult
  $Res call({Card card, CardDeckInfo? deckInfos});

  $CardCopyWith<$Res> get card;
  $CardDeckInfoCopyWith<$Res>? get deckInfos;
}

/// @nodoc
class _$FullCardCopyWithImpl<$Res, $Val extends FullCard>
    implements $FullCardCopyWith<$Res> {
  _$FullCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? card = null, Object? deckInfos = freezed}) {
    return _then(
      _value.copyWith(
            card:
                null == card
                    ? _value.card
                    : card // ignore: cast_nullable_to_non_nullable
                        as Card,
            deckInfos:
                freezed == deckInfos
                    ? _value.deckInfos
                    : deckInfos // ignore: cast_nullable_to_non_nullable
                        as CardDeckInfo?,
          )
          as $Val,
    );
  }

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardCopyWith<$Res> get card {
    return $CardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CardDeckInfoCopyWith<$Res>? get deckInfos {
    if (_value.deckInfos == null) {
      return null;
    }

    return $CardDeckInfoCopyWith<$Res>(_value.deckInfos!, (value) {
      return _then(_value.copyWith(deckInfos: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FullCardImplCopyWith<$Res>
    implements $FullCardCopyWith<$Res> {
  factory _$$FullCardImplCopyWith(
    _$FullCardImpl value,
    $Res Function(_$FullCardImpl) then,
  ) = __$$FullCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Card card, CardDeckInfo? deckInfos});

  @override
  $CardCopyWith<$Res> get card;
  @override
  $CardDeckInfoCopyWith<$Res>? get deckInfos;
}

/// @nodoc
class __$$FullCardImplCopyWithImpl<$Res>
    extends _$FullCardCopyWithImpl<$Res, _$FullCardImpl>
    implements _$$FullCardImplCopyWith<$Res> {
  __$$FullCardImplCopyWithImpl(
    _$FullCardImpl _value,
    $Res Function(_$FullCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? card = null, Object? deckInfos = freezed}) {
    return _then(
      _$FullCardImpl(
        card:
            null == card
                ? _value.card
                : card // ignore: cast_nullable_to_non_nullable
                    as Card,
        deckInfos:
            freezed == deckInfos
                ? _value.deckInfos
                : deckInfos // ignore: cast_nullable_to_non_nullable
                    as CardDeckInfo?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FullCardImpl implements _FullCard {
  const _$FullCardImpl({required this.card, this.deckInfos});

  factory _$FullCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FullCardImplFromJson(json);

  @override
  final Card card;
  @override
  final CardDeckInfo? deckInfos;

  @override
  String toString() {
    return 'FullCard(card: $card, deckInfos: $deckInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FullCardImpl &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.deckInfos, deckInfos) ||
                other.deckInfos == deckInfos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, card, deckInfos);

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FullCardImplCopyWith<_$FullCardImpl> get copyWith =>
      __$$FullCardImplCopyWithImpl<_$FullCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FullCardImplToJson(this);
  }
}

abstract class _FullCard implements FullCard {
  const factory _FullCard({
    required final Card card,
    final CardDeckInfo? deckInfos,
  }) = _$FullCardImpl;

  factory _FullCard.fromJson(Map<String, dynamic> json) =
      _$FullCardImpl.fromJson;

  @override
  Card get card;
  @override
  CardDeckInfo? get deckInfos;

  /// Create a copy of FullCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FullCardImplCopyWith<_$FullCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
