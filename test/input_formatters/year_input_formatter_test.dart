import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/input_formatters.dart';

main() {
  final formatter = YearInputFormatter();

  test('Format year with 1', () {
    // Given
    const text = '1';

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    // Then
    expect(result.text, '1 ano');
  });
  test('Format year with 2', () {
    // Given
    const text = '2';

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    // Then
    expect(result.text, '2 anos');
  });
  test('Format year with 100', () {
    // Given
    const text = '100';

    // When
    final result = formatter.formatEditUpdate(
        TextEditingValue.empty, const TextEditingValue(text: text));

    // Then
    expect(result.text, '100 anos');
  });
}
