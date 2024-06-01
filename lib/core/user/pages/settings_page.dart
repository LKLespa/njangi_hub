import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:toastification/toastification.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).user!;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Hero(
                  tag: TagNames.profilePhoto,
                  child: UserImageAvatar(
                    url: user.photo,
                    imageSource: FileSource.cachedNetwork,
                    radius: 30,
                  ),
                ),
                title: Text(user.name!),
                subtitle: Text("@${user.username!}"),
                trailing: IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: _copyUsername,
                ),
                onTap: () => Navigator.of(context).pushNamed(PageRoutes.profile)
              ),
              const Divider(),
              const Gap(10),
              ListTile(
                  leading: const Icon(Icons.palette, color: primaryColor),
                  title: const Text("Theme and Appearance"),
                  onTap: () => Navigator.of(context).pushNamed(PageRoutes.theme)
              ),
            ],
          ),
        ));
  }

  void _copyUsername() {
    // TODO: Copy username to clipboard
      toast(
          message: "Username copied",
          type: ToastificationType.info,
          time: 2,
          alignment: Alignment.bottomCenter);
  }
}
