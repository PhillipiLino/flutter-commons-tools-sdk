import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashlyticsAdapter {
  final FirebaseCrashlytics crashlytics;

  FirebaseCrashlyticsAdapter(this.crashlytics);

  Future recordError({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  }) {
    crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      printDetails: printDebugLog,
    );

    if (errorCode != null) {
      FirebaseCrashlytics.instance.setCustomKey('error_code', errorCode);
    }

    return FirebaseCrashlytics.instance.setCustomKey('error_message', reason);
  }
}
