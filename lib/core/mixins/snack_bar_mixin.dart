import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/text_styles.dart';
import '../constants/colors_constants.dart';

mixin SnackBarMixin {

  void displaySnackBar({required String title, required String message, bool isError = false}) {

    Get..closeAllSnackbars()..snackbar(title, message,
      margin: const EdgeInsets.all(15),
      duration: const Duration(milliseconds: 3500),
      backgroundColor: white,
      titleText: Text(title,
        style: TextStyles.errorStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: !isError ? black : null,
        ),
      ),
    );
  }
}