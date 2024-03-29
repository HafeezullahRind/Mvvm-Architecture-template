import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/views/home_screen.dart';
import 'package:mvvm_app/views/login_screen.dart';
import 'package:mvvm_app/views/register.dart';
import 'package:mvvm_app/views/splash_view.dart';

class Routes {
  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => loginScreen());

      case RoutesNames.register:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
