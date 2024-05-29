import 'dart:async';
import 'dart:io';

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
  int? resendToken;

  @override
  auth.AuthState build() {
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

    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (isConnected) {
      await _auth.signInWithCredential(credential).then((value) async {
        final user = value.user;
        if (user != null) {
          _checkIfUserExistsAndGetUserFromFirestoreAndContinue(
              context: context, user: user);
        }
      }).catchError((error) {
        state = state.copyWith(isLoading: false, error: error.toString());
        toast(message: "An Error Occurred", type: ToastificationType.error);
      });
    } else {
      state = state.copyWith(isLoading: false, error: "No Internet Connection");
    }
  }

  // TODO: Resend code

  Future<void> signInWithPhoneNumber(
      {required String phoneNumber, required BuildContext context, bool shouldResendToken = false}) async {
    state =
        state.copyWith(isAuthenticating: true, isLoading: true, error: null);

    final isConnected = await checkInternetConnectivity(
        showIfConnected: false, showIfNotConnected: true);
    if (isConnected) {
      await _auth
          .verifyPhoneNumber(
              forceResendingToken: shouldResendToken ? resendToken : null,
              phoneNumber: phoneNumber,
              timeout: const Duration(seconds: 60),
              verificationCompleted: (PhoneAuthCredential credential) async {
                await _auth
                    .signInWithCredential(credential)
                    .then((value) async {
                  final user = value.user;
                  if (user != null) {
                    _checkIfUserExistsAndGetUserFromFirestoreAndContinue(
                        context: context, user: user);
                  }
                });
              },
              verificationFailed: (e) {
                state = state.copyWith(isLoading: false, error: e.message);
                toast(message: e.message!, type: ToastificationType.error);
              },
              codeSent: (verifyId, resToken) {
                verificationId = verifyId;
                resendToken = resToken;
                toast(
                    message:
                        "A 6-digit verification code was sent to $phoneNumber",
                    type: ToastificationType.info);
                state = state.copyWith(
                    isLoading: false,
                    error: null,
                    tempUser: auth.User(
                      uid: '',
                      phone: phoneNumber,
                    ));
                if(!shouldResendToken) {
                  Navigator.of(context).pushNamed(PageRoutes.otpVerify);
                }
              },
              codeAutoRetrievalTimeout: (value) {})
          .catchError((error, stackTrace) {
        state = state.copyWith(
            isLoading: false, error: error.toString().substring(0, 20));
        toast(message: error.toString(), type: ToastificationType.error);
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
            if (shouldNavigate) {
              Navigator.of(context).pushReplacementNamed(PageRoutes.home);
            }
            return true;
          } else {
            state = state.copyWith(
                tempUser: auth.User(
                    uid: user.uid,
                    phone: user.phoneNumber,
                    email: user.email,
                    createdAt: user.metadata.creationTime),
                user: null);
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
        toast(message: error.toString(), type: ToastificationType.error);
      }
      return null;
    }
  }

  Future<void> validateFormAndProceed(
      {required GlobalKey<FormState> formKey,
      required BuildContext context,
      required ValueNotifier<String?> error,
      required Map<String, dynamic> data}) async {
    if (formKey.currentState!.validate()) {
      try{
        state = state.copyWith(isLoading: true);
        final bool? userNameExist =
            await checkIfUsernameExist(username: data['username']);
        if (userNameExist != null && !userNameExist) {
          error.value = null;
          state = state.copyWith.tempUser!.call(
              username: data['username'],
              photo: data['userImage'],
              name: data['displayName']);
          if (context.mounted) {
            Navigator.of(context).pushNamed(PageRoutes.enterEmail);
          }
        }
        if (userNameExist != null && userNameExist) {
          error.value = 'Username already exist';
          return;
        }
      } catch (err) {
        state = state.copyWith(error: err.toString());
      } finally {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  Future<void> registerUserToFirestore({required BuildContext context}) async {
    state = state.copyWith(isLoading: true);
    String? photoUrl;
    try {
      print("STATE: $state");
      final bool hasConnection = await checkInternetConnectivity(
          showIfConnected: false, showIfNotConnected: true);
      if (hasConnection) {
        auth.User? user = state.tempUser;
        if (user != null) {
          final photoPath = user.photo;
          if(photoPath != null) {
            photoUrl = await uploadFileToDb(
                file: File(photoPath), path: "profile-photos/${user.uid}");
            state = state.copyWith.tempUser!.call(photo: photoUrl);
            user = user.copyWith(photo : photoUrl);
          }
          _db
              .collection("users")
              .doc(user.uid)
              .set({...user.toJson(), "username_lowercase" : user.username!.toLowerCase()})
              .then((value) {
            state = state.copyWith(
                user: state.tempUser, tempUser: null, isAuthenticating: false);
            if (context.mounted) {
              toast(
                  message: "Registration successful",
                  type: ToastificationType.success);
              Navigator.of(context).pushReplacementNamed(PageRoutes.home);
            }
          });
        }
      }
    } catch (e) {
      toast(message: e.toString(), type: ToastificationType.error);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
