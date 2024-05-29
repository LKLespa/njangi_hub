import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/firebase_options.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final db = FirebaseFirestore.instance;
  db.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  final auth = firebase_auth.FirebaseAuth.instance;
  final user = auth.currentUser;
  String initialRoute = PageRoutes.splash;
  User? njangiUser;
  bool userIsRegistered = false;

  try {
    if (user != null) {
      final docRef = db.collection("users").doc(user.uid);
      initialRoute = await docRef.get().then((doc) {
        if (doc.exists) {
          njangiUser = User.fromJson(doc.data() as Map<String, dynamic>);
          userIsRegistered = true;
          return PageRoutes.home;
        } else {
          njangiUser = User(
              uid: user.uid,
              phone: user.phoneNumber,
              email: user.email,
              createdAt: user.metadata.creationTime,
              lastSeen: DateTime.now());
          userIsRegistered = false;
          return PageRoutes.userInformation;
        }
      });
    } else {
      initialRoute = PageRoutes.intro;
    }
  } catch (e) {
    initialRoute = PageRoutes.splash;
  }

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(
    child: MyApp(
      savedThemeMode: savedThemeMode,
      initialRoute: initialRoute,
      userIsRegistered: userIsRegistered,
      njangiUser: njangiUser,
    ),
  ));
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp(
      {super.key,
      this.njangiUser,
      required this.userIsRegistered,
      this.savedThemeMode,
      required this.initialRoute});

  final AdaptiveThemeMode? savedThemeMode;
  final String initialRoute;
  final User? njangiUser;
  final bool userIsRegistered;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late StreamSubscription<InternetStatus> internetConnectionListener;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    internetConnectionListener = listenToInternetChanges();
    final authState = ref.read(authNotifierProvider);
    final authStateNotifier = ref.read(authNotifierProvider.notifier);
    Future.delayed(Duration.zero, () async {
      if (widget.njangiUser != null) {
        if (widget.userIsRegistered) {
          authStateNotifier
              .updateState(authState.copyWith(user: widget.njangiUser));
        } else {
          authStateNotifier.updateState(authState.copyWith(
              tempUser: widget.njangiUser, isAuthenticating: true));
        }
      }
    });
  }

  @override
  void dispose() {
    internetConnectionListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode getThemeMode() {
      if (widget.savedThemeMode != null) {
        return widget.savedThemeMode!.isDark
            ? ThemeMode.dark
            : widget.savedThemeMode!.isLight
                ? ThemeMode.light
                : ThemeMode.system;
      }
      return ThemeMode.system;
    }

    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => ToastificationWrapper(
        child: MaterialApp(
          title: 'NjangiHub',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: getThemeMode(),
          initialRoute: widget.initialRoute,
          routes: _routes,
        ),
      ),
    );
  }
}

//695747281
final _routes = {
  PageRoutes.splash: (context) => const SplashScreen(),
  PageRoutes.home: (context) => const MyHomePage(),
  PageRoutes.intro: (context) => const IntroScreen(),
  PageRoutes.login: (context) => LoginWithPhoneNumberPage(),
  PageRoutes.otpVerify: (context) => OtpPage(),
  PageRoutes.userInformation: (context) => UserInformationRegistrationPage(),
  PageRoutes.enterEmail: (context) => EmailVerificationPage(),
  PageRoutes.settings: (context) => const SettingsPage(),
  PageRoutes.profile: (context) => const ProfilePage(),
};

// Platform  Firebase App Id
// web       1:35923112741:web:a3d838997b5e3ee646e0cc
// android   1:35923112741:android:e0169d9064c3bf5746e0cc
// ios       1:35923112741:ios:b76e0cb9933b57b046e0cc
// macos     1:35923112741:ios:db905a1ded5c095346e0cc
// windows   1:35923112741:web:d03a9b505a33e63f46e0cc

// Certificate fingerprints:
// SHA1: 8E:A5:88:35:37:02:B5:0B:15:A6:96:CB:BD:C1:97:8E:8A:1A:65:D3
// SHA256: FA:A6:E9:1B:C9:FC:42:3B:E2:9D:04:52:E6:CA:FC:39:B0:21:7D:E5:16:0A:5F:D3:87:34:35:56:21:01:56:5B
