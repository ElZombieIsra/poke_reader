import 'package:flutter/material.dart';
import 'package:poke_reader/constants.dart';
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
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, RoutesNames.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PokeColors.primaryColor,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              PokeLoader(),
            ],
          ),
        ),
      ),
    );
  }
}
