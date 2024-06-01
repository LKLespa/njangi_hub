import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:njangi_hub/shared/theme/theme.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    error: Colors.red,
  ),
  appBarTheme: AppBarTheme(
      titleTextStyle: headingFont.copyWith(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.black)
  ),
  listTileTheme: ListTileThemeData(
    titleTextStyle: bodyTextFont.copyWith(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
    subtitleTextStyle: captionFont.copyWith(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
    iconColor: primaryColor,
  ),
  dividerTheme: DividerThemeData(
    thickness: 1,
    indent: 20,
    endIndent: 20,
    color: Colors.grey.withOpacity(0.7),
  ),
  useMaterial3: true,
);