import 'package:flutter/material.dart';
import 'package:poke_reader/routes.dart';
import 'package:poke_reader/style.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      Hero(
        tag: Images.kPokeball,
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Image.asset(
            Images.kPokeball,
            fit: BoxFit.contain,
          ),
        ),
      ),
      Container(height: 40),
      TextField(
        decoration: InputDecoration(
          hintText: "Usuario",
        ),
      ),
      TextField(
        decoration: InputDecoration(
          hintText: "Contraseña",
        ),
      ),
      RaisedButton(
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          RoutesNames.HOME,
        ),
        child: Text("Iniciar sesión"),
      ),
    ];

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: PokeColors.primaryColor,
        child: SafeArea(
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              itemBuilder: (context, i) => widgets[i],
              separatorBuilder: (_, i) => SizedBox(height: 20),
              itemCount: widgets.length,
            ),
          ),
        ),
      ),
    );
  }
}
