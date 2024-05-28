import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class EmailVerificationPage extends HookConsumerWidget {
  EmailVerificationPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final email = useState('');

    Future<void> validateAndRegisterUser({required buildContext}) async {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        final authStateNotifier = ref.read(authNotifierProvider.notifier);
        authStateNotifier.updateState(authState.copyWith.tempUser!.call(email: email.value));
        authStateNotifier.registerUserToFirestore(context: context);
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Enter your email address\nOr skip this step', textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium),
                      const Gap(10),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(letterSpacing: 2),
                        decoration: const InputDecoration(
                          filled: true,
                          counterText: "",
                          hintText: "Enter Email (Optional)",
                          prefixIcon: Icon(Icons.email),
                        ),
                        onChanged: (value) =>
                        email.value = value.trim(),
                        onEditingComplete: () => validateAndRegisterUser(buildContext: context),
                        validator: (value) {
                          final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          if(value!.trim().isEmpty){
                            return null;
                          }
                          if (!emailRegex.hasMatch(value!.trim())) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const Gap(10),
                      if(authState.isLoading)
                        const LoadingWidget(),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: () => validateAndRegisterUser(buildContext: context),
                              child: const Text('Complete Sign Up'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.grey,
                    ),
                    Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("I have an account",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: primaryColor))))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
