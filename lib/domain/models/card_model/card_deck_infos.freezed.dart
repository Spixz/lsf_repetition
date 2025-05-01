// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_deck_infos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardDeckInfo _$CardDeckInfoFromJson(Map<String, dynamic> json) {
  return _CardDeckInfo.fromJson(json);
}

/// @nodoc
mixin _$CardDeckInfo {
  int get cardId => throw _privateConstructorUsedError;
  RetentionCard get retentionCard => throw _privateConstructorUsedError;
  int? get deckId => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CardDeckInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardDeckInfoCopyWith<CardDeckInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDeckInfoCopyWith<$Res> {
  factory $CardDeckInfoCopyWith(
    CardDeckInfo value,
    $Res Function(CardDeckInfo) then,
  ) = _$CardDeckInfoCopyWithImpl<$Res, CardDeckInfo>;
  @useResult
  $Res call({
    int cardId,
    RetentionCard retentionCard,
    int? deckId,
    List<String> tags,
    DateTime? createdAt,
  });

  $RetentionCardCopyWith<$Res> get retentionCard;
}

/// @nodoc
class _$CardDeckInfoCopyWithImpl<$Res, $Val extends CardDeckInfo>
    implements $CardDeckInfoCopyWith<$Res> {
  _$CardDeckInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? retentionCard = null,
    Object? deckId = freezed,
    Object? tags = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            cardId:
                null == cardId
                    ? _value.cardId
                    : cardId // ignore: cast_nullable_to_non_nullable
                        as int,
            retentionCard:
                null == retentionCard
                    ? _value.retentionCard
                    : retentionCard // ignore: cast_nullable_to_non_nullable
                        as RetentionCard,
            deckId:
                freezed == deckId
                    ? _value.deckId
                    : deckId // ignore: cast_nullable_to_non_nullable
                        as int?,
            tags:
                null == tags
                    ? _value.tags
                    : tags // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RetentionCardCopyWith<$Res> get retentionCard {
    return $RetentionCardCopyWith<$Res>(_value.retentionCard, (value) {
      return _then(_value.copyWith(retentionCard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CardDeckInfoImplCopyWith<$Res>
    implements $CardDeckInfoCopyWith<$Res> {
  factory _$$CardDeckInfoImplCopyWith(
    _$CardDeckInfoImpl value,
    $Res Function(_$CardDeckInfoImpl) then,
  ) = __$$CardDeckInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int cardId,
    RetentionCard retentionCard,
    int? deckId,
    List<String> tags,
    DateTime? createdAt,
  });

  @override
  $RetentionCardCopyWith<$Res> get retentionCard;
}

/// @nodoc
class __$$CardDeckInfoImplCopyWithImpl<$Res>
    extends _$CardDeckInfoCopyWithImpl<$Res, _$CardDeckInfoImpl>
    implements _$$CardDeckInfoImplCopyWith<$Res> {
  __$$CardDeckInfoImplCopyWithImpl(
    _$CardDeckInfoImpl _value,
    $Res Function(_$CardDeckInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? retentionCard = null,
    Object? deckId = freezed,
    Object? tags = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CardDeckInfoImpl(
        cardId:
            null == cardId
                ? _value.cardId
                : cardId // ignore: cast_nullable_to_non_nullable
                    as int,
        retentionCard:
            null == retentionCard
                ? _value.retentionCard
                : retentionCard // ignore: cast_nullable_to_non_nullable
                    as RetentionCard,
        deckId:
            freezed == deckId
                ? _value.deckId
                : deckId // ignore: cast_nullable_to_non_nullable
                    as int?,
        tags:
            null == tags
                ? _value._tags
                : tags // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CardDeckInfoImpl implements _CardDeckInfo {
  const _$CardDeckInfoImpl({
    required this.cardId,
    required this.retentionCard,
    this.deckId,
    final List<String> tags = const [],
    this.createdAt,
  }) : _tags = tags;

  factory _$CardDeckInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardDeckInfoImplFromJson(json);

  @override
  final int cardId;
  @override
  final RetentionCard retentionCard;
  @override
  final int? deckId;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CardDeckInfo(cardId: $cardId, retentionCard: $retentionCard, deckId: $deckId, tags: $tags, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardDeckInfoImpl &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.retentionCard, retentionCard) ||
                other.retentionCard == retentionCard) &&
            (identical(other.deckId, deckId) || other.deckId == deckId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cardId,
    retentionCard,
    deckId,
    const DeepCollectionEquality().hash(_tags),
    createdAt,
  );

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardDeckInfoImplCopyWith<_$CardDeckInfoImpl> get copyWith =>
      __$$CardDeckInfoImplCopyWithImpl<_$CardDeckInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardDeckInfoImplToJson(this);
  }
}

abstract class _CardDeckInfo implements CardDeckInfo {
  const factory _CardDeckInfo({
    required final int cardId,
    required final RetentionCard retentionCard,
    final int? deckId,
    final List<String> tags,
    final DateTime? createdAt,
  }) = _$CardDeckInfoImpl;

  factory _CardDeckInfo.fromJson(Map<String, dynamic> json) =
      _$CardDeckInfoImpl.fromJson;

  @override
  int get cardId;
  @override
  RetentionCard get retentionCard;
  @override
  int? get deckId;
  @override
  List<String> get tags;
  @override
  DateTime? get createdAt;

  /// Create a copy of CardDeckInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardDeckInfoImplCopyWith<_$CardDeckInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
