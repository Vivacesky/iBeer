import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesDatasource {
  String? getString(String key);

  Future<bool> setString(String key, String value);

  Future<bool> remove(String key);
}

class CacheService implements PreferencesDatasource {
  final SharedPreferences sharedPreferences;

  const CacheService(this.sharedPreferences);

  @override
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    return await sharedPreferences.remove(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }
}
