// Master styles for the app
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: PokeColors.primaryColor,
  accentColor: PokeColors.secondaryColor,
  hintColor: Colors.white54,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
    elevation: 0.0,
  ),
);

class PokeColors {
  static const Color black = Color.fromRGBO(17, 17, 25, 1.0);
  static const Color red = Color.fromRGBO(221, 25, 71, 1.0);
  static const Color blue = Color.fromRGBO(25, 175, 221, 1.0);
  static const Color gray25 = Color.fromRGBO(233, 233, 233, 1.0);
  static const Color gray50 = Color.fromRGBO(136, 136, 140, 1.0);
  static const Color gray = Color.fromRGBO(109, 109, 109, 1.0);
  static const Color white = Color.fromRGBO(255, 255, 255, 1.0);

  static const Color primaryColor = red;
  static const Color secondaryColor = white;
}
