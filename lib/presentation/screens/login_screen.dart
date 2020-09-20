import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/domain/business_logic/app_cubit/app_cubit.dart';
import 'package:poke_reader/presentation/components/logo_image.dart';
import 'package:poke_reader/presentation/components/textfield.dart';
import 'package:poke_reader/routes.dart';
import 'package:poke_reader/style.dart';

class LoginScreen extends StatelessWidget {
  final List<TextEditingController> controllers = List.generate(
    2,
    (index) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [
      PokeLogoImage(),
      Container(height: 40),
      PokeTextField(
        controller: controllers[0],
        hint: 'Usuario',
      ),
      PokeTextField(
        controller: controllers[1],
        hint: 'Contraseña',
        obscureText: true,
      ),
      FlatButton(
        onPressed: () => BlocProvider.of<AppCubit>(context).logInUser(
          controllers[0].text,
          controllers[1].text,
        ),
        child: Text(
          "Iniciar sesión".toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 5,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: PokeColors.primaryColor,
        child: BlocListener<AppCubit, AppState>(
          listener: (context, state) {
            if (state is UserLogged && state.loggedIn) {
              Navigator.pushReplacementNamed(
                context,
                RoutesNames.HOME,
              );
            }
          },
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
      ),
    );
  }
}
