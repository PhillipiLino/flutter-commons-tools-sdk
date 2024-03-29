// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  test('Format kwh with 12', () {
    // Given
    const text = '12';
    final formatter = KwhInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '12 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwh with 120', () {
    // Given
    const text = '120';
    final formatter = KwhInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '120 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwh with 1200', () {
    // Given
    const text = '1200';
    final formatter = KwhInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1.200 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwh with 120000', () {
    // Given
    const text = '120000';
    final formatter = KwhInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '120.000 kWh';

    // Then
    expect(result.text, expectedResult);
  });
}
