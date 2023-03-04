import 'package:commons_tools_sdk/src/log/logger.dart';
import 'package:logger/src/logger.dart';

class LoggerAdapterSpy extends LoggerAdapter {
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
