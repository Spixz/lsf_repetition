// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elix_meaning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ElixMeaning _$ElixMeaningFromJson(Map<String, dynamic> json) {
  return _ElixMeaning.fromJson(json);
}

/// @nodoc
mixin _$ElixMeaning {
  int? get id => throw _privateConstructorUsedError;
  int get wordId => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  List<ElixMedia> get wordSigns => throw _privateConstructorUsedError;
  List<ElixMedia> get definitionSigns => throw _privateConstructorUsedError;
  String get sourceUrl => throw _privateConstructorUsedError;

  /// Serializes this ElixMeaning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElixMeaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElixMeaningCopyWith<ElixMeaning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElixMeaningCopyWith<$Res> {
  factory $ElixMeaningCopyWith(
    ElixMeaning value,
    $Res Function(ElixMeaning) then,
  ) = _$ElixMeaningCopyWithImpl<$Res, ElixMeaning>;
  @useResult
  $Res call({
    int? id,
    int wordId,
    String definition,
    List<ElixMedia> wordSigns,
    List<ElixMedia> definitionSigns,
    String sourceUrl,
  });
}

/// @nodoc
class _$ElixMeaningCopyWithImpl<$Res, $Val extends ElixMeaning>
    implements $ElixMeaningCopyWith<$Res> {
  _$ElixMeaningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElixMeaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? wordId = null,
    Object? definition = null,
    Object? wordSigns = null,
    Object? definitionSigns = null,
    Object? sourceUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            wordId:
                null == wordId
                    ? _value.wordId
                    : wordId // ignore: cast_nullable_to_non_nullable
                        as int,
            definition:
                null == definition
                    ? _value.definition
                    : definition // ignore: cast_nullable_to_non_nullable
                        as String,
            wordSigns:
                null == wordSigns
                    ? _value.wordSigns
                    : wordSigns // ignore: cast_nullable_to_non_nullable
                        as List<ElixMedia>,
            definitionSigns:
                null == definitionSigns
                    ? _value.definitionSigns
                    : definitionSigns // ignore: cast_nullable_to_non_nullable
                        as List<ElixMedia>,
            sourceUrl:
                null == sourceUrl
                    ? _value.sourceUrl
                    : sourceUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ElixMeaningImplCopyWith<$Res>
    implements $ElixMeaningCopyWith<$Res> {
  factory _$$ElixMeaningImplCopyWith(
    _$ElixMeaningImpl value,
    $Res Function(_$ElixMeaningImpl) then,
  ) = __$$ElixMeaningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int wordId,
    String definition,
    List<ElixMedia> wordSigns,
    List<ElixMedia> definitionSigns,
    String sourceUrl,
  });
}

/// @nodoc
class __$$ElixMeaningImplCopyWithImpl<$Res>
    extends _$ElixMeaningCopyWithImpl<$Res, _$ElixMeaningImpl>
    implements _$$ElixMeaningImplCopyWith<$Res> {
  __$$ElixMeaningImplCopyWithImpl(
    _$ElixMeaningImpl _value,
    $Res Function(_$ElixMeaningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElixMeaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? wordId = null,
    Object? definition = null,
    Object? wordSigns = null,
    Object? definitionSigns = null,
    Object? sourceUrl = null,
  }) {
    return _then(
      _$ElixMeaningImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        wordId:
            null == wordId
                ? _value.wordId
                : wordId // ignore: cast_nullable_to_non_nullable
                    as int,
        definition:
            null == definition
                ? _value.definition
                : definition // ignore: cast_nullable_to_non_nullable
                    as String,
        wordSigns:
            null == wordSigns
                ? _value._wordSigns
                : wordSigns // ignore: cast_nullable_to_non_nullable
                    as List<ElixMedia>,
        definitionSigns:
            null == definitionSigns
                ? _value._definitionSigns
                : definitionSigns // ignore: cast_nullable_to_non_nullable
                    as List<ElixMedia>,
        sourceUrl:
            null == sourceUrl
                ? _value.sourceUrl
                : sourceUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ElixMeaningImpl implements _ElixMeaning {
  const _$ElixMeaningImpl({
    required this.id,
    required this.wordId,
    required this.definition,
    required final List<ElixMedia> wordSigns,
    required final List<ElixMedia> definitionSigns,
    required this.sourceUrl,
  }) : _wordSigns = wordSigns,
       _definitionSigns = definitionSigns;

  factory _$ElixMeaningImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElixMeaningImplFromJson(json);

  @override
  final int? id;
  @override
  final int wordId;
  @override
  final String definition;
  final List<ElixMedia> _wordSigns;
  @override
  List<ElixMedia> get wordSigns {
    if (_wordSigns is EqualUnmodifiableListView) return _wordSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordSigns);
  }

  final List<ElixMedia> _definitionSigns;
  @override
  List<ElixMedia> get definitionSigns {
    if (_definitionSigns is EqualUnmodifiableListView) return _definitionSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_definitionSigns);
  }

  @override
  final String sourceUrl;

  @override
  String toString() {
    return 'ElixMeaning(id: $id, wordId: $wordId, definition: $definition, wordSigns: $wordSigns, definitionSigns: $definitionSigns, sourceUrl: $sourceUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElixMeaningImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.wordId, wordId) || other.wordId == wordId) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(
              other._wordSigns,
              _wordSigns,
            ) &&
            const DeepCollectionEquality().equals(
              other._definitionSigns,
              _definitionSigns,
            ) &&
            (identical(other.sourceUrl, sourceUrl) ||
                other.sourceUrl == sourceUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    wordId,
    definition,
    const DeepCollectionEquality().hash(_wordSigns),
    const DeepCollectionEquality().hash(_definitionSigns),
    sourceUrl,
  );

  /// Create a copy of ElixMeaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElixMeaningImplCopyWith<_$ElixMeaningImpl> get copyWith =>
      __$$ElixMeaningImplCopyWithImpl<_$ElixMeaningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElixMeaningImplToJson(this);
  }
}

abstract class _ElixMeaning implements ElixMeaning {
  const factory _ElixMeaning({
    required final int? id,
    required final int wordId,
    required final String definition,
    required final List<ElixMedia> wordSigns,
    required final List<ElixMedia> definitionSigns,
    required final String sourceUrl,
  }) = _$ElixMeaningImpl;

  factory _ElixMeaning.fromJson(Map<String, dynamic> json) =
      _$ElixMeaningImpl.fromJson;

  @override
  int? get id;
  @override
  int get wordId;
  @override
  String get definition;
  @override
  List<ElixMedia> get wordSigns;
  @override
  List<ElixMedia> get definitionSigns;
  @override
  String get sourceUrl;

  /// Create a copy of ElixMeaning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElixMeaningImplCopyWith<_$ElixMeaningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
