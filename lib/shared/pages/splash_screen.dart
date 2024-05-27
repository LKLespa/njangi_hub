import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart' as auth;
import 'package:njangi_hub/shared/shared.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends ConsumerState<SplashScreen> {
  final firebaseInstance = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // TODO: Fix firestore error
    // Unhandled Exception: [cloud_firestore/unavailable]
    // The service is currently unavailable. This is a most likely a transient condition and may be corrected by retrying with a backoff
    void checkFirebaseUserAndContinue() {
      final user = firebaseInstance.currentUser;
      print('Firebase user, ${user.toString()}');
      Future.delayed(Duration.zero, () async {
        if (user != null) {
          print("User exists");
          final authProvider = ref.read(auth.authNotifierProvider.notifier);
          await authProvider.checkIfUserExistsAndGetUserFromFirestoreAndContinue(user: user, context: context);
        } else {
          Navigator.pushReplacementNamed(context, PageRoutes.intro);
        }
      });
    }
    checkFirebaseUserAndContinue();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Hero(tag: 'logo', child: Image.asset(Assets.imagesLogo1, width: 150,)),
      ),
    );
  }
}