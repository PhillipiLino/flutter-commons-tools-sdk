import 'package:firebase_performance/firebase_performance.dart';
import 'package:solfacil_tools_sdk/log/log_manager.dart';

class FirebasePerformanceAdapter {
  final FirebasePerformance performance;

  FirebasePerformanceAdapter(this.performance);

  Future<Trace?> startNewTrace(String traceName) async {
    try {
      final trace = performance.newTrace(traceName);
      await trace.start();
      return trace;
    } catch (e) {
      LogManager.shared.logError('FIREBASE_PERFORMANCE: $e');
      return null;
    }
  }

  Future putTraceAttributes(
    Trace trace,
    Map<String, String> attributes,
  ) async {
    try {
      attributes.forEach((key, value) {
        trace.putAttribute(key, value);
      });
    } catch (e) {
      LogManager.shared.logError('FIREBASE_PERFORMANCE: $e');
      return null;
    }
  }

  Future stopTrace(Trace trace) async {
    try {
      await trace.stop();
    } catch (e) {
      LogManager.shared.logError('FIREBASE_PERFORMANCE: $e');
      return null;
    }
  }

  Future<HttpMetric?> startNewHttpMetric(
    String url,
    HttpMethod httpMethod,
  ) async {
    try {
      final metric = performance.newHttpMetric(url, httpMethod);
      await metric.start();
      return metric;
    } catch (e) {
      LogManager.shared.logError('FIREBASE_PERFORMANCE: $e');
      return null;
    }
  }

  Future stopHttpMetric(
    HttpMetric metric, {
    String? responseContentType,
    int? httpResponseCode,
    int? responsePayloadSize,
  }) async {
    try {
      metric.responseContentType = responseContentType;
      metric.httpResponseCode = httpResponseCode;
      metric.responsePayloadSize = responsePayloadSize;

      return await metric.stop();
    } catch (e) {
      LogManager.shared.logError('FIREBASE_PERFORMANCE: $e');
      return null;
    }
  }
}
