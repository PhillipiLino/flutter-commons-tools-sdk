// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/input_formatters.dart';

main() {
  final formatter = DoublePercentInputFormatter();

  test('Format DoublePercent with 12.34', () {
    //Given
    const text = '12.34';

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    //Then
    expect(result.text, '12,34 %');
  });

  test('Format DoublePercent with 123', () {
    //Given
    const text = '1.23';

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    //Then
    expect(result.text, '1,23 %');
  });

  test('Format DoublePercent with 12', () {
    //Given
    const text = '12';

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    //Then
    expect(result.text, '0,12 %');
  });

  test('Format DoublePercent with 12.00', () {
    //Given
    const text = '12.00';

    //When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    //Then
    expect(result.text, '12,00 %');
  });
}
