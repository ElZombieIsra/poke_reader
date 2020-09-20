import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/constants.dart';
import 'package:poke_reader/domain/business_logic/app_cubit/app_cubit.dart';
import 'package:poke_reader/domain/business_logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:poke_reader/presentation/components/loader.dart';

import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  final HomeScreenCubit _cubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        if (state is UserLogged && state.loggedIn == false) {
          Navigator.pushReplacementNamed(context, RoutesNames.LOGIN);
        }
      },
      child: BlocProvider.value(
        value: _cubit,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => BlocProvider.of<AppCubit>(context).logOutUser(),
            ),
            title: Text(
              Constants.kAppTitle,
              style: TextStyle(
                letterSpacing: 7,
              ),
            ),
            centerTitle: true,
          ),
          body: BlocConsumer<HomeScreenCubit, HomeScreenState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ListView(
                controller: _controller,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                children: [
                  if (state is PokemonFetched)
                    ..._cubit.pokemon
                        .map(
                          (poke) => ListTile(
                            title: Text(
                              poke.name.toUpperCase(),
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () => Navigator.pushNamed(
                              context,
                              RoutesNames.DETAILS,
                              arguments: poke,
                            ),
                          ),
                        )
                        .toList(),
                  Center(child: PokeLoader()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller
      ..addListener(() {
        if (_controller.position.pixels ==
            _controller.position.maxScrollExtent) {
          _cubit.fetchPokemon();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _cubit?.close();
    super.dispose();
  }
}
