import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/chat/models/attachment.dart';
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
    String? text,
    required DateTime timestamp,
    @Default(AttachmentType.text) AttachmentType messageType,
    @Default([]) List<Attachment> attachments,
    @Default(false) bool readByEveryone,
    @Default([]) List<String> readBy,
    String? repliedToMessageId,
    SimpleMessage? repliedToMessage,
    String? url,
    @Default(false) bool isSent,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  SimpleMessage toSimpleMessage(){
    return SimpleMessage(
        mid: mid,
        senderId: senderId,
        messageType: messageType,
        timestamp: timestamp,
        message: text,
    );
  }

  Map<String, dynamic> toExtendedJson(){

      return <String, dynamic>{
        'mid': mid,
        'senderId': senderId,
        'chatId': chatId,
        'groupId': groupId,
        'text': text,
        'timestamp': timestamp.toIso8601String(),
        'messageType': messageType.toJson(),
        'attachments': attachments.map((attachment) => attachment.toExtendedJson()).toList(),
        'readByEveryone': readByEveryone,
        'readBy': readBy,
        'repliedToMessageId': repliedToMessageId,
        'repliedToMessage': repliedToMessage?.toExtendedJson(),
        'url': url,
        'isSent': isSent,
      };
  }

  factory Message.fromExtendedJson(Map<String, dynamic> json) {
    String mid = json['mid'];
    String senderId = json['senderId'];
    String? chatId = json['chatId'];
    String? groupId = json['groupId'];
    String? text = json['text'];
    DateTime timestamp = DateTime.parse(json['timestamp']);
    AttachmentType messageType = AttachmentType.fromJson(json['messageType']);
    List<Attachment> attachments =
        (json['attachments'] as List?)?.cast<Map<String, dynamic>>()
            .map((e) => Attachment.fromExtendedJson(e))
                .toList() ??
            const [];
    bool readByEveryone = json['readByEveryone'];
    List<String> readBy =
        (json['readBy'] as List?)?.cast<String>().map((e) => e).toList() ?? const [];
    String? repliedToMessageId = json['repliedToMessageId'];
    SimpleMessage? repliedToMessage = json['repliedToMessage'] == null
        ? null
        : SimpleMessage.fromExtendedJson(json['repliedToMessage'] as Map<String, dynamic>);
    String? url = json['url'];
    bool isSent = json['isSent'];

    return Message(
      mid: mid,
      senderId: senderId,
      timestamp: timestamp,
      chatId: chatId,
      groupId: groupId,
      text: text,
      messageType: messageType,
      attachments: attachments,
      readBy: readBy,
      readByEveryone: readByEveryone,
      repliedToMessage: repliedToMessage,
      repliedToMessageId: repliedToMessageId,
      url: url,
      isSent: isSent,
    );
  }
}
