import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:poke_reader/domain/services/auth_service.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthService authService = AuthService();
  AppCubit() : super(AppInitial());

  void logInUser(String user, String pass) async {
    emit(UserLogged(await authService.logUser(user, pass)));
  }

  void logOutUser() async {
    await authService.logOutUser();
    emit(UserLogged(false));
  }
}
