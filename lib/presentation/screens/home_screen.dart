import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_reader/constants.dart';
import 'package:poke_reader/domain/business_logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:poke_reader/presentation/components/loader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  final HomeScreenCubit _cubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
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
                          onTap: () {},
                        ),
                      )
                      .toList(),
                Center(child: PokeLoader()),
              ],
            );
          },
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
          print('bottom');
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
