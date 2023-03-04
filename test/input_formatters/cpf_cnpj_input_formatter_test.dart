import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  test('Format complete cpf', () {
    // Given
    const text = '12345678901';
    final formatter = CPFAndCNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '123.456.789-01';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format complete cnpj', () {
    // Given
    const text = '88892128000158';
    final formatter = CPFAndCNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '88.892.128/0001-58';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format document with 11 numbers', () {
    // Given
    const text = '88892128000';
    final formatter = CPFAndCNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '888.921.280-00';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format document with 12 numbers', () {
    // Given
    const text = '888921280001';
    final formatter = CPFAndCNPJInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '88.892.128/0001';

    // Then
    expect(result.text, expectedResult);
  });
}
