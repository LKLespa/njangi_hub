// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SimpleMessageImpl _$$SimpleMessageImplFromJson(Map<String, dynamic> json) =>
    _$SimpleMessageImpl(
      mid: json['mid'] as String,
      senderId: json['senderId'] as String,
      message: json['message'] as String?,
      messageType: $enumDecode(_$AttachmentTypeEnumMap, json['messageType']),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$SimpleMessageImplToJson(_$SimpleMessageImpl instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'senderId': instance.senderId,
      'message': instance.message,
      'messageType': instance.messageType,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.text: 'text',
  AttachmentType.image: 'image',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
  AttachmentType.document: 'document',
};
