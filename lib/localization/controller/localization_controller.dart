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

  void getAppLocale() {

    String languageCode = _myPref.getLanguageCode();
    appLocale.value = getLocale(languageCode);

    Get.updateLocale(appLocale.value!);
  }
}