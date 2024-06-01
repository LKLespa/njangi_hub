import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required String uid,
    String? token,
    String? name,
    String? username,
    String? email,
    String? phone,
    @Default('') String aboutMe,
    String? photo,
    @Default(false) bool isOnline,
    DateTime? lastSeen,
    DateTime? createdAt,
    @Default([]) List<Map<String, dynamic>> groupsGIDs,
    @Default([]) List<Map<String, dynamic>> groupRequestsGIDs,
    @Default([]) List<Map<String, dynamic>> groupInvitesGIDs,
    @Default([]) List<Map<String, dynamic>> privateChatsCIDs,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}