import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters.dart';

main() {
  test('Format percent with 1', () {
    // Given
    const text = '1';
    final formatter = PercentInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '1 %';

    // Then
    expect(result.text, expectedResult);
  });
  test('Format percent with 10', () {
    // Given
    const text = '10';
    final formatter = PercentInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '10 %';

    // Then
    expect(result.text, expectedResult);
  });
  test('Format percent with 100', () {
    // Given
    const text = '100';
    final formatter = PercentInputFormatter();

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));
    const expectedResult = '100 %';

    // Then
    expect(result.text, expectedResult);
  });
}
