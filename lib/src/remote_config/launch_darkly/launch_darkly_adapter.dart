part of solfacil_tools_sdk;

class LaunchDarklyAdapter {
  static Future<void> configure(String mobileKey) async {
    final LDConfig ldConfig = LDConfigBuilder(mobileKey).build();
    final LDUser ldUser = LDUserBuilder('undefined').build();

    await LDClient.start(ldConfig, ldUser);
    return;
  }

  Future<void> setUser(
    String userId,
    String userEmail, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    LDUserBuilder userBuilder = LDUserBuilder(userId);
    userBuilder.email(userEmail);
    for (var element in (aditionalInfos ?? {}).entries) {
      userBuilder.custom(element.key, LDValue.fromCodecValue(element.value));
    }

    final user = userBuilder.build();
    await LDClient.identify(user);
  }

  Future<bool> getBool(String key, bool defaultValue) async {
    return await LDClient.boolVariation(key, defaultValue);
  }

  Future<int> getInt(String key, int defaultValue) async {
    return await LDClient.intVariation(key, defaultValue);
  }

  Future<double> getDouble(String key, double defaultValue) async {
    return await LDClient.doubleVariation(key, defaultValue);
  }

  Future<String> getString(String key, String defaultValue) async {
    return await LDClient.stringVariation(key, defaultValue);
  }
}
