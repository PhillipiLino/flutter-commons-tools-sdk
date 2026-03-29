part of 'trackers.dart';

abstract class IExternalTrackers {
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, Object>? additionalInfos,
  });

  Future setLoggedUser({
    required String userId,
    required String email,
    required String name,
    Map<String, Object>? additionalInfos,
  });

  Future removeUserData();

  Future trackButtonClick(
    String btnName, {
    required Map<String, Object> infos,
  });

  Future trackCustomEvent(
    String eventName, {
    required Map<String, Object> infos,
  });

  Future trackPageOpen(String pageName);

  Future stopTrackPage(
    String pageName, {
    required Map<String, Object>? infos,
  });
}
