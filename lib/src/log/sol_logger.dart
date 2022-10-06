part of solfacil_tools_sdk;

class SolLogger {
  Logger? logger;

  SolLogger() {
    logger = Logger();
  }

  logWarning(dynamic message) => log(message, Level.warning);

  logInfo(dynamic message) => log(message, Level.info);

  logError(dynamic message) => log(message, Level.error);

  logVerbose(dynamic message) => log(message, Level.verbose);

  logStrange(dynamic message) => log(message, Level.wtf);

  log(dynamic message, Level level) => logger?.log(level, message);
}
