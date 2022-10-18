import 'package:apteka_uz/presentations/auth/login_screen/login_screen.dart';
import 'package:apteka_uz/presentations/auth/register_screen/register_screen.dart';
import 'package:apteka_uz/presentations/home_screen/home_screen.dart';
import 'package:apteka_uz/presentations/splash_screen.dart';
import 'package:apteka_uz/utils/constants.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return navigateTo(const SplashScreen());
      case homePage:
        return navigateTo(const MyHomePage());

      case loginPage:
        return navigateTo(const LoginPage());

      case registerPage:
        return navigateTo(const RegisterPage());

      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );
