// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'njangi_group_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NjangiGroupSettings _$NjangiGroupSettingsFromJson(Map<String, dynamic> json) {
  return _NjangiGroupSettings.fromJson(json);
}

/// @nodoc
mixin _$NjangiGroupSettings {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NjangiGroupSettingsCopyWith<$Res> {
  factory $NjangiGroupSettingsCopyWith(
          NjangiGroupSettings value, $Res Function(NjangiGroupSettings) then) =
      _$NjangiGroupSettingsCopyWithImpl<$Res, NjangiGroupSettings>;
}

/// @nodoc
class _$NjangiGroupSettingsCopyWithImpl<$Res, $Val extends NjangiGroupSettings>
    implements $NjangiGroupSettingsCopyWith<$Res> {
  _$NjangiGroupSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NjangiGroupSettingsImplCopyWith<$Res> {
  factory _$$NjangiGroupSettingsImplCopyWith(_$NjangiGroupSettingsImpl value,
          $Res Function(_$NjangiGroupSettingsImpl) then) =
      __$$NjangiGroupSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NjangiGroupSettingsImplCopyWithImpl<$Res>
    extends _$NjangiGroupSettingsCopyWithImpl<$Res, _$NjangiGroupSettingsImpl>
    implements _$$NjangiGroupSettingsImplCopyWith<$Res> {
  __$$NjangiGroupSettingsImplCopyWithImpl(_$NjangiGroupSettingsImpl _value,
      $Res Function(_$NjangiGroupSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NjangiGroupSettingsImpl implements _NjangiGroupSettings {
  _$NjangiGroupSettingsImpl();

  factory _$NjangiGroupSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NjangiGroupSettingsImplFromJson(json);

  @override
  String toString() {
    return 'NjangiGroupSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NjangiGroupSettingsImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$NjangiGroupSettingsImplToJson(
      this,
    );
  }
}

abstract class _NjangiGroupSettings implements NjangiGroupSettings {
  factory _NjangiGroupSettings() = _$NjangiGroupSettingsImpl;

  factory _NjangiGroupSettings.fromJson(Map<String, dynamic> json) =
      _$NjangiGroupSettingsImpl.fromJson;
}
