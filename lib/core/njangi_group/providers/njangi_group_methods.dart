import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';

part 'njangi_group_methods.g.dart';

@Riverpod(keepAlive: false)
class NjangiGroupMethods extends _$NjangiGroupMethods {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;
  final user = firebase.FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
      final user = ref.watch(authNotifierProvider).user;
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
      addUserToGroup(
          addUserAs: GroupMemberStatus.admin, user: user, groupId: group.gid);
    } catch (err) {
      toast(message: err.toString(), type: ToastificationType.error);
    }
  }

  Future<void> addUserToGroup({
    required GroupMemberStatus addUserAs,
    required String groupId,
    required User? user,
  }) async {
    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (!isConnected) {
      return;
    }

    if (user == null) {
      return;
    }

    if (groupId.trim().isEmpty) {
      return;
    }

    final Map<String, dynamic> data = {
      'groupId': groupId,
      'dateJoined': DateTime.now(),
      'role': addUserAs.name,
    };

    try {
      if (addUserAs == GroupMemberStatus.admin ||
          addUserAs == GroupMemberStatus.member) {
        final docRef = _db.collection("users/${user.uid}/njangi-groups");
        await docRef.add(data);
        final newGroupIds = [...(user.groupsGIDs), data];
        if (user.uid == _auth.currentUser?.uid) {
          final authNotifier = ref.watch(authNotifierProvider.notifier);
          authNotifier.updateUser(user.copyWith.call(groupsGIDs: newGroupIds));
        }
        if (addUserAs == GroupMemberStatus.member) {
          final groupDocRef = _db.collection("njangi-groups").doc(groupId);
          groupDocRef.update({
            "groupMembers": FieldValue.arrayUnion([user.uid])
          });
        }
      }
    } catch (e) {
      toast(message: e.toString(), type: ToastificationType.error);
    }
    return;
  }

  Future<void> requestToJoinGroup({required String groupId}) async {
    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (!isConnected || user == null || groupId.trim().isEmpty) {
      return;
    }

    final Map<String, dynamic> data = {
      'groupId': groupId,
      'dateRequested': DateTime.now(),
    };

    try {
      final docRef =
          await _db.collection("users/${user.uid}/group-requests").add(data);
      _db.collection("njangi-groups").doc(groupId).update({
        "groupRequests": FieldValue.arrayUnion([user.uid])
      });
      toast(message: "Group Request Sent", type: ToastificationType.info);
      print("User is $user");
    } catch (e) {
      toast(message: e.toString(), type: ToastificationType.error);
    }
  }

  Future<void> cancelRequestToJoinGroup({required String groupId}) async {
    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (!isConnected) {
      return;
    }

    if (groupId.trim().isEmpty) {
      toast(message: "An Error Occured", type: ToastificationType.error);
      return;
    }

    try {
      final docSnapshots = await _db
          .collection("users/${user.uid}/group-requests")
          .where('groupId', isEqualTo: groupId)
          .limit(1)
          .get();
      if(docSnapshots.docs.isNotEmpty){
        final requestId = docSnapshots.docs.first.id;
        final docRef =
        _db.collection("users/${user.uid}/group-requests").doc(requestId);
        docRef.delete();
      }
      _db.collection("njangi-groups").doc(groupId).update({
        "groupRequests": FieldValue.arrayRemove([user.uid])
      });
      toast(message: "Request Cancelled", type: ToastificationType.info);
    } catch (e) {
      print("CANCEL REQUEST ERROR: $e");
      toast(message: e.toString(), type: ToastificationType.error);
    }
    return;
  }

  Future<void> inviteToJoinGroup(
      {required String groupId, required User user}) async {
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    final user = ref.watch(authNotifierProvider).user;

    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (!isConnected) {
      return;
    }

    if (user == null) {
      return;
    }

    if (groupId.trim().isEmpty) {
      return;
    }

    final Map<String, dynamic> data = {
      'groupId': groupId,
      'dateInvited': DateTime.now(),
    };

    try {
      final docRef = _db.collection("users/${user.uid}/group-invites");
      final groupDocRef = _db.collection("njangi-groups").doc(groupId);
      final newInvitedGroupIds = [...(user.groupInvitesGIDs), data];
      await docRef.add(data);
      authNotifier.updateUser(
          user.copyWith.call(groupRequestsGIDs: newInvitedGroupIds));
      groupDocRef.update({
        "groupInvites": FieldValue.arrayUnion([user.uid])
      });
    } catch (e) {
      toast(message: e.toString(), type: ToastificationType.error);
    }
    return;
  }
}
