import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task/barrels/utils.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/widgets.dart';
import '../../../route/routes.dart';
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
        appBar: AppBar(
          title: Text(STR_FLUTTER_REPOS.tr),
        ),
        body: Builder(
          builder: (context) {

            return SafeArea(
              child: Obx(() => IndexedStack(
                index: _homeController.index.value,
                children: [

                  const Center(
                    child: CircularProgressIndicator(),
                  ),

                  Obx(() => SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _homeController.scrollController,
                    child: Column(
                      children: [

                        15.h,

                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _homeController.repoList.length,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          separatorBuilder: (context, index) {

                            return SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {

                            return RepoWidget(
                              repo: _homeController.repoList[index],
                              onView: () => Get.toNamed(REPO_DETAILS, arguments: _homeController.repoList[index]),
                            );
                          },
                        ),

                        Visibility(
                          visible: !_homeController.isPaginationEnd.value,
                          child: _paginationLoader(),
                        ),
                      ],
                    ),
                  )),

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

  Widget _paginationLoader() {

    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }
}
