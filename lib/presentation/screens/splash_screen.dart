import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/constants.dart';
import 'package:poke_reader/domain/business_logic/app_cubit/app_cubit.dart';
import 'package:poke_reader/presentation/components/loader.dart';
import 'package:poke_reader/routes.dart';
import 'package:poke_reader/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    bool loggedIn =
        await BlocProvider.of<AppCubit>(context).authService.isLoggedIn;
    Navigator.pushReplacementNamed(
      context,
      loggedIn ? RoutesNames.HOME : RoutesNames.LOGIN,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PokeColors.primaryColor,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              PokeLoader(),
            ],
          ),
        ),
      ),
    );
  }
}
