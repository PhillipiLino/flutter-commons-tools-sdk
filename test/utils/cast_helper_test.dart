import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/solfacil_tools_sdk.dart';

main() {
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
}
