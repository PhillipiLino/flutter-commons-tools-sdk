import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters/date_input_formatter.dart';

main() {
  test('Format complete date', () {
    // Given
    const text = '01022022';
    final formatter = DateInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '01/02/2022';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format date with 3 numbers', () {
    // Given
    const text = '010';
    final formatter = DateInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '01/0';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format date with 5 numbers', () {
    // Given
    const text = '01022';
    final formatter = DateInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '01/02/2';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format date with 7 numbers', () {
    // Given
    const text = '0102202';
    final formatter = DateInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '01/02/202';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format date with empty text', () {
    // Given
    const text = '';
    final formatter = DateInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '';

    // Then
    expect(result.text, expectedResult);
  });
}
