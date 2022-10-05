import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters.dart';

main() {
  test('Format complete phone number', () {
    // Given
    const text = '11999999999';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '(11) 99999-9999';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format phone number with 2 numbers', () {
    // Given
    const text = '11';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format phone number with 3 numbers', () {
    // Given
    const text = '119';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '(11) 9';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format phone number with 7 numbers', () {
    // Given
    const text = '1199999';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '(11) 99999';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format phone number with 8 numbers', () {
    // Given
    const text = '11999999';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '(11) 99999-9';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format phone number with empty text', () {
    // Given
    const text = '';
    final formatter = PhoneInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '';

    // Then
    expect(result.text, expectedResult);
  });
}
