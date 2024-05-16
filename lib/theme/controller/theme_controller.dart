import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/utils.dart';

class ThemeController extends GetxController {

  var themeMode = ThemeMode.light.obs;
  var _myPref = getIt<MyPref>();

  @override
  void onInit() {
    getTheme();
    super.onInit();
  }

  void getTheme() {

    bool isDarkMode = _myPref.isDarkMode();
    _updateAppTheme(isDarkMode);
  }

  void changeTheme(bool isDarkMode) {

    _myPref.saveTheme(isDarkMode);
    _updateAppTheme(isDarkMode);
  }

  void _updateAppTheme(bool isDarkMode) {

    themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(themeMode.value);
  }
}