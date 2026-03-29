part of 'trackers.dart';

class TrackersManager {
  final List<IExternalTrackers> trackers;

  TrackersManager(this.trackers);

  Future setLoggedUser({
    required String userId,
    required String email,
    required String name,
    Map<String, Object>? additionalInfos,
  }) async {
    for (var element in trackers) {
      element.setLoggedUser(
        userId: userId,
        email: email,
        name: name,
        additionalInfos: additionalInfos,
      );
    }

    return;
  }

  Future removeLoggedUser() async {
    for (var element in trackers) {
      element.removeUserData();
    }

    return;
  }

  Future trackButtonClick(
    String btnName, {
    required Map<String, Object> infos,
  }) async {
    for (var element in trackers) {
      element.trackButtonClick(btnName, infos: infos);
    }

    return;
  }

  Future trackPageOpen(String pageName) async {
    for (var element in trackers) {
      element.trackPageOpen(pageName);
    }

    return;
  }

  Future trackCustomEvent(
    String eventName, {
    required Map<String, Object> infos,
  }) async {
    for (var element in trackers) {
      element.trackCustomEvent(eventName, infos: infos);
    }

    return;
  }

  Future stopTrackPage(
    String pageName, {
    Map<String, Object>? infos,
  }) async {
    for (var element in trackers) {
      element.stopTrackPage(pageName, infos: infos);
    }

    return;
  }

  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, Object>? additionalInfos,
  }) async {
    for (var element in trackers) {
      element.logSuccessLogin(
        userId,
        email,
        additionalInfos: additionalInfos,
      );
    }

    return;
  }
}
