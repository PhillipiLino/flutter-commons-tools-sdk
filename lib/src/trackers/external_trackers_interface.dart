part of commons_tools_sdk;

abstract class IExternalTrackers {
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  });

  Future setLogedUser({
    required String userId,
    required String email,
    required String name,
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
}
