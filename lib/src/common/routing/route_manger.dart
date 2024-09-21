import 'package:flutter/material.dart';
import 'package:vista_market/src/common/routing/routes.dart';
import 'package:vista_market/src/resident/presentation/view/login/login_screen.dart';
import 'package:vista_market/src/resident/presentation/view/registration/registration_screen.dart';

class RouteManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const  LoginScreen(),
        );
        case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const  RegistrationScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
