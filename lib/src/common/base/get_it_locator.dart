import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vista_market/src/auth/data/remote/auth_remote/auth_remote_source.dart';
import 'package:vista_market/src/auth/data/remote/upload_image_remote/upload_remote_source.dart';
import 'package:vista_market/src/auth/data/repo/auth_repo/auth_repos.dart';
import 'package:vista_market/src/auth/data/repo/upload_image_repo/upload_repos.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/dio_factory.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/data/remote/dashboard_remote_source.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/data/repo/dashboard_repo.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/categories_number/categories_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/products_number/products_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/view/dashboard/presentation/cubit/users_number/users_number_cubit.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';

final getIt = GetIt.instance;
Future<void> initGetIt() async {
  await _initCore();
  await _initAuth();
 await _initDashboard();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final  navigatorKey = GlobalKey<NavigatorState>();
  getIt
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey <NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(getIt()))
    ..registerLazySingleton(()=>UploadRepos(getIt()))
    ..registerLazySingleton(()=>UploadRemoteSource(getIt()));
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

Future<void> _initDashboard() async {
  getIt
    ..registerLazySingleton(() => DashboardRemoteSource(getIt()))
    ..registerLazySingleton(() => DashboardRepo(getIt()))
    ..registerFactory(()=> ProductsNumberCubit(getIt()))
    ..registerFactory(()=> CategoriesNumberCubit(getIt()))
    ..registerFactory(()=>UsersNumberCubit(getIt()));
}
