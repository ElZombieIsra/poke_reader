part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class UserLogged extends AppState {
  final bool loggedIn;

  UserLogged([this.loggedIn = false]);

  @override
  List<Object> get props => [loggedIn];
}
