library solfacil_firebase_sdk;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:solfacil_tools_sdk/firebase/firebase_crashlytics_adapter.dart';
import 'package:solfacil_tools_sdk/log/log_manager.dart';

import '../firebase/firebase_analytics_adapter.dart';
import '../firebase/firebase_database_adapter.dart';
import '../firebase/firebase_performance_adapter.dart';
import 'external_trackers_interface.dart';

class SolfacilFirebaseSDK extends IExternalTrackers {
  late final FirebaseDatabaseAdapter databaseAdapter;
  late final FirebaseAnalyticsAdapter analyticsAdapter;
  late final FirebaseCrashlyticsAdapter crashlyticsAdapter;
  late final FirebasePerformanceAdapter? performanceAdapter;

  Map<String, Trace> pagesTrace = {};
  Map<String, HttpMetric> httpMetrics = {};

  SolfacilFirebaseSDK() {
    _initializeApp();
  }

  Future _initializeApp() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final analytics = FirebaseAnalytics.instance;
      final crashlytics = FirebaseCrashlytics.instance;

      if (!kDebugMode) {
        final performance = FirebasePerformance.instance;
        performance.setPerformanceCollectionEnabled(!kDebugMode);
        performanceAdapter = FirebasePerformanceAdapter(performance);
      } else {
        performanceAdapter = null;
      }

      databaseAdapter = FirebaseDatabaseAdapter(firestore);
      analyticsAdapter = FirebaseAnalyticsAdapter(analytics);
      crashlyticsAdapter = FirebaseCrashlyticsAdapter(crashlytics);
      return true;
    } catch (e) {
      LogManager.shared.logError('FIREBASE_SDK: $e');
      return null;
    }
  }

  @override
  Future logSuccessLogin(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    await analyticsAdapter.logLogin();
    await databaseAdapter.saveUserLogin(
      userId,
      email,
      aditionalInfos: aditionalInfos,
    );
    return;
  }

  @override
  Future setLogedUser(
    String userId,
    String email, {
    Map<String, dynamic>? aditionalInfos,
  }) async {
    final infos = aditionalInfos ?? {};
    await analyticsAdapter.setUserId(userId);
    await analyticsAdapter.setUserProperty(name: 'email', value: email);
    for (MapEntry<String, dynamic> info in infos.entries) {
      await analyticsAdapter.setUserProperty(name: info.key, value: info.value);
    }

    return;
  }

  @override
  Future removeUserData() async {
    await analyticsAdapter.setUserId(null);
    await analyticsAdapter.setUserProperty(name: 'email', value: null);
    await analyticsAdapter.setUserProperty(name: 'type', value: null);
    await analyticsAdapter.setUserProperty(name: 'category', value: null);
    return;
  }

  @override
  Future trackButtonClick(
    String btnName, {
    required Map<String, dynamic> infos,
  }) async {
    final eventName = '${btnName}_clicked';
    await analyticsAdapter.logEvents(
      eventName: eventName,
      eventInfos: infos,
    );

    return;
  }

  @override
  Future trackCustomEvent(
    String eventName, {
    required Map<String, dynamic> infos,
  }) async {
    await analyticsAdapter.logEvents(eventName: eventName, eventInfos: infos);
    return;
  }

  @override
  Future trackPageOpen(String pageName) async {
    await analyticsAdapter.setCurrentPage(pageName);

    final pageTrace = pagesTrace[pageName];
    if (pageTrace == null) {
      final trace = await performanceAdapter?.startNewTrace(pageName);
      if (trace != null) pagesTrace.putIfAbsent(pageName, () => trace);
    }

    return;
  }

  @override
  Future stopTrackPage(
    String pageName, {
    required Map<String, dynamic>? infos,
  }) async {
    if (infos != null) {
      await analyticsAdapter.logEvents(
        eventName: 'close_page_infos',
        eventInfos: infos,
      );
    }

    final pageTrace = pagesTrace[pageName];
    if (pageTrace == null) return;

    await performanceAdapter?.stopTrace(pageTrace);
    pagesTrace.remove(pageName);

    return;
  }

  @override
  Future startNewHttpMetric(String url, String httpMethod, String key) async {
    HttpMethod method = HttpMethod.Trace;
    switch (httpMethod) {
      case 'post':
        method = HttpMethod.Post;
        break;
      case 'get':
        method = HttpMethod.Get;
        break;
      case 'delete':
        method = HttpMethod.Delete;
        break;
      case 'put':
        method = HttpMethod.Put;
        break;
      case 'patch':
        method = HttpMethod.Patch;
        break;
      default:
        method = HttpMethod.Trace;
    }

    final metric = await performanceAdapter?.startNewHttpMetric(url, method);
    if (metric != null) httpMetrics.putIfAbsent(key, () => metric);

    return key;
  }

  @override
  Future stopHttpMetric(
    String metricKey, {
    required String responseContentType,
    required int httpResponseCode,
    required int responsePayloadSize,
  }) async {
    final metric = httpMetrics[metricKey];
    if (metric == null) return;

    await performanceAdapter?.stopHttpMetric(
      metric,
      responseContentType: responseContentType,
      httpResponseCode: httpResponseCode,
      responsePayloadSize: responsePayloadSize,
    );

    httpMetrics.remove(metricKey);

    return;
  }

  @override
  Future sendData({
    required String collectionName,
    required Map<String, Object> info,
    String? path,
  }) async {
    final collection = await databaseAdapter.getCollection(collectionName);
    await databaseAdapter.addFieldToCollection(collection, info, path);
    return;
  }

  @override
  Future recordException({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  }) async {
    try {
      return crashlyticsAdapter.recordError(
        exception: exception,
        stack: stack,
        reason: reason,
        errorCode: errorCode,
        printDebugLog: printDebugLog,
      );
    } catch (e) {
      LogManager.shared.logError('FIREBASE_SDK: $e');
      return null;
    }
  }
}
