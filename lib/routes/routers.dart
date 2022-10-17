import 'package:apteka_uz/utils/constantes.dart';
import 'package:apteka_uz/views/auth/login.dart';
import 'package:apteka_uz/views/auth/register.dart';
import 'package:apteka_uz/views/home_page.dart';
import 'package:apteka_uz/views/splesh_screen.dart';
import 'package:flutter/material.dart';


class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPage:
        return navigateTo(SplashScreen());

      case homePage:
        return navigateTo(MyHomePage());

      case loginPage:
        return navigateTo(LoginPage());

      case registerPage:
        return navigateTo(RegisterPage());

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
