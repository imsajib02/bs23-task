import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_constants.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static TextStyle get errorStyle => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Get.isDarkMode ? grey : black.withOpacity(.75),
  );

  static TextStyle get buttonTextStyle => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );

  static TextStyle get repoTitleStyle => const TextStyle(
    fontSize: 18,
    color: black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get repoDescriptionStyle => const TextStyle(
    color: black,
  );

  static TextStyle get repoUpdateAtStyle => const TextStyle(
    fontSize: 12,
    color: grey,
  );
}