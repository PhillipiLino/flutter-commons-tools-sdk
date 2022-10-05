library solfacil_firebase_sdk;

import 'package:solfacil_tools_sdk/src/launch_darkly/launch_darkly_adapter.dart';
import 'package:solfacil_tools_sdk/src/log/logger.dart';

import 'external_remote_config_interface.dart';

class SolfacilLaunchDarklySDK extends IExternalRemoteConfigs {
  late final LaunchDarklyAdapter launchDarklyAdapter = LaunchDarklyAdapter();

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
