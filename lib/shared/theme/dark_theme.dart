import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/shared.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: headingFont.copyWith(fontWeight: FontWeight.w700, fontSize: 20)
  ),
  useMaterial3: true,
);