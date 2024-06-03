import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class JoinGroup extends ConsumerWidget {
  const JoinGroup({super.key, required this.groupId});
  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser!;
    String? info;
    final Stream<DocumentSnapshot<Map<String, dynamic>>> groupStream =
        FirebaseFirestore.instance
            .collection("njangi-groups")
            .doc(groupId)
            .snapshots();
    GroupMemberStatus userGroupStatus = GroupMemberStatus.none;
    
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: groupStream,
      builder: (context, snapshot) {
        NjangiGroup group = const NjangiGroup(gid: '', name: '');
        if(snapshot.hasData){
          group = NjangiGroup.fromJson(snapshot.data?.data() as Map<String, dynamic>);

          if (group.groupMembers.contains(user.uid)) {
            userGroupStatus = GroupMemberStatus.member;
            if (group.groupAdmins.contains(user.uid)) {
              userGroupStatus = GroupMemberStatus.admin;
            }
          }
          else if (group.groupInvites.contains(user.uid)) {
            userGroupStatus = GroupMemberStatus.invite;
            info = "You have been invited to this group";
          }
          else if (group.groupRequests.contains(user.uid)) {
            userGroupStatus = GroupMemberStatus.request;
            info = "You requested to Join this group";
          }
          else {
            userGroupStatus = GroupMemberStatus.none;
            info = "Request to Join this group";
          }

        }

        if(snapshot.hasError){
          return DisplayErrorWidget(error: snapshot.error as Exception);
        }

        return Skeletonizer(
          enabled: snapshot.connectionState == ConnectionState.waiting,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserImageAvatar(
                  radius: 50,
                  url: group.photo,
                  imageSource: FileSource.cachedNetwork,
                  fallbackUrl: Assets.imagesGroup,
                ),
                const Gap(10),
                Text(group.name, style: Theme.of(context).textTheme.titleLarge),
                Text(group.description ?? ""),
                const Gap(10),
                Text(
                    "${group.groupMembers.length} ${group.groupMembers.length == 1 ? "Member" : "Members"}"),
                const Divider(),
                Text(info ?? ""),
                buildUserActionButton(
                    context: context,
                    ref: ref,
                    user: user,
                    group: group,
                    groupMembershipStatus: userGroupStatus),
                Text('Date Created: ${group.dateCreated?.toMonDYrString()}')
              ],
            ),
          ),
        );
      }
    );
  }

  Widget buildUserActionButton(
      {required WidgetRef ref,
      required BuildContext context,
      required User user,
        required NjangiGroup group,
      required GroupMemberStatus groupMembershipStatus}) {
    final groupActivityNotifier =
        ref.watch(njangiGroupMethodsProvider.notifier);
    switch (groupMembershipStatus) {
      case GroupMemberStatus.member:
      case GroupMemberStatus.admin:
        return FilledButton.icon(
          onPressed: () => Navigator.popAndPushNamed(
              context, PageRoutes.njangiGroup,
              arguments: group.gid),
          icon: const Icon(Icons.arrow_forward_sharp),
          label: const Text("Continue to Group"),
        );
      case GroupMemberStatus.invite:
        return Row(
          children: [
            FilledButton.icon(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              icon: const Icon(Icons.check),
              label: const Text("Accept Invite"),
            ),
            FilledButton.icon(
              onPressed: () {},
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              icon: const Icon(Icons.cancel),
              label: const Text('Decline Invite'),
            )
          ],
        );
      case GroupMemberStatus.request:
        return FilledButton.icon(
          onPressed: () => groupActivityNotifier.cancelRequestToJoinGroup(groupId: groupId),
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red),
          ),
          icon: const Icon(Icons.cancel),
          label: const Text('Cancel Request'),
        );
      case GroupMemberStatus.none:
        return FilledButton(
          onPressed: () =>
              groupActivityNotifier.requestToJoinGroup(groupId: group.gid),
          child: const Text('Request to Join Group'),
        );
    }
  }
}
