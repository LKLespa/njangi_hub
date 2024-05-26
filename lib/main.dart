import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/firebase_options.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(
    child: MyApp(
      savedThemeMode: savedThemeMode,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.savedThemeMode});
  final AdaptiveThemeMode? savedThemeMode;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'NjangiHub',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        themeMode: savedThemeMode!.isDark
            ? ThemeMode.dark
            : savedThemeMode!.isLight
                ? ThemeMode.light
                : ThemeMode.system,
        initialRoute: PageRoutes.userInformation,
        routes: _routes,
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
  PageRoutes.userInformation: (context) => UserInformationRegisterationPage(),
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
