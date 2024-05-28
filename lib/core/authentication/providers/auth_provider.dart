import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:njangi_hub/core/authentication/authentication.dart' as auth;
import 'package:njangi_hub/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late String verificationId;

  @override
  auth.AuthState build() {
    print("AUTHSTATE HAS BEEN SET");
    _db.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    return const auth.AuthState();
  }

  void updateState(auth.AuthState newState) {
    state = newState;
  }

  Future<void> verifyPhoneAndSignIn(
      {required BuildContext context, required String smsCode}) async {
    state = state.copyWith(isLoading: true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    final isConnected = await checkInternetConnectivity(context: context, showIfTrue: false, showIfFalse: true);
    if (isConnected){
      await _auth.signInWithCredential(credential).then((value) async {
        print("User in sign in: ${value.user}");
        final user = value.user;
        if (user != null) {
          _checkIfUserExistsAndGetUserFromFirestoreAndContinue(
              context: context, user: user);
        }
      }).catchError((error) {
        state = state.copyWith(isLoading: false, error: error.toString());
        toast(
            context: context,
            message: "An Error Occurred",
            type: ToastificationType.error);
      });
    } else {
      state = state.copyWith(isLoading: false, error: "No Internet Connection");
    }
  }

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    state =
        state.copyWith(isAuthenticating: true, isLoading: true, error: null);
    print("Phone number: $phoneNumber");

    final isConnected = await checkInternetConnectivity(context: context, showIfTrue: false, showIfFalse: true);
    if(isConnected){
      await _auth
          .verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential).then((value) async {
              print("User in verification: ${value.user}");
              final user = value.user;
              if (user != null) {
                _checkIfUserExistsAndGetUserFromFirestoreAndContinue(
                    context: context, user: user);
              }
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
    } else {
      state = state.copyWith(isLoading: false, error: "No Internet Connection");
    }
  }

  Future<bool?> _checkIfUserExistsAndGetUserFromFirestoreAndContinue(
      {required User user,
      required BuildContext context,
      bool shouldNavigate = true}) async {
    state = state.copyWith(isLoading: true);
    try {
      final docRef = _db.collection("users").doc(user.uid);
      final userExist = await docRef.get().then(
        (DocumentSnapshot doc) {
          if (doc.exists) {
            state = state.copyWith(
                user: auth.User.fromJson(doc.data() as Map<String, dynamic>),
                tempUser: null,
                isAuthenticating: false);
            print("User already exists ${state.user}");
            if (shouldNavigate) {
              Navigator.of(context).pushReplacementNamed(PageRoutes.home);
            }
            return true;
          } else {
            state = state.copyWith(
                tempUser: auth.User(
                    uid: user.uid, phone: user.phoneNumber, email: user.email),
                user: null);
            print("User does not exist $state");
            if (shouldNavigate) {
              Navigator.of(context)
                  .pushReplacementNamed(PageRoutes.userInformation);
            }
            return false;
          }
        },
      ).whenComplete(() => state = state.copyWith(isLoading: false));
      return userExist;
    } catch (error) {
      if (context.mounted) {
        toast(
            context: context,
            message: error.toString(),
            type: ToastificationType.error);
      }
      print("Failed to CHECK: $error}");
      return null;
    }
  }

  Future<bool?> checkIfUsernameExist(
      {required String username, required BuildContext context}) async {
    state = state.copyWith(isLoading: true);
    try {
      final docRef =
          _db.collection("users").where("username", isEqualTo: username);
      final userNameExist = await docRef.get().then((querySnapshot) {
        final x = querySnapshot.metadata.isFromCache;
        print('IS FROM CACHE $x');
        return querySnapshot.docs.isNotEmpty;
      });
      return userNameExist;
    } catch (error) {
      if (context.mounted) {
        toast(
            context: context,
            message: error.toString(),
            type: ToastificationType.error);
      }
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
