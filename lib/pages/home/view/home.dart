import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../barrels/widgets.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {

  final _homeController = Get.put(HomeController());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future(() => false);
      },
      child: Scaffold(
        body: Builder(
          builder: (context) {

            return SafeArea(
              child: Obx(() => IndexedStack(
                index: _homeController.index.value,
                children: [

                  const Center(
                    child: CircularProgressIndicator(),
                  ),

                  Column(
                    children: [],
                  ),

                  ErrorPage(
                    onTap: () => _homeController.retry(),
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
