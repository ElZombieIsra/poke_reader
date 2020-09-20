import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/domain/business_logic/app_cubit/app_cubit.dart';
import 'package:poke_reader/presentation/components/loader.dart';
import 'package:poke_reader/presentation/components/logo_image.dart';
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
    AppCubit appCubit = BlocProvider.of<AppCubit>(context);
    bool loggedIn = await appCubit.authService.isLoggedIn;
    bool firstTime = await appCubit.firstTime;
    String route = RoutesNames.HOME;
    if (!loggedIn) route = RoutesNames.LOGIN;
    if (firstTime) route = RoutesNames.WELCOME;
    Navigator.pushReplacementNamed(context, route);
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
              PokeLogoImage(
                size: MediaQuery.of(context).size.height / 3,
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
