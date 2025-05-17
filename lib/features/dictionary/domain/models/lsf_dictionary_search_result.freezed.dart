// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsf_dictionary_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LsfDictionarySearchResult _$LsfDictionarySearchResultFromJson(
  Map<String, dynamic> json,
) {
  return _LsfDictionarySearchResult.fromJson(json);
}

/// @nodoc
mixin _$LsfDictionarySearchResult {
  String get name => throw _privateConstructorUsedError;
  String get typology => throw _privateConstructorUsedError;
  List<LsfDictionaryMeaning> get meanings => throw _privateConstructorUsedError;
  LsfDictionaryName get dictionaryName => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )
    lsfDictionarySearchResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )?
    lsfDictionarySearchResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )?
    lsfDictionarySearchResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LsfDictionarySearchResult value)
    lsfDictionarySearchResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LsfDictionarySearchResult value)?
    lsfDictionarySearchResult,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LsfDictionarySearchResult value)?
    lsfDictionarySearchResult,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this LsfDictionarySearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LsfDictionarySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LsfDictionarySearchResultCopyWith<LsfDictionarySearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LsfDictionarySearchResultCopyWith<$Res> {
  factory $LsfDictionarySearchResultCopyWith(
    LsfDictionarySearchResult value,
    $Res Function(LsfDictionarySearchResult) then,
  ) = _$LsfDictionarySearchResultCopyWithImpl<$Res, LsfDictionarySearchResult>;
  @useResult
  $Res call({
    String name,
    String typology,
    List<LsfDictionaryMeaning> meanings,
    LsfDictionaryName dictionaryName,
    String language,
  });
}

/// @nodoc
class _$LsfDictionarySearchResultCopyWithImpl<
  $Res,
  $Val extends LsfDictionarySearchResult
>
    implements $LsfDictionarySearchResultCopyWith<$Res> {
  _$LsfDictionarySearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LsfDictionarySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typology = null,
    Object? meanings = null,
    Object? dictionaryName = null,
    Object? language = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            typology:
                null == typology
                    ? _value.typology
                    : typology // ignore: cast_nullable_to_non_nullable
                        as String,
            meanings:
                null == meanings
                    ? _value.meanings
                    : meanings // ignore: cast_nullable_to_non_nullable
                        as List<LsfDictionaryMeaning>,
            dictionaryName:
                null == dictionaryName
                    ? _value.dictionaryName
                    : dictionaryName // ignore: cast_nullable_to_non_nullable
                        as LsfDictionaryName,
            language:
                null == language
                    ? _value.language
                    : language // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LsfDictionarySearchResultImplCopyWith<$Res>
    implements $LsfDictionarySearchResultCopyWith<$Res> {
  factory _$$LsfDictionarySearchResultImplCopyWith(
    _$LsfDictionarySearchResultImpl value,
    $Res Function(_$LsfDictionarySearchResultImpl) then,
  ) = __$$LsfDictionarySearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String typology,
    List<LsfDictionaryMeaning> meanings,
    LsfDictionaryName dictionaryName,
    String language,
  });
}

