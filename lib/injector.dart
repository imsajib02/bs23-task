import 'package:get_it/get_it.dart';

import '/core/network/connectivity_status.dart';
import '/core/network/interceptor_barrel.dart';
import '/core/routes/routes.dart';
import '/core/storage/get_storage_manager.dart';
import '/core/utils/error_parser.dart';

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
    ..registerLazySingleton<ErrorParser>(() => ApiResponseError());
}