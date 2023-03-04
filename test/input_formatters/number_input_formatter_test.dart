import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/src/input_formatters/input_formatters.dart';

main() {
  test('Format with suffix kwh, value 12', () {
    // Given
    const text = '12';
    final formatter = NumberInputFormatter(suffix: 'kWh');

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '12 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwh, value 120', () {
    // Given
    const text = '120';
    final formatter = NumberInputFormatter(suffix: 'kWh');

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '120 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwh, value 1200', () {
    // Given
    const text = '1200';
    final formatter = NumberInputFormatter(suffix: 'kWh');

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1.200 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwh, value 120000', () {
    // Given
    const text = '120000';
    final formatter = NumberInputFormatter(suffix: 'kWh');

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '120.000 kWh';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwp, value 12 and with decimals', () {
    // Given
    const text = '123';
    final formatter = NumberInputFormatter(suffix: 'kWp', withDecimals: true);

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1,23 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwp, value 120 and with decimals', () {
    // Given
    const text = '120';
    final formatter = NumberInputFormatter(suffix: 'kWp', withDecimals: true);

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1,20 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwp, value 1200 and with decimals', () {
    // Given
    const text = '1200';
    final formatter = NumberInputFormatter(suffix: 'kWp', withDecimals: true);

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '12,00 kWp';

    // Then
    expect(result.text, expectedResult);
  });

  test('Format with suffix kwp, value 120000 and with decimals', () {
    // Given
    const text = '120000';
    final formatter = NumberInputFormatter(suffix: 'kWp', withDecimals: true);

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1.200,00 kWp';

    // Then
    expect(result.text, expectedResult);
  });
}
