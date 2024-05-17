import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/repositories.dart';
import '../../../barrels/themes.dart';
import '../../../barrels/utils.dart';
import '../../../repositories/github_repository.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {

  var index = 0.obs;
  var currentPage = 0.obs;
  var isPaginationEnd = false.obs;

  String? _repoUrl;
  int perPage = 10;

  var repoList = <GithubRepo>[].obs;
  var _gitRepo = getIt<GithubRepository>();

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getGithubUser();
    super.onInit();
  }

  @override
  void didChangePlatformBrightness() {

    final themeController = Get.find<ThemeController>();
    themeController.toggleTheme();

    super.didChangePlatformBrightness();
  }

  void retry() {
    index.value = 0;
    getGithubUser();
  }

  Future<void> getGithubUser() async {

    try {
      var response = await _gitRepo.authenticateUser();

      var jsonData = json.decode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

        if(jsonData['repos_url'] != null) {

          _repoUrl = jsonData['repos_url'];
          currentPage.value = 0;

          getFlutterRepositoryList(currentPage.value + 1);
          return;
        }

        if(parseError(response) != null) {
          onFailure(parseError(response)!);
          return;
        }

        index.value = 2;
        return;
      }

      if(parseError(response) != null) {
        onFailure(parseError(response)!);
        return;
      }

      index.value = 2;

    } on AppException catch(error) {
      onFailure(error.message!);

    } catch(error) {
      onFailure(STR_UNKNOWN_ERROR.tr);
    }
  }

  Future<void> getFlutterRepositoryList(int pageNumber) async {

    try {
      var response = await _gitRepo.getRepositoryList(_repoUrl!, perPage, pageNumber);

      var jsonData = json.decode(response.body);

      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {

        if(jsonData != null) {

          List<GithubRepo> mList = List<GithubRepo>.from(jsonData.map((json) => GithubRepo.fromJson(json)));
          List<GithubRepo> tempList = mList.where((element) => element.language == 'Dart').toList();

          if(tempList.isEmpty) {
            isPaginationEnd.value = true;
            return;
          }
          else {
            _startScrollListener();
          }

          currentPage.value = pageNumber;

          if(currentPage.value == 1) {
            repoList..clear()..addAll(tempList);
          }
          else {
            repoList.addAll(tempList);
          }

          index.value = 1;
          return;
        }

        if(parseError(response) != null) {
          onFailure(parseError(response)!);
          return;
        }

        index.value = 2;
        return;
      }

      if(parseError(response) != null) {
        onFailure(parseError(response)!);
        return;
      }

      index.value = 2;

    } on AppException catch(error) {
      onFailure(error.message!);

    } catch(error) {
      onFailure(STR_UNKNOWN_ERROR.tr);
    }
  }

  void onFailure(String message) {
    index.value = 2;
    Get.snackbar(message, '', snackPosition: SnackPosition.BOTTOM, colorText: Colors.white, backgroundColor: Colors.black, borderColor: Colors.white);
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  void _startScrollListener() {

    if(scrollController.hasListeners) {
      return;
    }

    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getFlutterRepositoryList(currentPage.value + 1);
      }
    });
  }
}