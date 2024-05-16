import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'barrels/localizations.dart';
import 'barrels/themes.dart';
import 'barrels/utils.dart';
import 'home.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: kDebugMode ? '.env.development' : '.env.production');
  await GetStorage.init(dotenv.env['STORAGE_PREF']!);

  registerServices();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  final localizationController = Get.put(LocalizationController());
  final themeController = Get.put(ThemeController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() => GetMaterialApp(
      title: dotenv.env['APP_TITLE']!,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode.value,
      defaultTransition: Transition.native,
      translations: AppLocalization(),
      locale: localizationController.appLocale.value,
      fallbackLocale: getLocale(ENGLISH),
      home: Home(),
    ));
  }
}
