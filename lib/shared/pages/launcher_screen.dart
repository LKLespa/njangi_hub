import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart' as auth;
import 'package:njangi_hub/shared/shared.dart';

class LauncherScreen extends ConsumerStatefulWidget {
  const LauncherScreen({super.key});

  @override
  ConsumerState<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends ConsumerState<LauncherScreen> {
  final firebaseInstance = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = firebaseInstance.currentUser;
    print('Firebase user, ${user.toString()}');
    Future.delayed(const Duration(seconds: 3), (){
      if (user != null) {
        auth.AuthState authProvider = ref.read(auth.authNotifierProvider);
            authProvider = authProvider.copyWith(user: auth.User(uid: user.uid, token: user.refreshToken, name: user.displayName, userName: '', email: user.email, photo: user.photoURL, phone: user.phoneNumber, lastSeen: DateTime.now(), createdAt: user.metadata.creationTime, isOnline: true, aboutMe: ""));
        Navigator.pushReplacementNamed(context, '/home');
        print('Njangi user, ${user.toString()}');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
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