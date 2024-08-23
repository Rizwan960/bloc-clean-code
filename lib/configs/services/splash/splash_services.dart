import 'dart:async';

import 'package:bloc_template/configs/routes/routes_names.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, RoutesNames.mainHomeViewScreen, (route) => false));
  }
}
