import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends StatefulHookWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final buttonController = RoundedLoadingButtonController();

  @override
  void dispose(){
    super.dispose();
    buttonController.stop();
  }
  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
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
                                        countryListTheme: const CountryListThemeData(
                                          bottomSheetHeight: 400
                                        ),
                                        onSelect: (country) => selectedCountry.value = country);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 3.5),
                                    child: Text("${selectedCountry.value.flagEmoji} +${selectedCountry.value.phoneCode}", style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ),
                              ),
                              suffixIcon: phoneNumber.value.length >= 9 ? Container(
                                height: 10,
                                width: 10,
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.done, color: Colors.white, size: 20,),
                              ) : null,
                          ),
                          onChanged: (value) => phoneNumber.value = value.trim(),
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
                  const Gap(20),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),
                  Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text("I don't have an account",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: primaryColor)))),
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
