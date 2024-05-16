import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/utils.dart';

class LocalizationController extends GetxController {

  var appLocale = Rxn<Locale>();
  var _myPref = getIt<MyPref>();

  @override
  void onInit() {
    getAppLocale();
    super.onInit();
  }

  void getAppLocale() => _updateLocale(getLocale(_myPref.getLanguageCode()));

  void changeAppLocale(Locale locale) {

    _myPref.saveLanguageCode(locale.languageCode);
    _updateLocale(locale);
  }

  void _updateLocale(Locale locale) {

    appLocale.value = locale;
    Get.updateLocale(appLocale.value!);
  }
}