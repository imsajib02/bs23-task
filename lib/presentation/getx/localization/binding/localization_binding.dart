import 'package:get/get.dart';

import '../../../../injector.dart';
import '../controller/localization_controller.dart';

class LocalizationBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LocalizationController(injector()));
  }
}