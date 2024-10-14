import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vista_market/src/auth/data/remote/auth_remote_source.dart';
import 'package:vista_market/src/auth/data/repo/auth_repos.dart';
import 'package:vista_market/src/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/dio_factory.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';

final getIt = GetIt.instance;
Future<void> initGetIt() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final  navigatorKey = GlobalKey<NavigatorState>();
  getIt
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey <NavigatorState>>(navigatorKey);
}

Future<void> _initAuth() async {
  getIt
    ..registerFactory(
      () => AuthCubit(
        getIt(),
      ),
    )
    ..registerLazySingleton(() => AuthRemoteSource(getIt()))
    ..registerLazySingleton(() => AuthRepos(getIt()));
}
