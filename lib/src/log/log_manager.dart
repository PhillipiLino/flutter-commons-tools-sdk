part of solfacil_tools_sdk;

class LogManager {
  SolLogger? logger;
  List<LogType> typesToLog = [];

  static final LogManager shared = LogManager.internal();

  factory LogManager() => shared;

  LogManager.internal() : logger = SolLogger();

  logRequestEvent(RequestLogEvent event) {
    if (!typesToLog.contains(LogType.request)) return;
    logger?.logRequestEvent(event);
  }

  logWarning(dynamic message) {
    if (!typesToLog.contains(LogType.warning)) return;
    logger?.logWarning(message);
  }

  logInfo(dynamic message) {
    if (!typesToLog.contains(LogType.info)) return;
    logger?.logInfo(message);
  }

  logError(dynamic message) {
    if (!typesToLog.contains(LogType.error)) return;
    logger?.logError(message);
  }
}
