import 'package:logger/src/logger.dart';
import 'package:solfacil_tools_sdk/src/log/request_log_event.dart';
import 'package:solfacil_tools_sdk/src/log/sol_logger.dart';

class SolLoggerSpy extends SolLogger {
  dynamic loggedMessage;
  Level? currentLevel;
  RequestLogEvent? eventToLog;

  @override
  logRequestEvent(RequestLogEvent event) {
    eventToLog = event;
    super.logRequestEvent(event);
  }

  @override
  log(message, Level level) {
    currentLevel = level;
    loggedMessage = message;

    return super.log(message, level);
  }
}
