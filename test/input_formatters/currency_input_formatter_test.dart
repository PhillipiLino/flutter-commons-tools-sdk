import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

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

  test('Format currency with decimals and value 1234', () {
    //Given
    const text = '1234';
    final formatter = CurrencyInputFormatter(withDecimals: true);

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 12,34';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format currency with decimals and value 123', () {
    //Given
    const text = '123';
    final formatter = CurrencyInputFormatter(withDecimals: true);

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 1,23';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format currency with decimals and value 12', () {
    //Given
    const text = '12';
    final formatter = CurrencyInputFormatter(withDecimals: true);

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 0,12';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format currency with decimals and value 123400', () {
    //Given
    const text = '123400';
    final formatter = CurrencyInputFormatter(withDecimals: true);

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 1.234,00';

    //Then
    expect(result.text, expectedResult);
  });
}
