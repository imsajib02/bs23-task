import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../barrels/localizations.dart';

class MyPref {

  final _box = GetStorage(dotenv.env['STORAGE_PREF']!);

  static const LANGUAGE = 'language';

  void saveLanguageCode(String languageCode) async {
    _box.write(LANGUAGE, languageCode);
  }

  String getLanguageCode() {
    return _box.read(LANGUAGE) ?? ENGLISH;
  }
}