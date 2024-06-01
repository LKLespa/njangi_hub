import 'package:njangi_hub/shared/shared.dart';

abstract class Group {
  Group._(
      this.gid,
      this.name,
      this.description,
      this.dateCreated,
      this.groupAdmins,
      this.groupMembers,
      this.groupInvites,
      this.groupRequests,
      this.groupChat,
      this.paymentAccount, this.photo);
  final String gid;
  final String name;
  final String? photo;
  final String? description;
  final DateTime? dateCreated;
  final List<String> groupAdmins;
  final List<Map<String, dynamic>> groupMembers;
  final List<Map<String, dynamic>> groupInvites;
  final List<Map<String, dynamic>> groupRequests;
  final PaymentAccount? paymentAccount;
  final GroupChat groupChat;
}