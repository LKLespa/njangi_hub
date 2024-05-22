import 'package:flutter/material.dart';
import 'package:njangi_hub/shared/theme/theme.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
  ),
  useMaterial3: true,
);