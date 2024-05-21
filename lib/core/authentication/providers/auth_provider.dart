import 'package:flutter/cupertino.dart';
import 'package:njangi_hub/core/authentication/authentication.dart' as auth;
import 'package:njangi_hub/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toastification/toastification.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  auth.AuthState build() => const auth.AuthState.unauthenticated();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storgae = FirebaseStorage.instance;

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    state = const auth.AuthState.authenticating();
    print("Phone number: $phoneNumber");
    await _auth
        .verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) async {
              await _auth.signInWithCredential(credential).then((value) async {
                final user = auth.User(
                  token: value.credential!.token!.toString(),
                  name: value.user!.displayName ?? "",
                  userName: value.additionalUserInfo!.username ?? "",
                  uid: value.user!.uid,
                  email: value.user!.email ?? "",
                  photo: value.user!.photoURL ?? "",
                  phone: phoneNumber,
                  lastSeen: DateTime.now(),
                  createdAt: DateTime.now(),
                  isOnline: true,
                  aboutMe: value.additionalUserInfo!.profile?['aboutMe'],
                );

                state = auth.AuthState.authenticated(user);
                toast(
                    context: context,
                    message: 'Welcome to NjangiHub',
                    type: ToastificationType.success);
                print("Welcome to NjangiHub ${state.toString()}");
              });
            },
            verificationFailed: (e) {
              state = auth.AuthState.error(e.message!);
              toast(
                  context: context,
                  title: "Authentication Error",
                  message: e.message!,
                  type: ToastificationType.error);
              print("Authentication Error: ${e.message}");
            },
            codeSent: (codeString, codeInt) {
              toast(
                  context: context,
                  message: codeString,
                  type: ToastificationType.info);
              state = const auth.AuthState.authenticateProgressive(1);
              print('Code sent to $codeString and $codeInt');
            },
            codeAutoRetrievalTimeout: (value) {
              state = const auth.AuthState.error("Code auto retrieval timeout");
              toast(
                  context: context,
                  message: "Code auto retrieval timeout",
                  type: ToastificationType.error);
            })
        .catchError((error, stackTrace) {
      state = auth.AuthState.error(error.toString());
      toast(
          context: context,
          message: error.toString(),
          type: ToastificationType.error);
      print("Catch Error$error");
    });
  }
}
