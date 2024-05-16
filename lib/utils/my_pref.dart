import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../barrels/localizations.dart';

class MyPref {

  final _box = GetStorage(dotenv.env['STORAGE_PREF']!);

  static const LANGUAGE = 'language';
  static const THEME = 'isDarkMode';

  void saveLanguageCode(String languageCode) => _box.write(LANGUAGE, languageCode);

  String getLanguageCode() => _box.read(LANGUAGE) ?? ENGLISH;

  void saveTheme(bool isDarkMode) => _box.write(THEME, isDarkMode);

  bool isDarkMode() {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    return _box.read(THEME) ?? (brightness == Brightness.dark);
  }
}