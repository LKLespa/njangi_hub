// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      token: json['token'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      aboutMe: json['aboutMe'] as String? ?? '',
      photo: json['photo'] as String?,
      isOnline: json['isOnline'] as bool? ?? false,
      lastSeen: json['lastSeen'] == null
          ? null
          : DateTime.parse(json['lastSeen'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      groupsGIDs: (json['groupsGIDs'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      groupRequestsGIDs: (json['groupRequestsGIDs'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      groupInvitesGIDs: (json['groupInvitesGIDs'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      privateChatsCIDs: (json['privateChatsCIDs'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'token': instance.token,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'aboutMe': instance.aboutMe,
      'photo': instance.photo,
      'isOnline': instance.isOnline,
      'lastSeen': instance.lastSeen?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'groupsGIDs': instance.groupsGIDs,
      'groupRequestsGIDs': instance.groupRequestsGIDs,
      'groupInvitesGIDs': instance.groupInvitesGIDs,
      'privateChatsCIDs': instance.privateChatsCIDs,
    };
