import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required String uid,
    required String token,
    required String name,
    required String userName,
    required String email,
    required String phone,
    @Default('') String aboutMe,
    @Default('') String photo,
    required bool isOnline,
    required DateTime? lastSeen,
    required DateTime createdAt,
    @Default([]) List<String> groupsGIDs,
    @Default([]) List<String> privateChatsCIDs,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}