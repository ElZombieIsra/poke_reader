import 'package:flutter/material.dart';
import 'package:poke_reader/style.dart';

class PokeLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white,
      valueColor: AlwaysStoppedAnimation<Color>(PokeColors.red),
    );
  }
}
