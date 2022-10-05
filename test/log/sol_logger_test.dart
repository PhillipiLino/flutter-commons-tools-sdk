import 'package:flutter_test/flutter_test.dart';
import 'package:logger/src/logger.dart';
import 'package:solfacil_tools_sdk/src/log/request_log_event.dart';

import 'sol_logger_spy.dart';

main() {
  test('Test Log error', () {
    // Given
    final manager = SolLoggerSpy();

    // When
    manager.logError('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.error);
  });

  test('Test Log warning', () {
    // Given
    final manager = SolLoggerSpy();

    // When
    manager.logWarning('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.warning);
  });

  test('Test Log info', () {
    // Given
    final manager = SolLoggerSpy();

    // When
    manager.logInfo('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.info);
  });

  test('Test Log request info', () {
    // Given
    final manager = SolLoggerSpy();
    final event = RequestLogEvent(
      url: 'url',
      data: 'teste_data',
      method: 'POST',
      headers: {},
      contentType: 'contentType',
      queryParameters: {},
      response: {},
      exception: null,
      level: Level.error,
    );

    // When
    manager.logRequestEvent(event);

    // Then
    expect(manager.loggedMessage, event.toJson());
    expect(manager.currentLevel, event.level);
    expect(manager.eventToLog, event);
  });
}
