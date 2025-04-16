// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lsf_dictionary_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LsfDictionaryMedia _$LsfDictionaryMediaFromJson(Map<String, dynamic> json) {
  return _LsfDictionaryMedia.fromJson(json);
}

/// @nodoc
mixin _$LsfDictionaryMedia {
  String get videoUrl => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;

  /// Serializes this LsfDictionaryMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LsfDictionaryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LsfDictionaryMediaCopyWith<LsfDictionaryMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LsfDictionaryMediaCopyWith<$Res> {
  factory $LsfDictionaryMediaCopyWith(
    LsfDictionaryMedia value,
    $Res Function(LsfDictionaryMedia) then,
  ) = _$LsfDictionaryMediaCopyWithImpl<$Res, LsfDictionaryMedia>;
  @useResult
  $Res call({String videoUrl, String imageUrl, String? author});
}

/// @nodoc
class _$LsfDictionaryMediaCopyWithImpl<$Res, $Val extends LsfDictionaryMedia>
    implements $LsfDictionaryMediaCopyWith<$Res> {
  _$LsfDictionaryMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LsfDictionaryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? imageUrl = null,
    Object? author = freezed,
  }) {
    return _then(
      _value.copyWith(
            videoUrl:
                null == videoUrl
                    ? _value.videoUrl
                    : videoUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            author:
                freezed == author
                    ? _value.author
                    : author // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LsfDictionaryMediaImplCopyWith<$Res>
    implements $LsfDictionaryMediaCopyWith<$Res> {
  factory _$$LsfDictionaryMediaImplCopyWith(
    _$LsfDictionaryMediaImpl value,
    $Res Function(_$LsfDictionaryMediaImpl) then,
  ) = __$$LsfDictionaryMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String videoUrl, String imageUrl, String? author});
}

/// @nodoc
class __$$LsfDictionaryMediaImplCopyWithImpl<$Res>
    extends _$LsfDictionaryMediaCopyWithImpl<$Res, _$LsfDictionaryMediaImpl>
    implements _$$LsfDictionaryMediaImplCopyWith<$Res> {
  __$$LsfDictionaryMediaImplCopyWithImpl(
    _$LsfDictionaryMediaImpl _value,
    $Res Function(_$LsfDictionaryMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LsfDictionaryMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? imageUrl = null,
    Object? author = freezed,
  }) {
    return _then(
      _$LsfDictionaryMediaImpl(
        videoUrl:
            null == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        author:
            freezed == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LsfDictionaryMediaImpl implements _LsfDictionaryMedia {
  const _$LsfDictionaryMediaImpl({
    required this.videoUrl,
    required this.imageUrl,
    required this.author,
  });

  factory _$LsfDictionaryMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$LsfDictionaryMediaImplFromJson(json);

  @override
  final String videoUrl;
  @override
  final String imageUrl;
  @override
  final String? author;

  @override
  String toString() {
    return 'LsfDictionaryMedia(videoUrl: $videoUrl, imageUrl: $imageUrl, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LsfDictionaryMediaImpl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, videoUrl, imageUrl, author);

  /// Create a copy of LsfDictionaryMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LsfDictionaryMediaImplCopyWith<_$LsfDictionaryMediaImpl> get copyWith =>
      __$$LsfDictionaryMediaImplCopyWithImpl<_$LsfDictionaryMediaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LsfDictionaryMediaImplToJson(this);
  }
}

abstract class _LsfDictionaryMedia implements LsfDictionaryMedia {
  const factory _LsfDictionaryMedia({
    required final String videoUrl,
    required final String imageUrl,
    required final String? author,
  }) = _$LsfDictionaryMediaImpl;

  factory _LsfDictionaryMedia.fromJson(Map<String, dynamic> json) =
      _$LsfDictionaryMediaImpl.fromJson;

  @override
  String get videoUrl;
  @override
  String get imageUrl;
  @override
  String? get author;

  /// Create a copy of LsfDictionaryMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LsfDictionaryMediaImplCopyWith<_$LsfDictionaryMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
