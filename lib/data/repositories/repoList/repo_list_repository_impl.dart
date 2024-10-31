import 'package:get/get.dart';

import '../../../core/abstractions/data_state.dart';
import '../../../core/constants/localization_constants.dart';
import '../../../core/error/exceptions/app_exceptions.dart';
import '../../../core/error/failures/failure.dart';
import '../../../domain/entities/search_result_entity.dart';
import '../../../domain/repositories/repoList/repo_list_repository.dart';
import '../../../injector.dart';
import '../../../core/utils/error_parser.dart';
import '../../datasources/remote/repoList/repo_list_remote_data_source.dart';

class RepoListRepositoryImpl implements RepoListRepository {

  final RepoListRemoteDataSource _remoteDataSource;

  RepoListRepositoryImpl(this._remoteDataSource);

  @override
  Future<DataState<SearchResultEntity>> getFlutterRepositories({required int page, required int perPage}) async {

    try {
      final result = await _remoteDataSource.getFlutterRepositories(page: page, perPage: perPage);
      return DataSuccess(result.toEntity());

    } on NetworkException catch (error) {
      return DataError(Failure(errorMessage: error.message));

    } on ResponseException catch (error) {
      return DataError(Failure(errorMessage: injector<ErrorParser>().getMessage(error.response)));

    } catch(error) {
      return DataError(Failure(errorMessage: strSomethingWrong.tr));
    }
  }
}