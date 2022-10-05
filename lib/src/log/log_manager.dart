import 'package:solfacil_tools_sdk/src/log/request_log_event.dart';
import 'package:solfacil_tools_sdk/src/log/sol_logger.dart';

class LogManager {
  SolLogger? logger;
  bool debugMode = false;

  static final LogManager shared = LogManager.internal();

  factory LogManager() => shared;

  LogManager.internal() : logger = SolLogger();

  logRequestEvent(RequestLogEvent event) {
    if (!debugMode) return;
    logger?.logRequestEvent(event);
  }

  logWarning(dynamic message) {
    if (!debugMode) return;
    logger?.logWarning(message);
  }

  logInfo(dynamic message) {
    if (!debugMode) return;
    logger?.logInfo(message);
  }

  logError(dynamic message) {
    if (!debugMode) return;
    logger?.logError(message);
  }
}
