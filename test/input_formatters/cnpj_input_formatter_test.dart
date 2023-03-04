import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  test('Format complete cnpj', () {
    // Given
    const text = '88892128000158';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '88.892.128/0001-58';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 3 numbers', () {
    // Given
    const text = '111';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.1';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 5 numbers', () {
    // Given
    const text = '11222';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.222';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 6 numbers', () {
    // Given
    const text = '111222';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.122.2';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 8 numbers', () {
    // Given
    const text = '11122233';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.122.233';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 9 numbers', () {
    // Given
    const text = '111222333';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.122.233/3';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with 13 numbers', () {
    // Given
    const text = '1112223334444';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '11.122.233/3444-4';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cnpj with empty text', () {
    // Given
    const text = '';
    final formatter = CNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '';

    // Then
    expect(result.text, expectedResult);
  });
}
