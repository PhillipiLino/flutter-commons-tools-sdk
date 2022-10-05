abstract class IExternalTrackers {
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  });

  Future setLogedUser(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  });

  Future removeUserData();

  Future trackButtonClick(
    String btnName, {
    required Map<String, dynamic> infos,
  });

  Future trackCustomEvent(
    String eventName, {
    required Map<String, dynamic> infos,
  });

  Future trackPageOpen(String pageName);

  Future stopTrackPage(
    String pageName, {
    required Map<String, dynamic>? infos,
  });

  Future startNewHttpMetric(
    String url,
    String httpMethod,
    String key,
  );

  Future stopHttpMetric(
    String metricKey, {
    required String responseContentType,
    required int httpResponseCode,
    required int responsePayloadSize,
  });

  Future sendData({
    required String collectionName,
    required Map<String, Object> info,
    String? path,
  });

  Future recordException({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  });
}
