import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class RegisterPage extends HookConsumerWidget {
  RegisterPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final phoneNumber = useState('');
    final selectedCountry = useState(Country(
      phoneCode: '237',
      countryCode: 'CM',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Cameroon',
      example: 'Cameroon',
      displayNameNoCountryCode: 'CM',
      displayName: 'Cameroon',
      e164Key: '',
    ));

    return Material(
      // color: Colors.transparent,
      child: Padding(
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
                      const Gap(50),
                      // Hero(
                      //     tag: 'logo',
                      //     child: Image.asset(Assets.imagesLogoVertical)),
                      // const Gap(5),
                      Text('Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      const Gap(5),
                      Text('Enter your phone number below',
                          style: Theme.of(context).textTheme.titleMedium),
                      const Gap(10),
                      TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 20, letterSpacing: 2),
                        decoration: InputDecoration(
                          filled: true,
                          counterText: "",
                          hintText: "Phone Number",
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    countryListTheme:
                                        const CountryListThemeData(
                                            bottomSheetHeight: 400),
                                    onSelect: (country) =>
                                        selectedCountry.value = country);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 3.5),
                                child: Text(
                                  "${selectedCountry.value.flagEmoji} +${selectedCountry.value.phoneCode}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          suffixIcon: phoneNumber.value.length >= 9
                              ? Container(
                                  height: 10,
                                  width: 10,
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                        onChanged: (value) =>
                            phoneNumber.value = value.trim(),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if(value.trim().length < 9) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      const Gap(10),
                      authState.isLoading ? const LoadingWidget() : Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    ref
                                        .watch(authNotifierProvider.notifier)
                                        .signInWithPhoneNumber(
                                        phoneNumber:
                                        "+${selectedCountry.value.phoneCode}${phoneNumber.value}",
                                        context: context);
                                  }
                                },
                                child: const Text('Login'),
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
