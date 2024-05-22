// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      isAuthenticating: json['isAuthenticating'] as bool? ?? false,
      error: json['error'] as String?,
      tempUser: json['tempUser'] == null
          ? null
          : User.fromJson(json['tempUser'] as Map<String, dynamic>),
      verificationCode: (json['verificationCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'isLoading': instance.isLoading,
      'isAuthenticating': instance.isAuthenticating,
      'error': instance.error,
      'tempUser': instance.tempUser,
      'verificationCode': instance.verificationCode,
    };
