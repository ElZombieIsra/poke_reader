import 'package:flutter/material.dart';
import 'package:poke_reader/data/repositories/pokemon_repository.dart';
import 'package:poke_reader/domain/models/pokemon.dart';
import 'package:poke_reader/domain/models/pokemon_result.dart';
import 'package:poke_reader/presentation/components/containers/stat_container.dart';
import 'package:poke_reader/presentation/components/loader.dart';
import 'package:poke_reader/style.dart';

class PokemonDetailScreen extends StatefulWidget {
  @override
  _PokemonDetailScreenState createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  bool fetched = false;
  Pokemon pokemon;
  PokemonResult poke;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      poke = ModalRoute.of(context).settings.arguments;

      /// Ensures that we always have a pokemon
      if (poke == null) {
        Navigator.pop(context);
      }
      Pokemon _poke = await _pokemonRepository.details(poke.url);
      print(_poke);
      setState(() {
        fetched = true;
        pokemon = _poke;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon != null ? pokemon.name.toUpperCase() : 'Pokemon',
          style: TextStyle(
            letterSpacing: 5,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!fetched && pokemon == null)
                Expanded(
                  child: Center(
                    child: PokeLoader(),
                  ),
                ),
              if (fetched && pokemon == null)
                Center(
                  child: Text("There's no data here"),
                ),
              if (pokemon != null) ...[
                Container(
                  color: PokeColors.primaryColor,
                  constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  child: pokemon.spriteUrl != null
                      ? Image.network(
                          pokemon.spriteUrl,
                          fit: BoxFit.contain,
                        )
                      : Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatContainer(
                      size: 100,
                      text: "Weight",
                      value: "${pokemon.weight}",
                    ),
                    StatContainer(
                      size: 100,
                      text: "Heigth",
                      value: "${pokemon.height}",
                    ),
                    StatContainer(
                      size: 100,
                      text: "Experience",
                      value: "${pokemon.baseExperience}",
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Stats",
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => StatContainer(
                            text: pokemon.stats[i]['stat']['name'],
                            value: "Slot ${pokemon.stats[i]['base_stat']}",
                          ),
                          separatorBuilder: (_, i) => VerticalDivider(),
                          itemCount: pokemon.stats.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Movements",
                      ),
                    ),
                    Container(
                      height: 80,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) => StatContainer(
                          text: pokemon.moves[i],
                        ),
                        separatorBuilder: (_, i) => VerticalDivider(),
                        itemCount: pokemon.moves.length,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Types",
                        ),
                      ),
                      Container(
                        height: 80,
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => StatContainer(
                            text: pokemon.types[i],
                          ),
                          separatorBuilder: (_, i) => VerticalDivider(),
                          itemCount: pokemon.types.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Abilities",
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) => StatContainer(
                          text: pokemon.abilities[i].name,
                          value: "Slot ${pokemon.abilities[i].slot}",
                        ),
                        separatorBuilder: (_, i) => VerticalDivider(),
                        itemCount: pokemon.abilities.length,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
