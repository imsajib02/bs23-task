import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../barrels/resources.dart';

class AppTheme {

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
      background: kBackgroundColorLight,
    ),
    scaffoldBackgroundColor: kBackgroundColorLight,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    focusColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ),
  );


  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kPrimaryColor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
      background: kBackgroundColorLight,
    ),
    scaffoldBackgroundColor: kBackgroundColorLight,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    focusColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ),
  );

  static final datePickerTheme = ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 16),
      headlineSmall: TextStyle(fontSize: 16),
      titleMedium: TextStyle(fontSize: 14, color: Colors.black),
      titleSmall: TextStyle(fontSize: 14),
      bodyMedium: TextStyle(fontSize: 12, color: Colors.black),
      labelLarge: TextStyle(fontSize: 12),
      labelSmall: TextStyle(fontSize: 10),
    ),
    iconTheme: IconThemeData(
      size: 20,
    ),
  );
}