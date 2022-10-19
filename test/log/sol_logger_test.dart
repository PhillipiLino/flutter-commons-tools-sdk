import 'package:flutter_test/flutter_test.dart';
import 'package:logger/src/logger.dart';

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
}
