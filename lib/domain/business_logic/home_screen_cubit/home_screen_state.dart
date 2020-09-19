part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class PokemonFetched extends HomeScreenState {
  final List<PokemonResult> pokemon;

  PokemonFetched(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}
