import 'package:flutter/material.dart';

import '../../constants.dart';

class PokeLogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Images.kPokeball,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Image.asset(
          Images.kPokeball,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
