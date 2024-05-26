import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:pinput/pinput.dart';


class OtpPage extends HookConsumerWidget {
  OtpPage({super.key});

  final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AuthState authState = ref.watch(authNotifierProvider);
   
    final inputPin = useState('');

    final defaultPinTheme = PinTheme(
      width: 40,
      height: 50,
      textStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.2),
      ),
    );

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
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
                        Text(
                            'Enter the 6-digit code sent to the number ${authState.tempUser?.phone}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium),
                        const Gap(30),
                        Pinput(
                          length: 6,
                          showCursor: true,
                          focusNode: focusNode,
                          onChanged: (value) => inputPin.value = value,
                          defaultPinTheme: defaultPinTheme,
                          onCompleted: (value){
                            inputPin.value = value;
                            if(formKey.currentState!.validate()){
                              ref.watch(authNotifierProvider.notifier).verifyPhoneAndSignIn(context: context, smsCode: inputPin.value);
                            }
                          },
                          forceErrorState: authState.error != null,
                          errorText: authState.error,
                          validator: (value) {
                            if (value!.length != 6) {
                              return 'Please enter 6 digits';
                            }
                            return null;
                          },
                          errorTextStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(
                                color: primaryColor,
                              ),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ),
                        if (authState.isLoading)
                          const LoadingWidget(),
                        const Gap(50),
                        // const LoadingWidget(),
                        Text("I haven't received a code",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: primaryColor)),
                        const Gap(10),
                        ElevatedButton(
                            onPressed: () {
                              if(formKey.currentState!.validate()){
                                ref.watch(authNotifierProvider.notifier).verifyPhoneAndSignIn(context: context, smsCode: inputPin.value);
                              }
                            },
                            child: Text("Resend Code",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: primaryColor)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
