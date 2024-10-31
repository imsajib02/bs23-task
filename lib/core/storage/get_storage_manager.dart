import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/app_constants.dart';
import '../constants/localization_constants.dart';

class GetStorageManager {

  final _box = GetStorage(storagePref);

  static const languageCode = 'languageCode';

  set locale(Locale? locale) {

    if(locale == null) {
      _box.remove(languageCode);
    }
    else {
      _box.write(languageCode, '${locale.languageCode}_${locale.countryCode}');
    }
  }

  Locale get locale {

    var mLanguageCode = _box.read(languageCode);

    if(mLanguageCode == null) {
      return localeEnglish;
    }

    var results = appLocales.where((item) => '${item.locale.languageCode}_${item.locale.countryCode}' == mLanguageCode);

    if(results.isEmpty) {
      return localeEnglish;
    }

    return results.first.locale;
  }
}