import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/app_constants.dart';
import '../injector.dart';
import '../core/localization/app_localization.dart';
import '../core/constants/localization_constants.dart';
import '../core/constants/route_constants.dart';
import '../core/routes/routes.dart';
import '../core/theme/app_theme.dart';
import 'getx/localization/controller/localization_controller.dart';

class MyApp extends StatelessWidget {

  final _localizationController = Get.put(LocalizationController(injector()));

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.native,
      translations: AppLocalization(),
      locale: _localizationController.appLocale,
      fallbackLocale: localeEnglish,
      initialRoute: routeRepositories,
      getPages: injector<AppRoutes>().pages,
    );
  }
}