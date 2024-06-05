// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      mid: json['mid'] as String,
      senderId: json['senderId'] as String,
      chatId: json['chatId'] as String?,
      groupId: json['groupId'] as String?,
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp'] as String),
      messageType:
          $enumDecodeNullable(_$AttachmentTypeEnumMap, json['messageType']) ??
              AttachmentType.text,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      readByEveryone: json['readByEveryone'] as bool? ?? false,
      readBy: (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      repliedToMessageId: json['repliedToMessageId'] as String?,
      repliedToMessage: json['repliedToMessage'] == null
          ? null
          : Message.fromJson(json['repliedToMessage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'senderId': instance.senderId,
      'chatId': instance.chatId,
      'groupId': instance.groupId,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'messageType': instance.messageType,
      'attachments': instance.attachments,
      'readByEveryone': instance.readByEveryone,
      'readBy': instance.readBy,
      'repliedToMessageId': instance.repliedToMessageId,
      'repliedToMessage': instance.repliedToMessage,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.text: 'text',
  AttachmentType.image: 'image',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
  AttachmentType.document: 'document',
};
