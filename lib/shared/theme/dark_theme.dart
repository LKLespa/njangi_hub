import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/theme/theme.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)
  ),
  useMaterial3: true,
);