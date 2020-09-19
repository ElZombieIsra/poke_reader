import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String kUserKey = 'user';
  SharedPreferences _prefs;

  Future<SharedPreferences> get prefs async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  Future<bool> get isLoggedIn async => (await prefs).containsKey(kUserKey);

  Future<bool> logUser(String user, String pass) async {
    return await (await prefs).setStringList(kUserKey, [user, pass]);
  }

  Future<bool> logOutUser() async => await (await prefs).remove(kUserKey);
}
