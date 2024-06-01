import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_chat.freezed.dart';
part 'group_chat.g.dart';

@freezed
class GroupChat with _$GroupChat {
  factory GroupChat() = _GroupChat;

  factory GroupChat.fromJson(Map<String, dynamic> json) => _$GroupChatFromJson(json);
}