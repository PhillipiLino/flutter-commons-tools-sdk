// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  test('Format DoubleCurrency with 1234', () {
    //Given
    const text = '1234';
    final formatter = DoubleCurrencyInputFormatter();

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 12,34';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format DoubleCurrency with 123', () {
    //Given
    const text = '123';
    final formatter = DoubleCurrencyInputFormatter();

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 1,23';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format DoubleCurrency with 12', () {
    //Given
    const text = '12';
    final formatter = DoubleCurrencyInputFormatter();

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 0,12';

    //Then
    expect(result.text, expectedResult);
  });
  test('Format DoubleCurrency with 123400', () {
    //Given
    const text = '123400';
    final formatter = DoubleCurrencyInputFormatter();

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = 'R\$ 1.234,00';

    //Then
    expect(result.text, expectedResult);
  });
}
