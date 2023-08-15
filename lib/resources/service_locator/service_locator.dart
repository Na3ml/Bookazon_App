import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../data/data_source/remote/api_service.dart';
import '../../data/network/network_info.dart';
import '../../data/repository/auth_repository.dart';
import '../../view_model/auth/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

void initModule() {
  /// api service
  getIt.registerLazySingleton(
    () => ApiService(),
  );

  /// network Info
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionChecker(),
    ),
  );

  /// Auth repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: getIt(),
      apiService: getIt(),
    ),
  );

}

AuthCubit authModule() {
  if (!GetIt.I.isRegistered<AuthCubit>()) {
    getIt.registerFactory(
      () => AuthCubit(repo: getIt()),
    );
  }
  return getIt<AuthCubit>();
}
