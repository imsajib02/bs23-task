import 'dart:convert';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/network_client.dart';
import '../../../models/searchResult/search_result_model.dart';
import 'repo_list_remote_data_source.dart';

class RepoListRemoteDataSourceImpl implements RepoListRemoteDataSource {

  final NetworkClient _networkClient;

  const RepoListRemoteDataSourceImpl(this._networkClient);

  @override
  Future<SearchResultModel> getFlutterRepositories({required int page, required int perPage}) async {

    try {
      final response = await _networkClient.get(url: '$repositoriesUrl?q=language:dart&sort=stars&page=$page&per_page=$perPage');

      var jsonData = json.decode(response.body);
      return SearchResultModel.fromJson(jsonData);

    } catch (_) {
      rethrow;
    }
  }
}