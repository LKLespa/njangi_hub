import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode,));
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
        themeMode: savedThemeMode!.isDark ? ThemeMode.dark : savedThemeMode!.isLight ? ThemeMode.light : ThemeMode.system,
        initialRoute: '/register',
        routes: _routes,
      ),
    );
  }
}

final _routes = {
  '/splash': (context) => const LauncherScreen(),
  '/home': (context) => MyHomePage(),
  '/intro': (context) => const IntroScreen(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
};

final _routes2 = {
  '/splash': (context) => const AppBackground(child: LauncherScreen()),
  '/home': (context) => const AppBackground(child: Text('Home')),
  '/login': (context) => AppBackground(child: LoginPage()),
};