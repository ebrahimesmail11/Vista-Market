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
import 'package:vista_market/src/ngo/data/remote/categories_remote_source.dart';
import 'package:vista_market/src/ngo/data/remote/dashboard_remote_source.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';
import 'package:vista_market/src/ngo/data/repo/dashboard_repo.dart';
import 'package:vista_market/src/ngo/presentation/cubit/categories_number/categories_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_add_category/create_add_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/update_category/update_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_category/delete_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/products_number/products_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/users_number/users_number_cubit.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';



final getIt = GetIt.instance;
Future<void> initGetIt() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
  await _initCategories();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerFactory(() => UploadImageCubit(getIt()))
    ..registerLazySingleton(() => UploadRepos(getIt()))
    ..registerLazySingleton(() => UploadRemoteSource(getIt()));
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
    ..registerFactory(() => ProductsNumberCubit(getIt()))
    ..registerFactory(() => CategoriesNumberCubit(getIt()))
    ..registerFactory(() => UsersNumberCubit(getIt()));
}

Future<void> _initCategories() async {
  getIt
    ..registerLazySingleton(() => CategoriesRemoteSource(getIt()))
    ..registerLazySingleton(() => CategoriesRepo(getIt()))
    ..registerFactory(()=>GetAllCategoriesCubit(getIt()))
    ..registerFactory(() => CreateAddCategoryCubit(getIt()))
    ..registerFactory(()=>DeleteCategoryCubit(getIt()))
    ..registerFactory(()=>UpdateCategoryCubit(getIt()));
}
