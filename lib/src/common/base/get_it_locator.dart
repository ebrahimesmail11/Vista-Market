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
import 'package:vista_market/src/ngo/data/remote/add_notification_remote_source.dart';
import 'package:vista_market/src/ngo/data/remote/categories_remote_source.dart';
import 'package:vista_market/src/ngo/data/remote/dashboard_remote_source.dart';
import 'package:vista_market/src/ngo/data/remote/products_remote_source.dart';
import 'package:vista_market/src/ngo/data/remote/users_remote_source.dart';
import 'package:vista_market/src/ngo/data/repo/categories_repo.dart';
import 'package:vista_market/src/ngo/data/repo/dashboard_repo.dart';
import 'package:vista_market/src/ngo/data/repo/notification_repo.dart';
import 'package:vista_market/src/ngo/data/repo/products_repo.dart';
import 'package:vista_market/src/ngo/data/repo/users_repo.dart';
import 'package:vista_market/src/ngo/presentation/cubit/add_notification/add_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/categories_number/categories_number_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_add_category/create_add_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/create_product/create_product_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_category/delete_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_product/delete_product_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/delete_users/delete_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_categories/get_all_categories_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_notification/get_all_notification_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_products/get_all_products_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/get_all_users/get_all_users_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/products_number/products_number_cubit.dart';

import 'package:vista_market/src/ngo/presentation/cubit/send_notification/send_notification_cubit.dart';

import 'package:vista_market/src/ngo/presentation/cubit/update_category/update_category_cubit.dart';
import 'package:vista_market/src/ngo/presentation/cubit/update_product/update_product_cubit.dart';

import 'package:vista_market/src/ngo/presentation/cubit/users_number/users_number_cubit.dart';
import 'package:vista_market/src/resident/data/remote/home_remote_source.dart';
import 'package:vista_market/src/resident/data/remote/profile_remote_source.dart';
import 'package:vista_market/src/resident/data/repo/home_repo.dart';
import 'package:vista_market/src/resident/data/repo/profile_repo.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_categories_customer/get_categories_customer_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/get_banners/get_banners_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/main_nav_bar/main_cubit_cubit.dart';
import 'package:vista_market/src/resident/presentation/cubit/profile_user/profile_user_cubit.dart';

import 'package:vista_market/src/utils/cubit/app_cubit.dart';

final getIt = GetIt.instance;
Future<void> initGetIt() async {
  await _initCore();
  await _initAuth();
  await _initDashboard();
  await _initCategories();
  await _initProducts();
  await _initUsers();
  await _initAddNotification();
  await _initMain();
  await _initProfileUser();
  await _initHome();
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
    ..registerFactory(() => GetAllCategoriesCubit(getIt()))
    ..registerFactory(() => CreateAddCategoryCubit(getIt()))
    ..registerFactory(() => DeleteCategoryCubit(getIt()))
    ..registerFactory(() => UpdateCategoryCubit(getIt()));
}

Future<void> _initProducts() async {
  getIt
    ..registerLazySingleton(() => ProductsRemoteSource(getIt()))
    ..registerLazySingleton(() => ProductsRepo(getIt()))
    ..registerFactory(() => GetAllProductsCubit(getIt()))
    ..registerFactory(() => CreateProductCubit(getIt()))
    ..registerFactory(() => DeleteProductCubit(getIt()))
    ..registerFactory(() => UpdateProductCubit(getIt()));
}

Future<void> _initUsers() async {
  getIt
    ..registerLazySingleton(() => UsersRemoteSource(getIt()))
    ..registerLazySingleton(() => UsersRepo(getIt()))
    ..registerFactory(() => GetAllUsersCubit(getIt()))
    ..registerFactory(() => DeleteUsersCubit(getIt()));
}

Future<void> _initAddNotification() async {
  getIt
    ..registerFactory(
      AddNotificationCubit.new,
    )
    ..registerFactory(
      GetAllNotificationCubit.new,
    )
    ..registerLazySingleton(AddNotificationRemoteSource.new)
    ..registerLazySingleton(
      () => NotificationRepo(getIt()),
    )
    ..registerFactory(
      () => SendNotificationCubit(getIt()),
    );
}

Future<void> _initMain() async {
  getIt.registerFactory(MainCubitCubit.new);
}

Future<void> _initProfileUser() async {
  getIt
    ..registerLazySingleton(ProfileRemoteSource.new)
    ..registerLazySingleton(() => ProfileRepo(getIt()))
    ..registerFactory(() => ProfileUserCubit(getIt()));
}

Future<void> _initHome() async {
  getIt
    ..registerLazySingleton(() => HomeRemoteSource(getIt()))
    ..registerLazySingleton(() => HomeRepo(getIt()))
   ..registerFactory(() => GetBannersCubit(getIt()))
   ..registerFactory(()=> GetCategoriesCustomerCubit(getIt()));
}
