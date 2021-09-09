import 'package:basket/presentation/layout/home_layout.dart';
import 'package:basket/presentation/screens/intro_screen.dart';
import 'package:basket/presentation/screens/login_screen.dart';
import 'package:basket/presentation/screens/register_screen.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case introductionScreen:
        return MaterialPageRoute(
          builder: (_) => const IntroScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
        case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
    }
  }
}
