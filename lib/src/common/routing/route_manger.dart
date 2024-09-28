import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_market/src/admin/presentation/view/home_page/home_page_screen_admin.dart';
import 'package:vista_market/src/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:vista_market/src/auth/presentation/view/login/login_screen.dart';
import 'package:vista_market/src/auth/presentation/view/registration/registration_screen.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/routing/base_route.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/resident/presentation/view/home/home_page_screen.dart';

class RouteManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return BaseRoute(
          page:  BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child:const  LoginScreen(),
          ),
        );
      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.homePageScreenAdmin:
        return BaseRoute(
          page: const  HomePageScreenAdmin(),
        );
        case Routes.homePageScreen:
        return BaseRoute(
          page: const  HomePageScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
