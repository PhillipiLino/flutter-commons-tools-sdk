part of 'logger.dart';

class LoggerAdapter {
  final Logger logger;

  LoggerAdapter() : logger = Logger();

  dynamic logWarning(dynamic message) => log(message, Level.warning);

  dynamic logInfo(dynamic message) => log(message, Level.info);

  dynamic logError(dynamic message) => log(message, Level.error);

  dynamic logVerbose(dynamic message) => log(message, Level.trace);

  dynamic logStrange(dynamic message) => log(message, Level.fatal);

  void log(dynamic message, Level level) => logger.log(level, message);
}