/// @nodoc
class __$$LsfDictionarySearchResultImplCopyWithImpl<$Res>
    extends
        _$LsfDictionarySearchResultCopyWithImpl<
          $Res,
          _$LsfDictionarySearchResultImpl
        >
    implements _$$LsfDictionarySearchResultImplCopyWith<$Res> {
  __$$LsfDictionarySearchResultImplCopyWithImpl(
    _$LsfDictionarySearchResultImpl _value,
    $Res Function(_$LsfDictionarySearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LsfDictionarySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typology = null,
    Object? meanings = null,
    Object? dictionaryName = null,
    Object? language = null,
  }) {
    return _then(
      _$LsfDictionarySearchResultImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        typology:
            null == typology
                ? _value.typology
                : typology // ignore: cast_nullable_to_non_nullable
                    as String,
        meanings:
            null == meanings
                ? _value._meanings
                : meanings // ignore: cast_nullable_to_non_nullable
                    as List<LsfDictionaryMeaning>,
        dictionaryName:
            null == dictionaryName
                ? _value.dictionaryName
                : dictionaryName // ignore: cast_nullable_to_non_nullable
                    as LsfDictionaryName,
        language:
            null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LsfDictionarySearchResultImpl implements _LsfDictionarySearchResult {
  const _$LsfDictionarySearchResultImpl({
    required this.name,
    required this.typology,
    required final List<LsfDictionaryMeaning> meanings,
    required this.dictionaryName,
    required this.language,
  }) : _meanings = meanings;

  factory _$LsfDictionarySearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$LsfDictionarySearchResultImplFromJson(json);

  @override
  final String name;
  @override
  final String typology;
  final List<LsfDictionaryMeaning> _meanings;
  @override
  List<LsfDictionaryMeaning> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  final LsfDictionaryName dictionaryName;
  @override
  final String language;

  @override
  String toString() {
    return 'LsfDictionarySearchResult.lsfDictionarySearchResult(name: $name, typology: $typology, meanings: $meanings, dictionaryName: $dictionaryName, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LsfDictionarySearchResultImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typology, typology) ||
                other.typology == typology) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings) &&
            (identical(other.dictionaryName, dictionaryName) ||
                other.dictionaryName == dictionaryName) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    typology,
    const DeepCollectionEquality().hash(_meanings),
    dictionaryName,
    language,
  );

  /// Create a copy of LsfDictionarySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LsfDictionarySearchResultImplCopyWith<_$LsfDictionarySearchResultImpl>
  get copyWith => __$$LsfDictionarySearchResultImplCopyWithImpl<
    _$LsfDictionarySearchResultImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )
    lsfDictionarySearchResult,
  }) {
    return lsfDictionarySearchResult(
      name,
      typology,
      meanings,
      dictionaryName,
      language,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )?
    lsfDictionarySearchResult,
  }) {
    return lsfDictionarySearchResult?.call(
      name,
      typology,
      meanings,
      dictionaryName,
      language,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String name,
      String typology,
      List<LsfDictionaryMeaning> meanings,
      LsfDictionaryName dictionaryName,
      String language,
    )?
    lsfDictionarySearchResult,
    required TResult orElse(),
  }) {
    if (lsfDictionarySearchResult != null) {
      return lsfDictionarySearchResult(
        name,
        typology,
        meanings,
        dictionaryName,
        language,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LsfDictionarySearchResult value)
    lsfDictionarySearchResult,
  }) {
    return lsfDictionarySearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LsfDictionarySearchResult value)?
    lsfDictionarySearchResult,
  }) {
    return lsfDictionarySearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LsfDictionarySearchResult value)?
    lsfDictionarySearchResult,
    required TResult orElse(),
  }) {
    if (lsfDictionarySearchResult != null) {
      return lsfDictionarySearchResult(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LsfDictionarySearchResultImplToJson(this);
  }
}

abstract class _LsfDictionarySearchResult implements LsfDictionarySearchResult {
  const factory _LsfDictionarySearchResult({
    required final String name,
    required final String typology,
    required final List<LsfDictionaryMeaning> meanings,
    required final LsfDictionaryName dictionaryName,
    required final String language,
  }) = _$LsfDictionarySearchResultImpl;

  factory _LsfDictionarySearchResult.fromJson(Map<String, dynamic> json) =
      _$LsfDictionarySearchResultImpl.fromJson;

  @override
  String get name;
  @override
  String get typology;
  @override
  List<LsfDictionaryMeaning> get meanings;
  @override
  LsfDictionaryName get dictionaryName;
  @override
  String get language;

  /// Create a copy of LsfDictionarySearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LsfDictionarySearchResultImplCopyWith<_$LsfDictionarySearchResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}
