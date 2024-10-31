import 'package:get/get.dart';

import '../../../../injector.dart';
import '../controller/repositories_controller.dart';

class RepositoriesBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => RepositoriesController(injector()));
  }
}