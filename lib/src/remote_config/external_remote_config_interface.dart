part of solfacil_tools_sdk;

abstract class IExternalRemoteConfigs {
  Future<void> setUser(
    String userId,
    String userEmail, {
    Map<String, dynamic>? aditionalInfos,
  });
  Future<bool> getBool(String key, bool defaultValue);
  Future<int> getInt(String key, int defaultValue);
  Future<double> getDouble(String key, double defaultValue);
  Future<String> getString(String key, String defaultValue);
  Future<Map<String, dynamic>> getJSON(
    String key,
    Map<String, dynamic> defaultValue,
  );
}
