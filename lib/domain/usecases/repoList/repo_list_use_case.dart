import '../../../core/abstractions/data_state.dart';
import '../../entities/search_result_entity.dart';
import '../../repositories/repoList/repo_list_repository.dart';

class RepoListUseCase {

  final RepoListRepository _repoListRepository;

  const RepoListUseCase(this._repoListRepository);

  Future<DataState<SearchResultEntity>> getFlutterRepositories({required int page, required int perPage}) async =>
      _repoListRepository.getFlutterRepositories(page: page, perPage: perPage);
}