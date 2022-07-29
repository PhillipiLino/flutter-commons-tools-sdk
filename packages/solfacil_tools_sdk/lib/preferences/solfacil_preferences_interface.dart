abstract class ISolfacilPreferences {
  Future<String?> getString(String key);
  Future<bool> setString(String key, String value);
  Future<int?> getInt(String key);
  Future<bool> setInt(String key, int value);
  Future<bool?> getBool(String key);
  Future<bool> setBool(String key, bool value);
  Future<List<String>> getKeys();
  Future<bool> removeKey(String key);
  Future<bool> clear();
}
