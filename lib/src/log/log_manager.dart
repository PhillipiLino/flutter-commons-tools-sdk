part of solfacil_tools_sdk;

class LogManager {
  SolLogger? logger;
  List<LogType> typesToLog = [];

  static final LogManager shared = LogManager.internal();

  factory LogManager() => shared;

  LogManager.internal() : logger = SolLogger();

  logRequestEvent(RequestLogEvent event) {
    final message = event.toJson();
    switch (event.logType) {
      case LogType.request:
        logInfo(message);
        break;
      case LogType.warning:
        logWarning(message);
        break;
      case LogType.responseRequest:
        logVerbose(message);
        break;
      case LogType.error:
        logError(message);
        break;
      default:
        logSpecificData(message);
    }
  }

  logWarning(dynamic message) {
    if (!typesToLog.contains(LogType.warning)) return;
    logger?.logWarning(message);
  }

  logInfo(dynamic message) {
    if (!typesToLog.contains(LogType.info) &&
        !typesToLog.contains(LogType.request)) {
      return;
    }

    logger?.logInfo(message);
  }

  logError(dynamic message) {
    if (!typesToLog.contains(LogType.error)) return;
    logger?.logError(message);
  }

  logVerbose(dynamic message) {
    if (!typesToLog.contains(LogType.info) &&
        !typesToLog.contains(LogType.responseRequest)) {
      return;
    }

    logger?.logVerbose(message);
  }

  logSpecificData(dynamic message) {
    if (!typesToLog.contains(LogType.specificData)) return;
    logger?.logStrange(message);
  }
}
