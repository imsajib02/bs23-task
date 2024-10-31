import '../../../core/abstractions/data_state.dart';
import '../../entities/search_result_entity.dart';

abstract class RepoListRepository {
  Future<DataState<SearchResultEntity>> getFlutterRepositories({required int page, required int perPage});
}