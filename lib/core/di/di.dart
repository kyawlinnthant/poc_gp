import 'package:get_it/get_it.dart';
import 'package:poc/data/store/app_data/app_data_store.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerLazySingleton<AppDataStore>(() => AppDataStore());
}
