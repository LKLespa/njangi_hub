import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final user = auth.user!;
    final authNotifier = ref.watch(authNotifierProvider.notifier);
    final authUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
              onPressed: () async {
                await authNotifier.logout();
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushNamed(PageRoutes.login);
                },
              icon: const Icon(Icons.logout),
              tooltip: "Logout",
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (auth.isLoading) const LoadingWidget(),
              const Gap(15),
              Center(
                child: Stack(
                  children: [
                    Hero(
                        tag: TagNames.profilePhoto,
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
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: secondaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(user.name!),
                subtitle: Text("@${user.username}"),
                trailing: IconButton(
                  onPressed: _editNameAndUsername,
                  icon: const Icon(Icons.edit),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(user.phone!),
                trailing: IconButton(
                  onPressed: _changePhoneNumber,
                  icon: const Icon(Icons.edit),
                ),
                onTap: _showPhoneNumberOptions,
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(user.email == null || user.email!.isEmpty
                    ? "No email"
                    : user.email!),
                subtitle: user.email != null && user.email!.isNotEmpty
                    ? Text(
                        authUser.emailVerified ? "Verified" : "Not verified",
                        style: TextStyle(
                            color: authUser.emailVerified
                                ? Colors.green
                                : Colors.red),
                      )
                    : null,
                trailing: IconButton(
                  onPressed: _changeEmail,
                  icon: const Icon(Icons.edit),
                ),
                onTap: _showEmailOptions,
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: Text(
                    "Joined on ${authUser.metadata.creationTime?.toMonthDYrString()}"),
              ),
              const Gap(10),
              user.aboutMe.isNotEmpty
                  ? Row(
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        Text('About Me',
                            style:
                                Theme.of(context).listTileTheme.titleTextStyle),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    )
                  : TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('Add about me'),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(user.aboutMe),
              ),
            ],
          ),
        ));
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
