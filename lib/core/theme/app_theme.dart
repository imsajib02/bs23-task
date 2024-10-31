import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors_constants.dart';
import '../styles/text_styles.dart';

class AppTheme {

  AppTheme._();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primary,
      secondary: accent,
      background: lightBackground,
    ),
    scaffoldBackgroundColor: lightBackground,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ),
    focusColor: primary,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: primary,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
  );


  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primary,
      secondary: accent,
      background: darkBackground,
    ),
    scaffoldBackgroundColor: darkBackground,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ),
    focusColor: primary,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: primary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: primary,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
  );
}