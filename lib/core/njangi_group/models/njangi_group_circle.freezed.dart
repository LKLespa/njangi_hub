// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'njangi_group_circle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NjangiGroupCircle _$NjangiGroupCircleFromJson(Map<String, dynamic> json) {
  return _NjangiGroupCircle.fromJson(json);
}

/// @nodoc
mixin _$NjangiGroupCircle {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NjangiGroupCircleCopyWith<$Res> {
  factory $NjangiGroupCircleCopyWith(
          NjangiGroupCircle value, $Res Function(NjangiGroupCircle) then) =
      _$NjangiGroupCircleCopyWithImpl<$Res, NjangiGroupCircle>;
}

/// @nodoc
class _$NjangiGroupCircleCopyWithImpl<$Res, $Val extends NjangiGroupCircle>
    implements $NjangiGroupCircleCopyWith<$Res> {
  _$NjangiGroupCircleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NjangiGroupCircleImplCopyWith<$Res> {
  factory _$$NjangiGroupCircleImplCopyWith(_$NjangiGroupCircleImpl value,
          $Res Function(_$NjangiGroupCircleImpl) then) =
      __$$NjangiGroupCircleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NjangiGroupCircleImplCopyWithImpl<$Res>
    extends _$NjangiGroupCircleCopyWithImpl<$Res, _$NjangiGroupCircleImpl>
    implements _$$NjangiGroupCircleImplCopyWith<$Res> {
  __$$NjangiGroupCircleImplCopyWithImpl(_$NjangiGroupCircleImpl _value,
      $Res Function(_$NjangiGroupCircleImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NjangiGroupCircleImpl implements _NjangiGroupCircle {
  _$NjangiGroupCircleImpl();

  factory _$NjangiGroupCircleImpl.fromJson(Map<String, dynamic> json) =>
      _$$NjangiGroupCircleImplFromJson(json);

  @override
  String toString() {
    return 'NjangiGroupCircle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NjangiGroupCircleImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$NjangiGroupCircleImplToJson(
      this,
    );
  }
}

abstract class _NjangiGroupCircle implements NjangiGroupCircle {
  factory _NjangiGroupCircle() = _$NjangiGroupCircleImpl;

  factory _NjangiGroupCircle.fromJson(Map<String, dynamic> json) =
      _$NjangiGroupCircleImpl.fromJson;
}
