// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsf_dictionary_meaning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LsfDictionaryMeaning _$LsfDictionaryMeaningFromJson(Map<String, dynamic> json) {
  return _LsfDictionaryMeaning.fromJson(json);
}

/// @nodoc
mixin _$LsfDictionaryMeaning {
  String get definition => throw _privateConstructorUsedError;
  List<LsfDictionaryMedia> get wordSigns => throw _privateConstructorUsedError;
  List<LsfDictionaryMedia> get definitionSigns =>
      throw _privateConstructorUsedError;

  /// Serializes this LsfDictionaryMeaning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LsfDictionaryMeaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LsfDictionaryMeaningCopyWith<LsfDictionaryMeaning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LsfDictionaryMeaningCopyWith<$Res> {
  factory $LsfDictionaryMeaningCopyWith(
    LsfDictionaryMeaning value,
    $Res Function(LsfDictionaryMeaning) then,
  ) = _$LsfDictionaryMeaningCopyWithImpl<$Res, LsfDictionaryMeaning>;
  @useResult
  $Res call({
    String definition,
    List<LsfDictionaryMedia> wordSigns,
    List<LsfDictionaryMedia> definitionSigns,
  });
}

/// @nodoc
class _$LsfDictionaryMeaningCopyWithImpl<
  $Res,
  $Val extends LsfDictionaryMeaning
>
    implements $LsfDictionaryMeaningCopyWith<$Res> {
  _$LsfDictionaryMeaningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LsfDictionaryMeaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
    Object? wordSigns = null,
    Object? definitionSigns = null,
  }) {
    return _then(
      _value.copyWith(
            definition:
                null == definition
                    ? _value.definition
                    : definition // ignore: cast_nullable_to_non_nullable
                        as String,
            wordSigns:
                null == wordSigns
                    ? _value.wordSigns
                    : wordSigns // ignore: cast_nullable_to_non_nullable
                        as List<LsfDictionaryMedia>,
            definitionSigns:
                null == definitionSigns
                    ? _value.definitionSigns
                    : definitionSigns // ignore: cast_nullable_to_non_nullable
                        as List<LsfDictionaryMedia>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LsfDictionaryMeaningImplCopyWith<$Res>
    implements $LsfDictionaryMeaningCopyWith<$Res> {
  factory _$$LsfDictionaryMeaningImplCopyWith(
    _$LsfDictionaryMeaningImpl value,
    $Res Function(_$LsfDictionaryMeaningImpl) then,
  ) = __$$LsfDictionaryMeaningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String definition,
    List<LsfDictionaryMedia> wordSigns,
    List<LsfDictionaryMedia> definitionSigns,
  });
}

/// @nodoc
class __$$LsfDictionaryMeaningImplCopyWithImpl<$Res>
    extends _$LsfDictionaryMeaningCopyWithImpl<$Res, _$LsfDictionaryMeaningImpl>
    implements _$$LsfDictionaryMeaningImplCopyWith<$Res> {
  __$$LsfDictionaryMeaningImplCopyWithImpl(
    _$LsfDictionaryMeaningImpl _value,
    $Res Function(_$LsfDictionaryMeaningImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LsfDictionaryMeaning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
    Object? wordSigns = null,
    Object? definitionSigns = null,
  }) {
    return _then(
      _$LsfDictionaryMeaningImpl(
        definition:
            null == definition
                ? _value.definition
                : definition // ignore: cast_nullable_to_non_nullable
                    as String,
        wordSigns:
            null == wordSigns
                ? _value._wordSigns
                : wordSigns // ignore: cast_nullable_to_non_nullable
                    as List<LsfDictionaryMedia>,
        definitionSigns:
            null == definitionSigns
                ? _value._definitionSigns
                : definitionSigns // ignore: cast_nullable_to_non_nullable
                    as List<LsfDictionaryMedia>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LsfDictionaryMeaningImpl implements _LsfDictionaryMeaning {
  const _$LsfDictionaryMeaningImpl({
    required this.definition,
    required final List<LsfDictionaryMedia> wordSigns,
    required final List<LsfDictionaryMedia> definitionSigns,
  }) : _wordSigns = wordSigns,
       _definitionSigns = definitionSigns;

  factory _$LsfDictionaryMeaningImpl.fromJson(Map<String, dynamic> json) =>
      _$$LsfDictionaryMeaningImplFromJson(json);

  @override
  final String definition;
  final List<LsfDictionaryMedia> _wordSigns;
  @override
  List<LsfDictionaryMedia> get wordSigns {
    if (_wordSigns is EqualUnmodifiableListView) return _wordSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordSigns);
  }

  final List<LsfDictionaryMedia> _definitionSigns;
  @override
  List<LsfDictionaryMedia> get definitionSigns {
    if (_definitionSigns is EqualUnmodifiableListView) return _definitionSigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_definitionSigns);
  }

  @override
  String toString() {
    return 'LsfDictionaryMeaning(definition: $definition, wordSigns: $wordSigns, definitionSigns: $definitionSigns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LsfDictionaryMeaningImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            const DeepCollectionEquality().equals(
              other._wordSigns,
              _wordSigns,
            ) &&
            const DeepCollectionEquality().equals(
              other._definitionSigns,
              _definitionSigns,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    definition,
    const DeepCollectionEquality().hash(_wordSigns),
    const DeepCollectionEquality().hash(_definitionSigns),
  );

  /// Create a copy of LsfDictionaryMeaning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LsfDictionaryMeaningImplCopyWith<_$LsfDictionaryMeaningImpl>
  get copyWith =>
      __$$LsfDictionaryMeaningImplCopyWithImpl<_$LsfDictionaryMeaningImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LsfDictionaryMeaningImplToJson(this);
  }
}

abstract class _LsfDictionaryMeaning implements LsfDictionaryMeaning {
  const factory _LsfDictionaryMeaning({
    required final String definition,
    required final List<LsfDictionaryMedia> wordSigns,
    required final List<LsfDictionaryMedia> definitionSigns,
  }) = _$LsfDictionaryMeaningImpl;

  factory _LsfDictionaryMeaning.fromJson(Map<String, dynamic> json) =
      _$LsfDictionaryMeaningImpl.fromJson;

  @override
  String get definition;
  @override
  List<LsfDictionaryMedia> get wordSigns;
  @override
  List<LsfDictionaryMedia> get definitionSigns;

  /// Create a copy of LsfDictionaryMeaning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LsfDictionaryMeaningImplCopyWith<_$LsfDictionaryMeaningImpl>
  get copyWith => throw _privateConstructorUsedError;
}
