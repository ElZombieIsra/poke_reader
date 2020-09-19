import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_reader/data/repositories/pokemon_repository.dart';
import 'package:poke_reader/domain/models/pokemon_result.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final PokemonRepository _pokemonRepository = PokemonRepository();
  List<PokemonResult> pokemon = [];
  String _nextUrl;
  String _previousUrl;

  HomeScreenCubit() : super(HomeScreenInitial()) {
    fetchPokemon();
  }

  void fetchPokemon() async {
    var results = await _pokemonRepository.fetch(
      nextUrl: _nextUrl,
      previousUrl: _previousUrl,
    );
    // print(results);
    pokemon.addAll(results.item1);
    _nextUrl = results.item2;
    _previousUrl = results.item3;
    emit(PokemonFetched(results.item1));
  }
}
