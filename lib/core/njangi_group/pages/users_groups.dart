import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:njangi_hub/shared/widgets/error_widget.dart' as err;
import 'package:skeletonizer/skeletonizer.dart';

class UsersGroups extends StatefulHookConsumerWidget {
  const UsersGroups({super.key});

  @override
  ConsumerState<UsersGroups> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends ConsumerState<UsersGroups> {
  late Stream<QuerySnapshot> _usersGroupsStream;

  @override
  void initState() {
    super.initState();
    final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
    final groupIDs = ref.read(authNotifierProvider).user?.groupsGIDs;
    _usersGroupsStream = FirebaseFirestore.instance.collection("groups").where("members", arrayContains: {"uid": firebaseUser?.uid}).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    return StreamBuilder<QuerySnapshot>(
      stream: _usersGroupsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return err.ErrorWidget(
            error: snapshot.error,
          );
        }

        int itemCount = 0;
        List<User> users = [];
        if (snapshot.hasData) {
          itemCount = snapshot.data!.docs.length;
          users = snapshot.data!.docs
              .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
              .toList();
        }

        return Skeletonizer(
          enabled: snapshot.connectionState == ConnectionState.waiting,
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.name!),
                subtitle: Text("@${user.username!}"),
                trailing: auth.user!.isOnline
                    ? Text(user.isOnline ? "Online" : "Offline",
                    style: TextStyle(
                        color: user.isOnline ? Colors.green : Colors.grey))
                    : null,
                leading: Hero(
                  tag: user.uid,
                  child: UserImageAvatar(
                    imageSource: FileSource.cachedNetwork,
                    url: user.photo,
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(PageRoutes.usersProfile, arguments: user),
              );
            },
          ),
        );
      },
    );
  }
}
