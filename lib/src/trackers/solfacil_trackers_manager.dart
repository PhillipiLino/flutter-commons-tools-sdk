part of solfacil_tools_sdk;

class SolfacilTrackersManager {
  final List<IExternalTrackers> trackers;

  SolfacilTrackersManager(this.trackers);

  Future setLogedUser({
    required String userId,
    required String email,
    required String name,
    Map<String, dynamic>? aditionalInfos,
  }) async {
    for (var element in trackers) {
      element.setLogedUser(
        userId: userId,
        email: email,
        name: name,
        aditionalInfos: aditionalInfos,
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
    required Map<String, dynamic> infos,
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
    required Map<String, dynamic> infos,
  }) async {
    for (var element in trackers) {
      element.trackCustomEvent(eventName, infos: infos);
    }

    return;
  }

  Future stopTrackPage(
    String pageName, {
    Map<String, dynamic>? infos,
  }) async {
    for (var element in trackers) {
      element.stopTrackPage(pageName, infos: infos);
    }

    return;
  }

  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    for (var element in trackers) {
      element.logSuccessLogin(
        userId,
        email,
        aditionalInfos: aditionalInfos,
      );
    }

    return;
  }
}
