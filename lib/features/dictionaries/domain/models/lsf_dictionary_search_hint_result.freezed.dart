// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsf_dictionary_search_hint_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LsfDictionarySearchHintResult _$LsfDictionarySearchHintResultFromJson(
  Map<String, dynamic> json,
) {
  return _LsfDictionarySearchHintResult.fromJson(json);
}

/// @nodoc
mixin _$LsfDictionarySearchHintResult {
  String get word => throw _privateConstructorUsedError;
  LsfDictionaryName get source => throw _privateConstructorUsedError;

  /// Serializes this LsfDictionarySearchHintResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LsfDictionarySearchHintResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LsfDictionarySearchHintResultCopyWith<LsfDictionarySearchHintResult>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LsfDictionarySearchHintResultCopyWith<$Res> {
  factory $LsfDictionarySearchHintResultCopyWith(
    LsfDictionarySearchHintResult value,
    $Res Function(LsfDictionarySearchHintResult) then,
  ) =
      _$LsfDictionarySearchHintResultCopyWithImpl<
        $Res,
        LsfDictionarySearchHintResult
      >;
  @useResult
  $Res call({String word, LsfDictionaryName source});
}

/// @nodoc
class _$LsfDictionarySearchHintResultCopyWithImpl<
  $Res,
  $Val extends LsfDictionarySearchHintResult
>
    implements $LsfDictionarySearchHintResultCopyWith<$Res> {
  _$LsfDictionarySearchHintResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LsfDictionarySearchHintResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? word = null, Object? source = null}) {
    return _then(
      _value.copyWith(
            word:
                null == word
                    ? _value.word
                    : word // ignore: cast_nullable_to_non_nullable
                        as String,
            source:
                null == source
                    ? _value.source
                    : source // ignore: cast_nullable_to_non_nullable
                        as LsfDictionaryName,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LsfDictionarySearchHintResultImplCopyWith<$Res>
    implements $LsfDictionarySearchHintResultCopyWith<$Res> {
  factory _$$LsfDictionarySearchHintResultImplCopyWith(
    _$LsfDictionarySearchHintResultImpl value,
    $Res Function(_$LsfDictionarySearchHintResultImpl) then,
  ) = __$$LsfDictionarySearchHintResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String word, LsfDictionaryName source});
}

/// @nodoc
class __$$LsfDictionarySearchHintResultImplCopyWithImpl<$Res>
    extends
        _$LsfDictionarySearchHintResultCopyWithImpl<
          $Res,
          _$LsfDictionarySearchHintResultImpl
        >
    implements _$$LsfDictionarySearchHintResultImplCopyWith<$Res> {
  __$$LsfDictionarySearchHintResultImplCopyWithImpl(
    _$LsfDictionarySearchHintResultImpl _value,
    $Res Function(_$LsfDictionarySearchHintResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LsfDictionarySearchHintResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? word = null, Object? source = null}) {
    return _then(
      _$LsfDictionarySearchHintResultImpl(
        word:
            null == word
                ? _value.word
                : word // ignore: cast_nullable_to_non_nullable
                    as String,
        source:
            null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                    as LsfDictionaryName,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LsfDictionarySearchHintResultImpl
    implements _LsfDictionarySearchHintResult {
  _$LsfDictionarySearchHintResultImpl({
    required this.word,
    required this.source,
  });

  factory _$LsfDictionarySearchHintResultImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$LsfDictionarySearchHintResultImplFromJson(json);

  @override
  final String word;
  @override
  final LsfDictionaryName source;

  @override
  String toString() {
    return 'LsfDictionarySearchHintResult(word: $word, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LsfDictionarySearchHintResultImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word, source);

  /// Create a copy of LsfDictionarySearchHintResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LsfDictionarySearchHintResultImplCopyWith<
    _$LsfDictionarySearchHintResultImpl
  >
  get copyWith => __$$LsfDictionarySearchHintResultImplCopyWithImpl<
    _$LsfDictionarySearchHintResultImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LsfDictionarySearchHintResultImplToJson(this);
  }
}

abstract class _LsfDictionarySearchHintResult
    implements LsfDictionarySearchHintResult {
  factory _LsfDictionarySearchHintResult({
    required final String word,
    required final LsfDictionaryName source,
  }) = _$LsfDictionarySearchHintResultImpl;

  factory _LsfDictionarySearchHintResult.fromJson(Map<String, dynamic> json) =
      _$LsfDictionarySearchHintResultImpl.fromJson;

  @override
  String get word;
  @override
  LsfDictionaryName get source;

  /// Create a copy of LsfDictionarySearchHintResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LsfDictionarySearchHintResultImplCopyWith<
    _$LsfDictionarySearchHintResultImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
