import 'package:flutter/material.dart';
import 'package:poke_reader/presentation/screens/home_screen.dart';
import 'package:poke_reader/presentation/screens/login_screen.dart';
import 'package:poke_reader/presentation/screens/pokemon_detail.dart';
import 'package:poke_reader/presentation/screens/splash_screen.dart';

class RoutesNames {
  static const String SPLASH = "/";
  static const String LOGIN = "/login";
  static const String HOME = "/home";
  static const String DETAILS = "/details";
}

Map<String, WidgetBuilder> routes = {
  RoutesNames.SPLASH: (_) => SplashScreen(),
  RoutesNames.LOGIN: (_) => LoginScreen(),
  RoutesNames.HOME: (_) => HomeScreen(),
  RoutesNames.DETAILS: (_) => PokemonDetailScreen(),
};
