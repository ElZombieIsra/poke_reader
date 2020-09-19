import 'package:dio/dio.dart';
import 'package:poke_reader/data/interfaces/pokemon_interface.dart';
import 'package:poke_reader/domain/errors/pokemon.dart';
import 'package:tuple/tuple.dart';
import 'package:poke_reader/domain/models/pokemon_result.dart';

class PokemonApiProvider implements PokemonInterface {
  static const String kApiUrl = "https://pokeapi.co/api/v2";
  static const String kPokemonEndpoint = "$kApiUrl/pokemon";

  final Dio network = Dio();

  @override
  Future<Tuple3<List<PokemonResult>, String, String>> fetch({
    String nextUrl,
    String previousUrl,
  }) async {
    String fetchUrl = kPokemonEndpoint;
    if (nextUrl != null) {
      fetchUrl = nextUrl;
    } else if (previousUrl != null) {
      fetchUrl = previousUrl;
    }
    try {
      var res = await network.get(fetchUrl);
      List<PokemonResult> _pokemon = (res.data['results'] as List)
          .map((poke) {
            /// The try catch ensures that if 1 pokemon in the list cannot be
            /// parsed, it'll be skipped so the map doesn't stop and theres
            /// info to be shown to the user.
            try {
              return PokemonResult.fromJson(poke);
            } catch (e) {
              return null;
            }
          })

          /// Here we filter the pokemon that could not be parsed
          .where((poke) => poke != null)
          .toList();
      return Tuple3<List<PokemonResult>, String, String>(
        _pokemon,
        res.data['next'],
        res.data['previous'],
      );
    } catch (e) {
      print(e);
      throw PokeException("An error ocurred while trying to fetch pokemon");
    }
  }
}
