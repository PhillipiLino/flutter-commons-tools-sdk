part of solfacil_tools_sdk;

class SolfacilSharedPreferences implements ISolfacilPreferences {
  final _preferences = SharedPreferences.getInstance();

  @override
  Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _preferences;

    try {
      return prefs.getInt(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _preferences;

    try {
      return prefs.getString(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await _preferences;
    return await prefs.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await _preferences;
    return await prefs.setString(key, value);
  }

  @override
  Future<List<String>> getKeys() async {
    final SharedPreferences prefs = await _preferences;
    return prefs.getKeys().toList();
  }

  @override
  Future<bool> removeKey(String key) async {
    final SharedPreferences prefs = await _preferences;
    return await prefs.remove(key);
  }

  @override
  Future<bool> clear() async {
    final SharedPreferences prefs = await _preferences;
    return await prefs.clear();
  }

  @override
  Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await _preferences;

    try {
      return prefs.getBool(key);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _preferences;
    return await prefs.setBool(key, value);
  }
}
