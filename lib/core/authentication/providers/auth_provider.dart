import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late String verificationId;

  Future<void> _checkFirebaseUserAndContinue(
      {required BuildContext context,
      required PhoneAuthCredential phoneCredential,
      required UserCredential userCredential}) async {
    final firebaseUser = userCredential.user;
    if (firebaseUser != null) {
      final userExists =
          await checkIfUserExistsAndGetUserFromFirestore(firebaseUser);
      if (context.mounted) {
        if (userExists) {
          print("User already exists ${state.user}");
          Navigator.of(context).pushReplacementNamed(PageRoutes.home);
        } else {
          print("User doesn't exists ${state.tempUser}");
          Navigator.of(context)
              .pushReplacementNamed(PageRoutes.userInformation);
        }
      }
    }
  }

  Future<void> verifyPhoneAndSignIn(
      {required BuildContext context, required String smsCode}) async {
    state = state.copyWith(isLoading: true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    await _auth.signInWithCredential(credential).then((value) async {
      print("User in sign in: ${value.user}");
      _checkFirebaseUserAndContinue(
          context: context, phoneCredential: credential, userCredential: value);
    }).catchError((error) {
      state = state.copyWith(isLoading: false, error: error.toString());
      toast(
          context: context,
          message: "An Error Occurred",
          type: ToastificationType.error);
    });
  }

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    state =
        state.copyWith(isAuthenticating: true, isLoading: true, error: null);
    print("Phone number: $phoneNumber");
    await _auth
        .verifyPhoneNumber(
            phoneNumber: phoneNumber,
            timeout: const Duration(seconds: 60),
            verificationCompleted: (PhoneAuthCredential credential) async {
              await _auth.signInWithCredential(credential).then((value) async {
                print("User in verification: ${value.user}");
                _checkFirebaseUserAndContinue(
                    context: context,
                    phoneCredential: credential,
                    userCredential: value);
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
                  message:
                      "A 6-digit verification code was sent to $phoneNumber",
                  type: ToastificationType.info);
              state = state.copyWith(
                  isLoading: false,
                  error: null,
                  tempUser: auth.User(
                      uid: '',
                      phone: phoneNumber,
                      isOnline: true,
                      aboutMe: ''));
              Navigator.of(context).pushNamed(PageRoutes.otpVerify);
            },
            codeAutoRetrievalTimeout: (value) {})
        .catchError((error, stackTrace) {
      state = state.copyWith(
          isLoading: false, error: error.toString().substring(0, 20));
      toast(
          context: context,
          message: error.toString(),
          type: ToastificationType.error);
      print("Catch Error$error");
    });
  }

  Future<bool> checkIfUserExistsAndGetUserFromFirestore(User user) async {
    const source = Source.cache;
    state = state.copyWith(isLoading: true);
    DocumentSnapshot documentSnapshot = await _db
        .collection("users")
        .doc(user.uid)
        .get(const GetOptions(source: source))
        .whenComplete(() => state = state.copyWith(isLoading: false));
    if (documentSnapshot.exists) {
      state = state.copyWith(
          isLoading: false,
          isAuthenticating: false,
          user: auth.User.fromJson(
              documentSnapshot.data() as Map<String, dynamic>));
      // TODO: Save data to hive local storage
    } else {
      state = state.copyWith(
          isLoading: false,
          user: null,
          tempUser: auth.User(
              uid: user.uid,
              phone: user.phoneNumber,
              token: user.refreshToken));
    }
    return documentSnapshot.exists;
  }

  Future<bool?> checkIfUsernameExist(
      {required String username, required BuildContext context}) async {
    state = state.copyWith(isLoading: true);
    try {
      final querySnapshot = await _db
          .collection("users")
          .where("username", isEqualTo: username)
          .get()
          .whenComplete(() => state = state.copyWith(isLoading: false));

      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      if(context.mounted){
        toast(context: context, message: error.toString(), type: ToastificationType.error);
      }
    }
    return null;
  }
}
