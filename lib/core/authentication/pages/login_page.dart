import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/generated/assets.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final email = useState('');
    final password = useState('');

    return Material(
      color: Colors.transparent,
      child: Padding(padding: const EdgeInsets.all(3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.imagesLogoVertical),
            Text('Log In', style: Theme.of(context).textTheme.titleMedium),
            const Text('Enter your login details below',),
            Form(
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) => email.value = value.trim(),
                        validator: (value) {
                          if (value!.trim().isEmpty) return 'Please enter your email address';
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),),
    );
  }
}
