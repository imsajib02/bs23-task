import 'package:get_it/get_it.dart';

import '/core/network/connectivity_status.dart';
import '/core/network/interceptor_barrel.dart';
import '/core/routes/routes.dart';
import '/core/storage/get_storage_manager.dart';
import '/core/utils/error_parser.dart';
import 'core/network/network_client.dart';
import 'data/datasources/remote/remote_data_source_barrel.dart';
import 'data/repositories/repository_impl_barrel.dart';
import 'domain/repositories/repository_barrel.dart';
import 'domain/usecases/use_case_barrel.dart';

final injector = GetIt.instance;

Future<void> registerDependencies() async {

  injector
    // Routes
    ..registerLazySingleton<AppRoutes>(() => AppRoutes())

    // Local Storage
    ..registerLazySingleton<GetStorageManager>(() => GetStorageManager())

    // Network Interceptors
    ..registerLazySingleton<AcceptTypeInterceptor>(() => AcceptTypeInterceptor())
    ..registerLazySingleton<ContentTypeInterceptor>(() => ContentTypeInterceptor())
    ..registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor())
    ..registerLazySingleton<ResponseInterceptor>(() => ResponseInterceptor())
    ..registerLazySingleton<AuthorizationInterceptor>(() => AuthorizationInterceptor(injector()))

    // Network
    ..registerLazySingleton<NetworkInfo>(() => ConnectivityStatus())
    ..registerLazySingleton<ErrorParser>(() => ApiResponseError())

    // Data Sources
    ..registerLazySingleton<RepoListRemoteDataSource>(() => RepoListRemoteDataSourceImpl(NetworkClient(injector(), [injector<AcceptTypeInterceptor>(), injector<LoggerInterceptor>(), injector<ResponseInterceptor>()])))

    // Repositories
    ..registerLazySingleton<RepoListRepository>(() => RepoListRepositoryImpl(injector()))

    // Use Cases
    ..registerLazySingleton<RepoListUseCase>(() => RepoListUseCase(injector()));
}