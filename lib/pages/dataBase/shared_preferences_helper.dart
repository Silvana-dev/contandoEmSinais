import "package:shared_preferences/shared_preferences.dart";

class SharedPreferencesHelper {
  final Map<String, bool> _key = {'user': false};
  Future<SharedPreferences> get _getInstance async =>
      SharedPreferences.getInstance();

  setUser(bool status) async {
    SharedPreferences instance = await _getInstance;
    bool? user = instance.getBool('USER');
    if (user == null) {
      return false;
    }
    return user;
  }
}
