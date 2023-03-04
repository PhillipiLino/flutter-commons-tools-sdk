import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  test('Format complete cpf', () {
    // Given
    const text = '01234567890';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '012.345.678-90';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 3 numbers', () {
    // Given
    const text = '111';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 4 numbers', () {
    // Given
    const text = '1112';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111.2';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 6 numbers', () {
    // Given
    const text = '111222';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111.222';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 7 numbers', () {
    // Given
    const text = '1112223';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111.222.3';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 9 numbers', () {
    // Given
    const text = '111222333';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111.222.333';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with 10 numbers', () {
    // Given
    const text = '1112223334';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '111.222.333-4';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format cpf with empty text', () {
    // Given
    const text = '';
    final formatter = CPFInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '';

    // Then
    expect(result.text, expectedResult);
  });
}
