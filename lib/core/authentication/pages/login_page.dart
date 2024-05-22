import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/shared/shared.dart';

class LoginPage extends HookWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final email = useState('');
    final password = useState('');
    final hidePassword = useState(true);

    return Material(
      // color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(55),
                        // Hero(
                        //     tag: 'logo',
                        //     child: Image.asset(Assets.imagesLogoVertical)),
                        // const Gap(5),
                        Text('Log In',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        const Gap(5),
                        Text('Enter your login details below',
                            style: Theme.of(context).textTheme.titleMedium),
                        const Gap(10),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => email.value = value.trim(),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!RegExp(r'^[\w-.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value.trim())) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'YOUR EMAIL',
                            suffixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: hidePassword.value,
                          onChanged: (value) => password.value = value.trim(),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'YOUR PASSWORD',
                            suffix: IconButton(
                                onPressed: () =>
                                    hidePassword.value = !hidePassword.value,
                                icon: Icon(hidePassword.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: primaryColor),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: FilledButton(
                                    onPressed: login,
                                    child: const Text('Login'))),
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
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text("I don't have an account",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: primaryColor)))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }
}
