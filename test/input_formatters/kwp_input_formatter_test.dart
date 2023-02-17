// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters.dart';

main() {
  test('Format kwp with 12', () {
    // Given
    const text = '123';
    final formatter = KwpInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1,23 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwp with 120', () {
    // Given
    const text = '120';
    final formatter = KwpInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1,20 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwp with 1200', () {
    // Given
    const text = '1200';
    final formatter = KwpInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '12,00 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format kwp with 120000', () {
    // Given
    const text = '120000';
    final formatter = KwpInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1.200,00 kWp';

    // Then
    expect(result.text, expectedResult);
  });
}
