import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/auth/presentation/cubit/login/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/cubit/upload_image/upload_image_cubit.dart';
import 'package:vista_market/src/auth/presentation/view/login/login_screen.dart';
import 'package:vista_market/src/auth/presentation/view/registration/registration_screen.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/routing/base_route.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/ngo/presentation/view/home_page/home_page_screen_admin.dart';

import 'package:vista_market/src/resident/presentation/view/main_bottom_nav_bar/main_screen.dart';
import 'package:vista_market/src/resident/presentation/view/product_details/product_details_screen.dart';
import 'package:vista_market/src/utils/custom_web_view.dart';


class RouteManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return BaseRoute(
          page: const LoginScreen(),
        );
      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => getIt<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (_) => getIt<AuthCubit>(),
              ),
            ],
            child: const RegistrationScreen(),
          ),
        );
      case Routes.homePageScreenAdmin:
        return BaseRoute(
          page: const HomePageScreenAdmin(),
        );
      case Routes.mainNavbar:
        return BaseRoute(
          page: const MainScreen(),
        );
        case Routes.webView:
        return BaseRoute(
          page:  CustomWebView(
            url: arg! as String,
          ),
       );
        case Routes.productDetails:
        return BaseRoute(
          page:  ProductDetailsScreen(
            id: arg! as int,
          ),
       );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
