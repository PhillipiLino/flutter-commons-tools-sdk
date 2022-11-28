part of solfacil_tools_sdk;

abstract class IErrorReport {
  Future recordException({
    required Exception exception,
    required StackTrace stack,
    required String reason,
    int? errorCode,
    bool printDebugLog = true,
  });
}
