import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/domain/business_logic/app_cubit/app_cubit.dart';
import 'package:poke_reader/presentation/components/logo_image.dart';
import 'package:poke_reader/routes.dart';
import 'package:poke_reader/style.dart';

class WelcomeScreen extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PokeColors.primaryColor,
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PokeLogoImage(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to PokeReader',
                  style: _textStyle,
                ),
                Container(height: 10),
                Text(
                  'By ElZombieIsra',
                  style: _textStyle.copyWith(
                    fontWeight: FontWeight.w200,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            FlatButton(
              padding: const EdgeInsets.all(20),
              child: Text(
                "GET STARTED",
                style: _textStyle.copyWith(
                  fontSize: 15,
                  letterSpacing: 5,
                ),
              ),
              onPressed: () async {
                await BlocProvider.of<AppCubit>(context).setFirstTime();
                Navigator.pushReplacementNamed(context, RoutesNames.LOGIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
