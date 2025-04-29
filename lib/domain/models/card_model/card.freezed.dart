// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return _CardModel.fromJson(json);
}

/// @nodoc
mixin _$CardModel {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get typology => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;
  List<String> get videosSigns => throw _privateConstructorUsedError;
  LsfDictionaryName get sourceDictionnary => throw _privateConstructorUsedError;
  int? get dictionnarySignId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CardModelCopyWith<CardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardModelCopyWith<$Res> {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) then) =
      _$CardModelCopyWithImpl<$Res, CardModel>;
  @useResult
  $Res call({
    int? id,
    String name,
    String typology,
    String meaning,
    List<String> videosSigns,
    LsfDictionaryName sourceDictionnary,
    int? dictionnarySignId,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$CardModelCopyWithImpl<$Res, $Val extends CardModel>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? typology = null,
    Object? meaning = null,
    Object? videosSigns = null,
    Object? sourceDictionnary = null,
    Object? dictionnarySignId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
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
            meaning:
                null == meaning
                    ? _value.meaning
                    : meaning // ignore: cast_nullable_to_non_nullable
                        as String,
            videosSigns:
                null == videosSigns
                    ? _value.videosSigns
                    : videosSigns // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            sourceDictionnary:
                null == sourceDictionnary
                    ? _value.sourceDictionnary
                    : sourceDictionnary // ignore: cast_nullable_to_non_nullable
                        as LsfDictionaryName,
            dictionnarySignId:
                freezed == dictionnarySignId
                    ? _value.dictionnarySignId
                    : dictionnarySignId // ignore: cast_nullable_to_non_nullable
                        as int?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CardModelImplCopyWith<$Res>
    implements $CardModelCopyWith<$Res> {
  factory _$$CardModelImplCopyWith(
    _$CardModelImpl value,
    $Res Function(_$CardModelImpl) then,
  ) = __$$CardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String name,
    String typology,
    String meaning,
    List<String> videosSigns,
    LsfDictionaryName sourceDictionnary,
    int? dictionnarySignId,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$CardModelImplCopyWithImpl<$Res>
    extends _$CardModelCopyWithImpl<$Res, _$CardModelImpl>
    implements _$$CardModelImplCopyWith<$Res> {
  __$$CardModelImplCopyWithImpl(
    _$CardModelImpl _value,
    $Res Function(_$CardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? typology = null,
    Object? meaning = null,
    Object? videosSigns = null,
    Object? sourceDictionnary = null,
    Object? dictionnarySignId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CardModelImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
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
        meaning:
            null == meaning
                ? _value.meaning
                : meaning // ignore: cast_nullable_to_non_nullable
                    as String,
        videosSigns:
            null == videosSigns
                ? _value._videosSigns
                : videosSigns // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        sourceDictionnary:
            null == sourceDictionnary
                ? _value.sourceDictionnary
                : sourceDictionnary // ignore: cast_nullable_to_non_nullable
                    as LsfDictionaryName,
        dictionnarySignId:
            freezed == dictionnarySignId
                ? _value.dictionnarySignId
                : dictionnarySignId // ignore: cast_nullable_to_non_nullable
                    as int?,
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
class _$CardModelImpl implements _CardModel {
  const _$CardModelImpl({
    this.id,
    required this.name,
    required this.typology,
    required this.meaning,
    required final List<String> videosSigns,
    required this.sourceDictionnary,
    this.dictionnarySignId,
    this.createdAt,
  }) : _videosSigns = videosSigns;

  factory _$CardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String typology;
  @override
  final String meaning;
  final List<String> _videosSigns;
  @override
  List<String> get videosSigns {
    if (_videosSigns is EqualUnmodifiableListView) return _videosSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videosSigns);
  }

  @override
  final LsfDictionaryName sourceDictionnary;
  @override
  final int? dictionnarySignId;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CardModel(id: $id, name: $name, typology: $typology, meaning: $meaning, videosSigns: $videosSigns, sourceDictionnary: $sourceDictionnary, dictionnarySignId: $dictionnarySignId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typology, typology) ||
                other.typology == typology) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            const DeepCollectionEquality().equals(
              other._videosSigns,
              _videosSigns,
            ) &&
            (identical(other.sourceDictionnary, sourceDictionnary) ||
                other.sourceDictionnary == sourceDictionnary) &&
            (identical(other.dictionnarySignId, dictionnarySignId) ||
                other.dictionnarySignId == dictionnarySignId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    typology,
    meaning,
    const DeepCollectionEquality().hash(_videosSigns),
    sourceDictionnary,
    dictionnarySignId,
    createdAt,
  );

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      __$$CardModelImplCopyWithImpl<_$CardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardModelImplToJson(this);
  }
}

abstract class _CardModel implements CardModel {
  const factory _CardModel({
    final int? id,
    required final String name,
    required final String typology,
    required final String meaning,
    required final List<String> videosSigns,
    required final LsfDictionaryName sourceDictionnary,
    final int? dictionnarySignId,
    final DateTime? createdAt,
  }) = _$CardModelImpl;

  factory _CardModel.fromJson(Map<String, dynamic> json) =
      _$CardModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get typology;
  @override
  String get meaning;
  @override
  List<String> get videosSigns;
  @override
  LsfDictionaryName get sourceDictionnary;
  @override
  int? get dictionnarySignId;
  @override
  DateTime? get createdAt;

  /// Create a copy of CardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardModelImplCopyWith<_$CardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
