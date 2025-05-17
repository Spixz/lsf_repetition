// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elix_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ElixMedia _$ElixMediaFromJson(Map<String, dynamic> json) {
  return _ElixMedia.fromJson(json);
}

/// @nodoc
mixin _$ElixMedia {
  String get uri => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;

  /// Serializes this ElixMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElixMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElixMediaCopyWith<ElixMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElixMediaCopyWith<$Res> {
  factory $ElixMediaCopyWith(ElixMedia value, $Res Function(ElixMedia) then) =
      _$ElixMediaCopyWithImpl<$Res, ElixMedia>;
  @useResult
  $Res call({String uri, String image, String? author});
}

/// @nodoc
class _$ElixMediaCopyWithImpl<$Res, $Val extends ElixMedia>
    implements $ElixMediaCopyWith<$Res> {
  _$ElixMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElixMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? image = null,
    Object? author = freezed,
  }) {
    return _then(
      _value.copyWith(
            uri:
                null == uri
                    ? _value.uri
                    : uri // ignore: cast_nullable_to_non_nullable
                        as String,
            image:
                null == image
                    ? _value.image
                    : image // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ElixMediaImplCopyWith<$Res>
    implements $ElixMediaCopyWith<$Res> {
  factory _$$ElixMediaImplCopyWith(
    _$ElixMediaImpl value,
    $Res Function(_$ElixMediaImpl) then,
  ) = __$$ElixMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uri, String image, String? author});
}

/// @nodoc
class __$$ElixMediaImplCopyWithImpl<$Res>
    extends _$ElixMediaCopyWithImpl<$Res, _$ElixMediaImpl>
    implements _$$ElixMediaImplCopyWith<$Res> {
  __$$ElixMediaImplCopyWithImpl(
    _$ElixMediaImpl _value,
    $Res Function(_$ElixMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElixMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? image = null,
    Object? author = freezed,
  }) {
    return _then(
      _$ElixMediaImpl(
        uri:
            null == uri
                ? _value.uri
                : uri // ignore: cast_nullable_to_non_nullable
                    as String,
        image:
            null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
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
class _$ElixMediaImpl implements _ElixMedia {
  const _$ElixMediaImpl({
    required this.uri,
    required this.image,
    required this.author,
  });

  factory _$ElixMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElixMediaImplFromJson(json);

  @override
  final String uri;
  @override
  final String image;
  @override
  final String? author;

  @override
  String toString() {
    return 'ElixMedia(uri: $uri, image: $image, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElixMediaImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uri, image, author);

  /// Create a copy of ElixMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElixMediaImplCopyWith<_$ElixMediaImpl> get copyWith =>
      __$$ElixMediaImplCopyWithImpl<_$ElixMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElixMediaImplToJson(this);
  }
}

abstract class _ElixMedia implements ElixMedia {
  const factory _ElixMedia({
    required final String uri,
    required final String image,
    required final String? author,
  }) = _$ElixMediaImpl;

  factory _ElixMedia.fromJson(Map<String, dynamic> json) =
      _$ElixMediaImpl.fromJson;

  @override
  String get uri;
  @override
  String get image;
  @override
  String? get author;

  /// Create a copy of ElixMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElixMediaImplCopyWith<_$ElixMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
