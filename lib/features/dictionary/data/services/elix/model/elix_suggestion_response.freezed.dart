// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'elix_suggestion_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ElixSuggestionResponse _$ElixSuggestionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ElixSuggestionResponse.fromJson(json);
}

/// @nodoc
mixin _$ElixSuggestionResponse {
  List<String> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this ElixSuggestionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ElixSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ElixSuggestionResponseCopyWith<ElixSuggestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElixSuggestionResponseCopyWith<$Res> {
  factory $ElixSuggestionResponseCopyWith(
    ElixSuggestionResponse value,
    $Res Function(ElixSuggestionResponse) then,
  ) = _$ElixSuggestionResponseCopyWithImpl<$Res, ElixSuggestionResponse>;
  @useResult
  $Res call({List<String> data, int total});
}

/// @nodoc
class _$ElixSuggestionResponseCopyWithImpl<
  $Res,
  $Val extends ElixSuggestionResponse
>
    implements $ElixSuggestionResponseCopyWith<$Res> {
  _$ElixSuggestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ElixSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? total = null}) {
    return _then(
      _value.copyWith(
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            total:
                null == total
                    ? _value.total
                    : total // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ElixSuggestionResponseImplCopyWith<$Res>
    implements $ElixSuggestionResponseCopyWith<$Res> {
  factory _$$ElixSuggestionResponseImplCopyWith(
    _$ElixSuggestionResponseImpl value,
    $Res Function(_$ElixSuggestionResponseImpl) then,
  ) = __$$ElixSuggestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> data, int total});
}

/// @nodoc
class __$$ElixSuggestionResponseImplCopyWithImpl<$Res>
    extends
        _$ElixSuggestionResponseCopyWithImpl<$Res, _$ElixSuggestionResponseImpl>
    implements _$$ElixSuggestionResponseImplCopyWith<$Res> {
  __$$ElixSuggestionResponseImplCopyWithImpl(
    _$ElixSuggestionResponseImpl _value,
    $Res Function(_$ElixSuggestionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ElixSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? total = null}) {
    return _then(
      _$ElixSuggestionResponseImpl(
        data:
            null == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        total:
            null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ElixSuggestionResponseImpl implements _ElixSuggestionResponse {
  const _$ElixSuggestionResponseImpl({
    required final List<String> data,
    required this.total,
  }) : _data = data;

  factory _$ElixSuggestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElixSuggestionResponseImplFromJson(json);

  final List<String> _data;
  @override
  List<String> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'ElixSuggestionResponse(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElixSuggestionResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    total,
  );

  /// Create a copy of ElixSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElixSuggestionResponseImplCopyWith<_$ElixSuggestionResponseImpl>
  get copyWith =>
      __$$ElixSuggestionResponseImplCopyWithImpl<_$ElixSuggestionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ElixSuggestionResponseImplToJson(this);
  }
}

abstract class _ElixSuggestionResponse implements ElixSuggestionResponse {
  const factory _ElixSuggestionResponse({
    required final List<String> data,
    required final int total,
  }) = _$ElixSuggestionResponseImpl;

  factory _ElixSuggestionResponse.fromJson(Map<String, dynamic> json) =
      _$ElixSuggestionResponseImpl.fromJson;

  @override
  List<String> get data;
  @override
  int get total;

  /// Create a copy of ElixSuggestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElixSuggestionResponseImplCopyWith<_$ElixSuggestionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
