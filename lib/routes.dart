import 'package:flutter/material.dart';
import 'package:poke_reader/presentation/screens/login_screen.dart';
import 'package:poke_reader/presentation/screens/splash_screen.dart';

class RoutesNames {
  static const String HOME = "/";
  static const String LOGIN = "/login";
}

Map<String, WidgetBuilder> routes = {
  RoutesNames.HOME: (_) => SplashScreen(),
  RoutesNames.LOGIN: (_) => LoginScreen(),
};
