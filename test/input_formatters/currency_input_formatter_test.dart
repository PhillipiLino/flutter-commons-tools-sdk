import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters.dart';

main() {
  test('Format currency with 12', () {
    // Given
    const text = '12';
    final formatter = CurrencyInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 12';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format currency with 120', () {
    // Given
    const text = '120';
    final formatter = CurrencyInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 120';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format currency with 1200', () {
    // Given
    const text = '1200';
    final formatter = CurrencyInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 1.200';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format currency with 120000', () {
    // Given
    const text = '120000';
    final formatter = CurrencyInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 120.000';

    // Then
    expect(result.text, expectedResult);
  });
}
