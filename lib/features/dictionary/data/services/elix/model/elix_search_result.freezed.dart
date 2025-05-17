// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elix_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ElixSearchResult _$ElixSearchResultFromJson(Map<String, dynamic> json) {
  return _ElixSearchResult.fromJson(json);
}

/// @nodoc
mixin _$ElixSearchResult {
  String get name => throw _privateConstructorUsedError;
  String get typology => throw _privateConstructorUsedError;
  List<ElixMeaning> get meanings => throw _privateConstructorUsedError;

  /// Serializes this ElixSearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElixSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElixSearchResultCopyWith<ElixSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElixSearchResultCopyWith<$Res> {
  factory $ElixSearchResultCopyWith(
    ElixSearchResult value,
    $Res Function(ElixSearchResult) then,
  ) = _$ElixSearchResultCopyWithImpl<$Res, ElixSearchResult>;
  @useResult
  $Res call({String name, String typology, List<ElixMeaning> meanings});
}

/// @nodoc
class _$ElixSearchResultCopyWithImpl<$Res, $Val extends ElixSearchResult>
    implements $ElixSearchResultCopyWith<$Res> {
  _$ElixSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElixSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typology = null,
    Object? meanings = null,
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
                        as List<ElixMeaning>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ElixSearchResultImplCopyWith<$Res>
    implements $ElixSearchResultCopyWith<$Res> {
  factory _$$ElixSearchResultImplCopyWith(
    _$ElixSearchResultImpl value,
    $Res Function(_$ElixSearchResultImpl) then,
  ) = __$$ElixSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String typology, List<ElixMeaning> meanings});
}

/// @nodoc
class __$$ElixSearchResultImplCopyWithImpl<$Res>
    extends _$ElixSearchResultCopyWithImpl<$Res, _$ElixSearchResultImpl>
    implements _$$ElixSearchResultImplCopyWith<$Res> {
  __$$ElixSearchResultImplCopyWithImpl(
    _$ElixSearchResultImpl _value,
    $Res Function(_$ElixSearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElixSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? typology = null,
    Object? meanings = null,
  }) {
    return _then(
      _$ElixSearchResultImpl(
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
                    as List<ElixMeaning>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ElixSearchResultImpl extends _ElixSearchResult {
  const _$ElixSearchResultImpl({
    required this.name,
    required this.typology,
    required final List<ElixMeaning> meanings,
  }) : _meanings = meanings,
       super._();

  factory _$ElixSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElixSearchResultImplFromJson(json);

  @override
  final String name;
  @override
  final String typology;
  final List<ElixMeaning> _meanings;
  @override
  List<ElixMeaning> get meanings {
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meanings);
  }

  @override
  String toString() {
    return 'ElixSearchResult(name: $name, typology: $typology, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElixSearchResultImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typology, typology) ||
                other.typology == typology) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    typology,
    const DeepCollectionEquality().hash(_meanings),
  );

  /// Create a copy of ElixSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElixSearchResultImplCopyWith<_$ElixSearchResultImpl> get copyWith =>
      __$$ElixSearchResultImplCopyWithImpl<_$ElixSearchResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ElixSearchResultImplToJson(this);
  }
}

abstract class _ElixSearchResult extends ElixSearchResult {
  const factory _ElixSearchResult({
    required final String name,
    required final String typology,
    required final List<ElixMeaning> meanings,
  }) = _$ElixSearchResultImpl;
  const _ElixSearchResult._() : super._();

  factory _ElixSearchResult.fromJson(Map<String, dynamic> json) =
      _$ElixSearchResultImpl.fromJson;

  @override
  String get name;
  @override
  String get typology;
  @override
  List<ElixMeaning> get meanings;

  /// Create a copy of ElixSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElixSearchResultImplCopyWith<_$ElixSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
