import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class UserInformationRegisterationPage extends HookConsumerWidget {
  UserInformationRegisterationPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateNotifier = ref.read(authNotifierProvider.notifier);
    final authState = ref.watch(authNotifierProvider);
    final userImage = useState('');
    final displayName = useState('');
    final userName = useState('');
    final ValueNotifier<String?> userNameError = useState(null);

    if(context.mounted){
      print("User information in registeration screen ${authStateNotifier.state}");
    }

    Future<void> selectImage() async {
      File? fileImage, croppedFileImage;
      Future<void> onSelect(bool camera) async {
        fileImage = await pickImage(context: context, fromCamera: false);
        if (fileImage != null) {
          // TODO: Crop the image
          // croppedFileImage = await cropImage(fileImage!.path);
          // if (croppedFileImage != null) {
          //   userImage.value = croppedFileImage!.path;
          // } else {
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

    Future<void> validateAndProceed() async {
      if (formKey.currentState!.validate()) {
        final bool? userNameExist = await authStateNotifier
            .checkIfUsernameExist(context: context, username: userName.value);

        if (userNameExist != null && !userNameExist) {
          userNameError.value = null;
          // authState.copyWith.tempUser!.call(
          //     userName: userName.value,
          //     photo: userImage.value,
          //     name: userName.value);
          print('Ok');
          if (context.mounted) {
            Navigator.of(context).pushNamed(PageRoutes.enterEmail);
          }
        }
        if (userNameExist != null && userNameExist) {
          userNameError.value = 'Username already exist';
          return;
        }
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
                      Text('Verification',
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
                        ),
                      ),
                      const Gap(20),
                      if (ref.watch(authNotifierProvider).isLoading)
                        const LoadingWidget(),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        onChanged: (value) => userName.value = value.trim(),
                        onEditingComplete: () => validateAndProceed(),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your username';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9_]+$')
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
                          errorText: userNameError.value,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                              child: FilledButton(
                                  onPressed: validateAndProceed,
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
