import 'package:flutter/cupertino.dart';
import 'package:njangi_hub/core/authentication/authentication.dart' as auth;
import 'package:njangi_hub/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  auth.AuthState build() => const auth.AuthState();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;

      Future<void> verifyPhoneAndSignIn({required BuildContext context, required String smsCode}) async {
    state = state.copyWith(isAuthenticating: true, isLoading: true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(credential).then((value) async {
      print("User: ${value.user}");
      final firebaseUser = value.user;
      if(firebaseUser != null)
     {
       final user = auth.User(
         token: credential.token != null ? credential.token!.toString() : "",
         name: firebaseUser.displayName,
         userName: "",
         uid: firebaseUser.uid,
         email: firebaseUser.email,
         photo: firebaseUser.photoURL,
         phone: firebaseUser.phoneNumber,
         lastSeen: DateTime.now(),
         createdAt: DateTime.now(),
         isOnline: true,
         aboutMe: "",
       );
       state = state.copyWith(
           isLoading: false, isAuthenticating: false, user: user);
       print('State $user');
     }
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((error) {
      state = state.copyWith(isLoading: false, error: error.toString());
      toast(context: context, message: "An Error Occurred", type: ToastificationType.error);
    });
  }

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    state = state.copyWith(isAuthenticating: true, isLoading: true, error: null);
    print("Phone number: $phoneNumber");
    await _auth
        .verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) async {
              await _auth.signInWithCredential(credential).then((value) async {
                final user = auth.User(
                  token: value.credential!.token!.toString(),
                  name: value.user!.displayName,
                  userName: value.additionalUserInfo!.username,
                  uid: value.user!.uid,
                  email: value.user!.email,
                  photo: value.user!.photoURL,
                  phone: phoneNumber,
                  lastSeen: DateTime.now(),
                  createdAt: DateTime.now(),
                  isOnline: true,
                  aboutMe: value.additionalUserInfo!.profile?['aboutMe'],
                );

                state = state.copyWith(
                    isLoading: false, isAuthenticating: false, user: user);
                toast(
                    context: context,
                    message: 'Welcome to NjangiHub',
                    type: ToastificationType.success);
                print("Welcome to NjangiHub ${state.toString()}");
                Navigator.of(context).pushReplacementNamed('/home');
              });
            },
            verificationFailed: (e) {
              state = state.copyWith(isLoading: false, error: e.message);
              toast(
                  context: context,
                  title: "Authentication Error",
                  message: e.message!,
                  type: ToastificationType.error);
              print("Authentication Error: ${e.message}");
            },
            codeSent: (verifyId, resendToken) {
              verificationId = verifyId;
              toast(
                  context: context,
                  message: "A 6-digit verification code was sent to $phoneNumber",
                  type: ToastificationType.info);
              state = state.copyWith(
                  isLoading: false,
                  error: null,
                  tempUser: auth.User(
                      uid: '',
                      phone: phoneNumber,
                      isOnline: true,
                      aboutMe: ''));
              Navigator.of(context).pushNamed('/otp');
            },
            codeAutoRetrievalTimeout: (value) {
            })
        .catchError((error, stackTrace) {
      state = state.copyWith(isLoading: false, error: error.toString().substring(0, 20));
      toast(
          context: context,
          message: error.toString(),
          type: ToastificationType.error);
      print("Catch Error$error");
    });
  }
}
