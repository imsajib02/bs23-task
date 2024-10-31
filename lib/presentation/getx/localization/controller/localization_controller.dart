import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/storage/get_storage_manager.dart';

class LocalizationController extends GetxController {

  final GetStorageManager _storageManager;

  LocalizationController(this._storageManager);

  Locale get appLocale => _storageManager.locale;

  void updateLocale(Locale? locale) {
    _storageManager.locale = locale;
    Get.updateLocale(appLocale);
  }
}