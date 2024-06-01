import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';

part 'njangi_group.g.dart';
part 'njangi_group.freezed.dart';

@freezed
sealed class NjangiGroup extends Group with _$NjangiGroup {
  const factory NjangiGroup({
    required String gid,
    required String name,
    String? description,
    DateTime? dateCreated,
    @Default([]) List<String> groupAdmins,
    @Default([]) List<Map<String, dynamic>> groupMembers,
    @Default([]) List<Map<String, dynamic>> groupInvites,
    @Default([]) List<Map<String, dynamic>> groupRequests,
    @Default(0) double currentAmount,
    PaymentAccount? paymentAccount,
    required GroupChat groupChat,
    required NjangiGroupSettings groupSettings,
    @Default([]) List<NjangiGroupCircle> groupCircles,
  }) = _NjangiGroup;

  factory NjangiGroup.fromJson(Map<String, dynamic> json) => _$NjangiGroupFromJson(json);
}
