import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:njangi_hub/shared/widgets/error_widget.dart' as err;
import 'package:skeletonizer/skeletonizer.dart';

class AllUsersPage extends StatefulHookConsumerWidget {
  const AllUsersPage({super.key});

  @override
  ConsumerState<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends ConsumerState<AllUsersPage> {
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    super.initState();
    final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
    final collectionRef = FirebaseFirestore.instance.collection("users");
    _usersStream = firebaseUser != null
        ? collectionRef
            .where("uid", isNotEqualTo: firebaseUser.uid)
            .orderBy('createdAt')
            .snapshots()
        : collectionRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
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
                onTap: () => Navigator.of(context)
                    .pushNamed(PageRoutes.usersProfile, arguments: user),
              );
            },
          ),
        );
      },
    );
  }
}
