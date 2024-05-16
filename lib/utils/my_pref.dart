import 'package:get_storage/get_storage.dart';

import '../barrels/localizations.dart';

class MyPref {

  final _box = GetStorage('MyStoragePref');

  static const LANGUAGE = 'language';

  void saveLanguageCode(String languageCode) async {
    _box.write(LANGUAGE, languageCode);
  }

  String getLanguageCode() {
    return _box.read(LANGUAGE) ?? ENGLISH;
  }
}