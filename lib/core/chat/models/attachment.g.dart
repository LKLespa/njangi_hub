// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      attachmentId: json['attachmentId'] as String,
      type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
      url: json['url'] as String,
      storagePath: json['storagePath'] as String?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'attachmentId': instance.attachmentId,
      'type': instance.type,
      'url': instance.url,
      'storagePath': instance.storagePath,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.text: 'text',
  AttachmentType.image: 'image',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
  AttachmentType.document: 'document',
};
