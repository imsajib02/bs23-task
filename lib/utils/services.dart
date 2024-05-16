import 'package:get_it/get_it.dart';

import '../barrels/repositories.dart';
import '../barrels/utils.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerLazySingleton<MyPref>(() => MyPref());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
}
