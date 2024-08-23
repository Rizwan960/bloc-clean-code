import 'dart:io';

import 'package:bloc_template/configs/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/view_barrel_file.dart';

class Routes {
  static bool isIOS = Platform.isIOS == true ? true : false;
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const SplashScreen(),
              )
            : MaterialPageRoute(
                builder: (context) => const SplashScreen(),
              );
      case RoutesNames.loginScreen:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const LoginScreen(),
              )
            : MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              );
      case RoutesNames.signupScreen:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const SignupScreen(),
              )
            : MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              );
      case RoutesNames.forgotPasswordScreen:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              )
            : MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              );
      case RoutesNames.mainHomeViewScreen:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const MainHomeViewScreen(),
              )
            : MaterialPageRoute(
                builder: (context) => const MainHomeViewScreen(),
              );
      default:
        return isIOS
            ? CupertinoPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No routes generated"),
                  ),
                ),
              )
            : MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("No routes generated"),
                  ),
                ),
              );
    }
  }
}
