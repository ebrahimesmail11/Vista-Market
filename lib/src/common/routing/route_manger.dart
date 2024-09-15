import 'package:flutter/material.dart';
import 'package:vista_market/src/resident/presentation/view/login/screens/login_screen.dart';

class RouteManger {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const  LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
