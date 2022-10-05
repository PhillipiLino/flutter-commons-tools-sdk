part of solfacil_tools_sdk;

class SolLogger {
  Logger? logger;

  SolLogger() {
    logger = Logger();
  }

  logRequestEvent(RequestLogEvent event) => log(event.toJson(), event.level);

  logWarning(dynamic message) => log(message, Level.warning);

  logInfo(dynamic message) => log(message, Level.info);

  logError(dynamic message) => log(message, Level.error);

  log(dynamic message, Level level) => logger?.log(level, message);
}
