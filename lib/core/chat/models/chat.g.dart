// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      chatId: json['chatId'] as String,
      isGroup: json['isGroup'] as bool,
      isNjangiGroup: json['isNjangiGroup'] as bool,
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sendingMessages: (json['sendingMessages'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isSending: json['isSending'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'isGroup': instance.isGroup,
      'isNjangiGroup': instance.isNjangiGroup,
      'messages': instance.messages,
      'sendingMessages': instance.sendingMessages,
      'isSending': instance.isSending,
    };
