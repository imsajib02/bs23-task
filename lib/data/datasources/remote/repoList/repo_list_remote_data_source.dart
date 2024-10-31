import '../../../models/searchResult/search_result_model.dart';

abstract class RepoListRemoteDataSource {
  Future<SearchResultModel> getFlutterRepositories({required int page, required int perPage});
}