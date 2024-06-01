import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:njangi_hub/shared/widgets/error_widget.dart' as err;

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ModalRoute.of(context)!.settings.arguments as String?;
    final Stream<DocumentSnapshot> userStream =
        FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    final currentUser = ref.watch(authNotifierProvider).user!;

    return StreamBuilder<DocumentSnapshot>(
        stream: userStream,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return err.ErrorWidget(error: snapshot.error);
          }

          User user = User(uid: '');
          if (snapshot.hasData) {
            print("Snapshot data ${snapshot.data!['name']}");
            user = User.fromJson(snapshot.data!.data() as Map<String, dynamic>);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("${user.name}'s Profile"),
            ),
            body: SingleChildScrollView(
              child: Skeletonizer(
                enabled: snapshot.connectionState == ConnectionState.waiting,
                child: Column(
                  children: [
                    const Gap(15),
                    Center(
                      child: Hero(
                          tag: user.uid,
                          child: UserImageAvatar(
                            url: user.photo,
                            imageSource: FileSource.cachedNetwork,
                            radius: 100,
                            onTap: () => navigatorPush(
                                context: context,
                                nextPage: ImageViewer(
                                  url: user.photo,
                                  source: FileSource.cachedNetwork,
                                  imageTag: TagNames.profilePhoto,
                                )),
                          )),
                    ),
                    if (currentUser.isOnline)
                      Center(
                        child: Chip(
                          side: BorderSide.none,
                          label: Text(user.isOnline ? "Online" : "Offline"),
                          backgroundColor: user.isOnline
                              ? Colors.green.withOpacity(0.5)
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              // TODO: Go to message
                            },
                            icon: const Icon(Icons.message)),
                        IconButton(
                            onPressed: () {
                              // TODO: Call
                            },
                            icon: const Icon(Icons.call)),
                        IconButton(
                            onPressed: () {
                              // TODO: Save contact
                            },
                            icon: const Icon(Icons.save_alt)),
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(user.name ?? ""),
                      subtitle: Text("@${user.username}"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.copy)
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(user.phone ?? ""),
                      onTap: _showPhoneNumberOptions,
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(user.email == null || user.email!.isEmpty
                          ? "No email"
                          : user.email!),
                      onTap: _showEmailOptions,
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_month),
                      title: Text("Joined on ${user.createdAt?.toMonthDYrString()}"),
                    ),
                    const Gap(10),
                    if(user.aboutMe.isNotEmpty)
                    Row(
                      children: [
                        const Expanded(child: Divider(),),
                        Text('About ${user.name}', style: Theme.of(context).listTileTheme.titleTextStyle),
                        const Expanded(child: Divider(),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(user.aboutMe),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _editNameAndUsername() {
    // TODO: Edit the name and username
  }

  void _changePhoneNumber() {
    // TODO: Change Phone Number
  }

  void _showPhoneNumberOptions() {
    // TODO: Show the phone number options
  }

  void _changeEmail() {
    // TODO: Change Email
  }

  void _showEmailOptions() {
    // TODO: Show email options
  }
}
