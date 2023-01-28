import 'package:architecture/data/server/api/api_service.dart';
import 'package:architecture/data/server/auth_interseptor.dart';
import 'package:architecture/data/storage/auth/auth_holder.dart';
import 'package:architecture/domain/use_case/get_all_use_case/get_all_use_case.dart';
import 'package:architecture/view_model/get_all_todos/get_all_todos_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/storage/auth/auth_prefs.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/repositories/app_repository_imp.dart';
import 'domain/use_case/push_post_use_case/push_post_use_case.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //  bloc
  getIt.registerFactory(() => GetAllTodosBloc(getAllUseCase: getIt(), pushPostUseCase: getIt()));

  /// useCase
  getIt.registerLazySingleton<GetAllUseCase>(() => GetAllUseCase(getIt()));
  getIt.registerLazySingleton<PushPostUseCase>(() => PushPostUseCase(getIt()));

  /// services
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));

  /// network
  getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(getIt()));

  /// storage
  getIt.registerLazySingleton<AuthHolder>(() => AuthPrefs());

  /// repositories
  getIt.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(getIt()));
}
