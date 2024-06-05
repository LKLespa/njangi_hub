import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/chat/models/attachment_type.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const Message._();

  factory Message({
    required String mid,
    required String senderId,
    String? chatId,
    String? groupId,
    required dynamic content,
    required DateTime timestamp,
    @Default(AttachmentType.text) AttachmentType messageType,
    @Default([]) List<Attachment> attachments,
    @Default(false) bool readByEveryone,
    @Default([]) List<String> readBy,
    String? repliedToMessageId,
    Message? repliedToMessage,
}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
