import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class UserInformationRegistrationPage extends HookConsumerWidget {
  UserInformationRegistrationPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateNotifier = ref.read(authNotifierProvider.notifier);
    final userImage = useState('');
    final displayName = useState('');
    final userName = useState('');
    final ValueNotifier<String?> userNameError = useState(null);

    Future<void> selectImage() async {
      File? fileImage;
      Future<void> onSelect(bool camera) async {
        fileImage = await pickImage(fromCamera: camera);
        if (fileImage != null) {
          // TODO: Crop the image
          userImage.value = fileImage!.path;
          // }
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      }

      if (context.mounted) {
        await showModalBottomSheet(
          context: context,
          builder: (_) => Container(
            width: double.maxFinite,
            height: 200,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.camera,
                      size: 20,
                    ),
                    title: const Text('From Camera'),
                    onTap: () => onSelect(true),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.image,
                      size: 20,
                    ),
                    title: const Text('From Gallery'),
                    onTap: () => onSelect(false),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }

    Future<void> getLostPickedImage() async {
      final lostImageFile = await getLostImage();
      if (lostImageFile != null) {
        userImage.value = lostImageFile.path;
      }
    }

    getLostPickedImage();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('User Information',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      const Gap(15),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 75,
                            backgroundImage: userImage.value.isEmpty
                                ? const AssetImage(Assets.imagesUser)
                                : FileImage(File(userImage.value))
                                    as ImageProvider<Object>?,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green,
                              child: IconButton(
                                icon: const Icon(Icons.camera_alt),
                                onPressed: () => selectImage(),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => displayName.value = value,
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            prefixIcon: Icon(Icons.person)),
                      ),
                      const Gap(20),
                      if (ref.watch(authNotifierProvider).isLoading)
                        const LoadingWidget(),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onChanged: (value) => userName.value = value.trim(),
                        onEditingComplete: () {
                          authStateNotifier.validateFormAndProceed(
                              formKey: formKey,
                              context: context,
                              error: userNameError,
                              data: {
                                'displayName': displayName.value,
                                'username': userName.value,
                                'userImage': userImage.value
                              });
                        },
                        validator: (value) {
                          if (value!.trim().isNotEmpty && !RegExp(r'^[a-zA-Z0-9_]+$')
                              .hasMatch(value.trim())) {
                            // If the value contains symbols and spaces, return an error message
                            return 'Use only letters, numbers, and underscores (_)';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          helperText:
                              'Use only contain letters, numbers, and underscores (_)',
                          hintText: 'Username',
                          prefixIcon: const Icon(Icons.person),
                          errorText: userNameError.value,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                              child: FilledButton(
                                  onPressed: () {
                                    authStateNotifier.validateFormAndProceed(
                                        formKey: formKey,
                                        context: context,
                                        error: userNameError,
                                        data: {
                                          'displayName': displayName.value,
                                          'username': userName.value,
                                          'userImage': userImage.value
                                        });
                                  },
                                  child: const Text('Continue'))),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
