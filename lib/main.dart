import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './routes.dart';
import './style.dart';
import 'constants.dart';
import 'domain/business_logic/app_cubit/app_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: Constants.kAppTitle,
            theme: appTheme,
            routes: routes,
          );
        },
      ),
    );
  }
}
