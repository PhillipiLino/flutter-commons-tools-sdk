part of solfacil_tools_sdk;

class SolfacilMixpanelSDK extends IExternalTrackers {
  late final Mixpanel mixpanel;
  final String token;

  SolfacilMixpanelSDK(this.token) {
    _initializeApp(token);
  }

  Future _initializeApp(String token) async {
    try {
      mixpanel = await Mixpanel.init(
        token,
        optOutTrackingDefault: false,
        trackAutomaticEvents: true,
      );
      return true;
    } catch (e) {
      LogManager.shared.logError('MIXPANEL_SDK: $e');
      return null;
    }
  }

  @override
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    mixpanel.track('login', properties: aditionalInfos);
    return;
  }

  @override
  Future setLogedUser({
    required String userId,
    required String email,
    required String name,
    Map<String, dynamic>? aditionalInfos,
  }) async {
    final infos = aditionalInfos ?? {};
    mixpanel.identify(userId);

    mixpanel.getPeople().set('\$email', email);
    mixpanel.getPeople().set('\$name', name);
    for (MapEntry<String, dynamic> info in infos.entries) {
      mixpanel.getPeople().set(info.key, info.value);
    }

    return;
  }

  @override
  Future removeUserData() async {
    mixpanel.reset();

    return;
  }

  @override
  Future trackButtonClick(
    String btnName, {
    required Map<String, dynamic> infos,
  }) async {
    final eventName = '${btnName}_clicked';
    mixpanel.track(eventName, properties: infos);

    return;
  }

  @override
  Future trackCustomEvent(
    String eventName, {
    required Map<String, dynamic> infos,
  }) async {
    mixpanel.track(eventName, properties: infos);
    return;
  }

  @override
  Future trackPageOpen(String pageName) async {
    mixpanel.track('open_page', properties: {'pageName': pageName});
    return;
  }

  @override
  Future stopTrackPage(
    String pageName, {
    required Map<String, dynamic>? infos,
  }) async {
    mixpanel.track('close_page_infos', properties: infos);
    return;
  }
}
