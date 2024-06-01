// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'njangi_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NjangiGroupImpl _$$NjangiGroupImplFromJson(Map<String, dynamic> json) =>
    _$NjangiGroupImpl(
      gid: json['gid'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String?,
      description: json['description'] as String?,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      groupAdmins: (json['groupAdmins'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      groupMembers: (json['groupMembers'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      groupInvites: (json['groupInvites'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      groupRequests: (json['groupRequests'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      currentAmount: (json['currentAmount'] as num?)?.toDouble() ?? 0,
      paymentAccount: json['paymentAccount'] == null
          ? null
          : PaymentAccount.fromJson(
              json['paymentAccount'] as Map<String, dynamic>),
      groupChat: GroupChat.fromJson(json['groupChat'] as Map<String, dynamic>),
      groupSettings: NjangiGroupSettings.fromJson(
          json['groupSettings'] as Map<String, dynamic>),
      groupCircles: (json['groupCircles'] as List<dynamic>?)
              ?.map(
                  (e) => NjangiGroupCircle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NjangiGroupImplToJson(_$NjangiGroupImpl instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'name': instance.name,
      'photo': instance.photo,
      'description': instance.description,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'groupAdmins': instance.groupAdmins,
      'groupMembers': instance.groupMembers,
      'groupInvites': instance.groupInvites,
      'groupRequests': instance.groupRequests,
      'currentAmount': instance.currentAmount,
      'paymentAccount': instance.paymentAccount,
      'groupChat': instance.groupChat,
      'groupSettings': instance.groupSettings,
      'groupCircles': instance.groupCircles,
    };
