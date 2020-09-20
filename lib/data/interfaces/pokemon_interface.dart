import 'package:poke_reader/domain/models/pokemon.dart';
import 'package:poke_reader/domain/models/pokemon_result.dart';
import 'package:tuple/tuple.dart';

abstract class PokemonInterface {
  /// If no url is provided, the default url will be used
  ///
  /// If [nextUrl] is provided, that url will be used to fetch the pokemon.
  ///
  /// If [previousUrl] is provided *and* [nextUrl] is not, that url will be used
  /// to fetch the pokemon
  ///
  /// Returns a [List] of [PokemonResult], a [nextUrl] and a [previousUrl]
  Future<Tuple3<List<PokemonResult>, String, String>> fetch({
    String nextUrl,
    String previousUrl,
  });

  Future<Pokemon> details(String url);
}
