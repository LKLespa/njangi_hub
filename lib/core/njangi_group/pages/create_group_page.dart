import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';

class CreateGroupPage extends HookConsumerWidget {
  CreateGroupPage({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupMethodsNotifier = ref.watch(njangiGroupMethodsProvider.notifier);
    final user = FirebaseAuth.instance.currentUser!;
    final groupImage = useState("");
    final groupName = useState("");
    final groupDescription = useState("");
    final isLoading = useState(false);

    Future<void> validate() async {
      if(formKey.currentState!.validate()){
        isLoading.value = true;
        final group = NjangiGroup(
            gid: FirebaseFirestore.instance.collection('njangi-groups').doc().id,
            name: groupName.value,
            description: groupDescription.value,
            photo: groupImage.value,
            groupAdmins: [user.uid],
            groupMembers: [user.uid],
            groupChat: GroupChat(),
            groupSettings: NjangiGroupSettings(),
            dateCreated: DateTime.now(),
        );
        try{
        await groupMethodsNotifier.createGroup(group: group);
        if(context.mounted){
          print("User is: ${ref.watch(authNotifierProvider).user}");
          Navigator.of(context).pushReplacementNamed(PageRoutes.njangiGroup);
        }
        } finally {
          isLoading.value = false;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Group")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(isLoading.value)
                    const LoadingWidget(),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: groupImage.value.isEmpty
                            ? const AssetImage(Assets.imagesImagePlaceholder)
                            : FileImage(File(groupImage.value))
                        as ImageProvider<Object>?,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: secondaryColor,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () async {
                              groupImage.value =
                                  (await selectImage(context: context)) ?? "";
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => groupName.value = value.trim(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Group name required';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Group Name',
                        prefixIcon: Icon(Icons.group)),
                  ),
                  const Gap(25),
                  TextFormField(
                      textInputAction: TextInputAction.done,
                      onChanged: (value) => groupDescription.value = value.trim(),
                      onEditingComplete: validate,
                      minLines: 2,
                      maxLines: 5,
                      maxLength: 300,
                      decoration: const InputDecoration(
                          hintText: 'Group description'
                      )
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                          child: FilledButton(
                              onPressed: validate,
                              child: const Text('Create Group'))),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
