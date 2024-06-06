import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/chat/chat.dart';

part 'simple_message.freezed.dart';
part 'simple_message.g.dart';

@freezed
class SimpleMessage with _$SimpleMessage {
  const SimpleMessage._();
  const factory SimpleMessage({
    required String mid,
    required String senderId,
    String? message,
    required AttachmentType messageType,
    required DateTime timestamp,
  }) = _SimpleMessage;

  factory SimpleMessage.fromJson(Map<String, dynamic> json) => _$SimpleMessageFromJson(json);

  Map<String, dynamic> toExtendedJson(){
    return <String, dynamic>{
      'mid': mid,
      'senderId': senderId,
      'timestamp': timestamp.toIso8601String(),
      'messageType': messageType.toJson(),
      'message': message
    };
  }


  factory SimpleMessage.fromExtendedJson(Map<String, dynamic> json) {
    return SimpleMessage(
        mid: json['mid'] as String,
        message: json['message'] as String?,
        senderId: json['senderId'] as String,
        messageType: AttachmentType.fromJson(json['messageType']),
        timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
