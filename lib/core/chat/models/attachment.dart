import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/chat/chat.dart';

part 'attachment.freezed.dart';
part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const Attachment._();
  factory Attachment({
    required String attachmentId,
    required AttachmentType type,
    required String url,
    String? storagePath,
}) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

  Map<String, dynamic> toExtendedJson() =>
      <String, dynamic>{
        'attachmentId': attachmentId,
        'type': type.toJson(),
        'url': url,
        'storagePath': storagePath,
      };

  factory Attachment.fromExtendedJson(Map<String, dynamic> json){
    String attachmentId = json['attachmentId'] as String;
    AttachmentType type = AttachmentType.fromJson(json['type']);
    String? url = json['url'] as String;
    String? storagePath = json['storagePath'] as String?;

    return Attachment(attachmentId: attachmentId, type: type, url: url, storagePath: storagePath);
  }
}