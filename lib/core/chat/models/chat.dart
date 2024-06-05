import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/chat/chat.dart';

part 'chat.g.dart';
part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  const Chat._();
  factory Chat({
    required String chatId,
    required bool isGroup,
    required bool isNjangiGroup,
    @Default([]) List<Message> messages,
}) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
