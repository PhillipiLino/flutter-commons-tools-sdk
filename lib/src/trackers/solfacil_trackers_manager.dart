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

  Future saveFeedback(
    String userId,
    String email,
    int starsCount,
    String comment,
  ) async {
    for (var element in trackers) {
      element.sendData(
        collectionName: 'feedbacks',
        info: {
          'userId': userId,
          'email': email,
          'stars': starsCount,
          'comment': comment,
          'date': DateTime.now(),
        },
      );
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

  recordError({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  }) {
    for (var element in trackers) {
      element.recordException(
        exception: exception,
        stack: stack,
        reason: reason,
        errorCode: errorCode,
        printDebugLog: printDebugLog,
      );
    }
  }
}
