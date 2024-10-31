import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/constants/route_constants.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../components/cards/repo_card.dart';
import '../../../components/others/error_page.dart';
import '../../../getx/repositories/controller/repositories_controller.dart';

class Repositories extends StatelessWidget {

  final _controller = Get.find<RepositoriesController>();

  Repositories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PopScope(
      onPopInvoked: (_) => SystemNavigator.pop(),
      child: Scaffold(
        body: SafeArea(
          child: Obx(() => IndexedStack(
            index: _controller.index.value,
            children: [

              const Center(
                child: CircularProgressIndicator(),
              ),

              /*NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  _controller.onScrollEnd(scrollInfo);
                  return false;
                },
                child: */SingleChildScrollView(
                  controller: _controller.scroll,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [

                      15.h,

                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _controller.flutterRepoList.length,
                        padding: const EdgeInsets.all(12).copyWith(
                          top: 0,
                        ),
                        separatorBuilder: (context, index) => 10.h,
                        itemBuilder: (context, index) {

                          return RepoCard(
                            repository: _controller.flutterRepoList[index],
                            onClick: (repository) => Get.toNamed(routeRepoDetails.replaceAll(':id', repository.id.toString()), arguments: repository),
                          );
                        },
                      ),

                      Visibility(
                        visible: _controller.hasMore.value,
                        child: _paginationLoader(),
                      ),
                    ],
                  ),
                ),
              /*),*/

              ErrorPage(
                onRetry: () => _controller.loadRepositories(),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _paginationLoader() {

    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 100,
      ),
      child: CupertinoActivityIndicator(
        radius: 12,
      ),
    );
  }
}
