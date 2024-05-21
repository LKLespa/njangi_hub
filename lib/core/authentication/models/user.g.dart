// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      token: json['token'] as String,
      name: json['name'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      aboutMe: json['aboutMe'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      isOnline: json['isOnline'] as bool,
      lastSeen: json['lastSeen'] == null
          ? null
          : DateTime.parse(json['lastSeen'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      groupsGIDs: (json['groupsGIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      privateChatsCIDs: (json['privateChatsCIDs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'token': instance.token,
      'name': instance.name,
      'userName': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'aboutMe': instance.aboutMe,
      'photo': instance.photo,
      'isOnline': instance.isOnline,
      'lastSeen': instance.lastSeen?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'groupsGIDs': instance.groupsGIDs,
      'privateChatsCIDs': instance.privateChatsCIDs,
    };
