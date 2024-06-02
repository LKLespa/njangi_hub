import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/njangi_group/models/njangi_group.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/functions/check_internet_connectivity.dart';
import 'package:njangi_hub/shared/functions/toast.dart';
import 'package:njangi_hub/shared/functions/upload_file.dart';
import 'package:njangi_hub/shared/models/group_chat.dart';
import 'package:njangi_hub/shared/models/group_member_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';

part 'njangi_group_methods.g.dart';

@Riverpod(keepAlive: false)
class NjangiGroupMethods extends _$NjangiGroupMethods {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  String? errorMessage;

  @override
  NjangiGroup? build() {
    _db.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    return null;
  }

  Future<void> createGroup({required NjangiGroup group}) async {
    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (!isConnected) {
      return;
    }
    try {
      String? groupPhoto;
      if (group.photo != null) {
        groupPhoto = await uploadFileToDb(
            file: File(group.photo!),
            path: "group-profile-photos/${group.gid}");
      }
      group = group.copyWith(photo: groupPhoto);
      final groupCollectionRef = _db.collection("njangi-groups");
      final data = group.toJson();
      data.remove('groupChat');
      data.remove('groupSettings');
      data.remove('groupCircles');
      await groupCollectionRef.doc(group.gid).set(data);
      state = group;
      ref.read(authNotifierProvider.notifier).addUsersToGroup(
          whichGroup: GroupMemberStatus.admin, group: {
            "groupId": group.gid,
            "DateJoined": DateTime.now(),
            "role": "admin"
      });
      // final settingsCollectionRef = _db.collection("njangi-groups/${group.gid}/group-settings");
      // settingsCollectionRef.add(group.groupSettings!.toJson());
      //
      // final groupChatCollectionRef = _db.collection("njangi-groups/${group.gid}/group-chat");
      // groupChatCollectionRef.add(group.groupChat!.toJson());
      //
      // final groupCirclesCollectionRef = _db.collection("njangi-groups/${group.gid}/group-circles");
      // for (final groupCircle in group.groupCircles){
      //   groupCirclesCollectionRef.add(groupCircle.toJson());
      // }
    } catch (err) {
      toast(message: err.toString(), type: ToastificationType.error);
    }
    await Future.delayed(const Duration(seconds: 3));
  }
}
