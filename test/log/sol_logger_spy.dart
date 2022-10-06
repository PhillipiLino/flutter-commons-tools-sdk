import 'package:logger/src/logger.dart';
import 'package:solfacil_tools_sdk/src/log/logger.dart';

class SolLoggerSpy extends SolLogger {
  dynamic loggedMessage;
  Level? currentLevel;
  RequestLogEvent? eventToLog;

  @override
  log(message, Level level) {
    currentLevel = level;
    loggedMessage = message;

    return super.log(message, level);
  }
}
