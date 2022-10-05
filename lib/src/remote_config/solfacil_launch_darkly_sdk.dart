part of solfacil_tools_sdk;

class SolfacilLaunchDarklySDK extends IExternalRemoteConfigs {
  late final LaunchDarklyAdapter launchDarklyAdapter = LaunchDarklyAdapter();

  static Future<void> configure(String mobileKey) async {
    return await LaunchDarklyAdapter.configure(mobileKey);
  }

  @override
  Future<bool> getBool(String key, bool defaultValue) async {
    try {
      return await launchDarklyAdapter.getBool(key, defaultValue);
    } catch (e) {
      LogManager.shared.logError('LAUNCH_DARKLY_SDK: $e');
      return defaultValue;
    }
  }

  @override
  Future<double> getDouble(String key, double defaultValue) async {
    try {
      return await launchDarklyAdapter.getDouble(key, defaultValue);
    } catch (e) {
      LogManager.shared.logError('LAUNCH_DARKLY_SDK: $e');
      return defaultValue;
    }
  }

  @override
  Future<int> getInt(String key, int defaultValue) async {
    try {
      return await launchDarklyAdapter.getInt(key, defaultValue);
    } catch (e) {
      LogManager.shared.logError('LAUNCH_DARKLY_SDK: $e');
      return defaultValue;
    }
  }

  @override
  Future<String> getString(String key, String defaultValue) async {
    try {
      return await launchDarklyAdapter.getString(key, defaultValue);
    } catch (e) {
      LogManager.shared.logError('LAUNCH_DARKLY_SDK: $e');
      return defaultValue;
    }
  }

  @override
  Future<void> setUser(
    String userId,
    String userEmail, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    return await launchDarklyAdapter.setUser(
      userId,
      userEmail,
      aditionalInfos: aditionalInfos,
    );
  }
}
