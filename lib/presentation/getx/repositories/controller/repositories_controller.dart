import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/abstractions/data_state.dart';
import '../../../../domain/entities/repository_entity.dart';
import '../../../../domain/entities/search_result_entity.dart';
import '../../../../domain/usecases/repoList/repo_list_use_case.dart';

class RepositoriesController extends GetxController with ScrollMixin {

  final _perPage = 10;
  var _page = 1, _totalCount = 0;

  var index = 0.obs;
  var hasMore = true.obs;
  var isLoading = false.obs;
  var flutterRepoList = <RepositoryEntity>[].obs;

  final RepoListUseCase _repoListUseCase;

  RepositoriesController(this._repoListUseCase);

  @override
  void onReady() {
    super.onReady();
    loadRepositories();
  }

  void loadRepositories() => _getFlutterRepositories(page: _page, perPage: _perPage);

  Future<void> _getFlutterRepositories({required int page, required int perPage}) async {

    if(isLoading.value || !hasMore.value) return;

    isLoading.value = true;

    if(page == 1) {
      // Loading state
      index.value = 0;
    }

    // Network API request
    final result = await _repoListUseCase.getFlutterRepositories(
      page: page,
      perPage: perPage,
    );

    // Response has error. Exception or invalid data.
    if(result is DataError) {
      _handleDataError(result as DataError);
      return;
    }

    _handleDataSuccess(page, result as DataSuccess);
  }

  void _handleDataError(DataError error) {
    // Show error view
    index.value = 1;
    isLoading.value = false;
  }

  void _handleDataSuccess(int page, DataSuccess success) {

    SearchResultEntity searchResult = success.data as SearchResultEntity;

    if(page == 1) {
      _totalCount = searchResult.totalCount ?? 0;
      flutterRepoList.clear();
    }

    flutterRepoList.addAll(searchResult.itemList ?? []);

    _page++;
    hasMore.value = flutterRepoList.length < _totalCount;
    isLoading.value = false;

    // Show repository list
    index.value = 1;
  }

  /*void onScrollEnd(ScrollNotification scrollInfo) {

    if(scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      loadRepositories();
    }
  }*/

  @override
  Future<void> onEndScroll() async => loadRepositories();

  @override
  Future<void> onTopScroll() async {}
}