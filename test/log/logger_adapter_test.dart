import 'package:flutter_test/flutter_test.dart';
import 'package:logger/src/logger.dart';

import 'logger_adapter_spy.dart';

main() {
  test('Test Log error', () {
    // Given
    final manager = LoggerAdapterSpy();

    // When
    manager.logError('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.error);
  });

  test('Test Log warning', () {
    // Given
    final manager = LoggerAdapterSpy();

    // When
    manager.logWarning('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.warning);
  });

  test('Test Log info', () {
    // Given
    final manager = LoggerAdapterSpy();

    // When
    manager.logInfo('Teste');

    // Then
    expect(manager.loggedMessage, 'Teste');
    expect(manager.currentLevel, Level.info);
  });
}
