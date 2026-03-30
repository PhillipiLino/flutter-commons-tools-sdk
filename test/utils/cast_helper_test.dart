import 'package:commons_tools_sdk/logger.dart';
import 'package:commons_tools_sdk/src/commons_tools_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

import '../log/logger_adapter_spy.dart';

void main() {
  late LoggerAdapterSpy loggerSpy;

  setUp(() {
    loggerSpy = LoggerAdapterSpy();
    LogManager.shared
      ..logger = loggerSpy
      ..typesToLog = [LogType.warning];
  });

  tearDown(() {
    LogManager.shared.typesToLog = [];
  });

  test('Cast string succefull', () {
    // Arrange
    String? myVar = '';
    const testVar = 'string';

    // Act
    myVar = castOrNull<String>(testVar);

    // Assert
    expect(myVar, testVar);
  });

  test('Cast string passing wrong type', () {
    // Arrange
    String? myVar = '';
    const testVar = 123;

    // Act
    myVar = castOrNull<String>(testVar);

    // Assert
    expect(myVar, null);
  });

  test('Cast int succefull', () {
    // Arrange
    int? myVar = 0;
    const testVar = 33;

    // Act
    myVar = castOrNull<int>(testVar);

    // Assert
    expect(myVar, testVar);
  });

  test('Cast int passing wrong type', () {
    // Arrange
    int? myVar = 0;
    const testVar = '33';

    // Act
    myVar = castOrNull<int>(testVar);

    // Assert
    expect(myVar, null);
  });

  test('Cast double succefull', () {
    // Arrange
    double? myVar = 0.0;
    const testVar = 33.0;

    // Act
    myVar = castOrNull<double>(testVar);

    // Assert
    expect(myVar, testVar);
  });

  test('Cast double passing wrong type', () {
    // Arrange
    double? myVar = 0;
    const testVar = 33;

    // Act
    myVar = castOrNull<double>(testVar);

    // Assert
    expect(myVar, null);
  });

  test('Cast bool succefull', () {
    // Arrange
    bool? myVar = false;
    const testVar = true;

    // Act
    myVar = castOrNull<bool>(testVar);

    // Assert
    expect(myVar, testVar);
  });

  test('Cast bool passing wrong type', () {
    // Arrange
    bool? myVar = false;
    const testVar = 1;

    // Act
    myVar = castOrNull<bool>(testVar);

    // Assert
    expect(myVar, null);
  });

  test('logs warning with expected type, received type and value on cast failure', () {
    // Act
    castOrNull<String>(42);

    // Assert
    expect(loggerSpy.currentLevel, Level.warning);
    expect(
      loggerSpy.loggedMessage,
      contains('String'),
      reason: 'should mention the expected type',
    );
    expect(
      loggerSpy.loggedMessage,
      contains('int'),
      reason: 'should mention the received type',
    );
    expect(
      loggerSpy.loggedMessage,
      contains('42'),
      reason: 'should include the received value',
    );
  });

  test('does not log warning when value is null', () {
    // Act
    castOrNull<String>(null);

    // Assert
    expect(loggerSpy.loggedMessage, isNull);
  });
}
