import 'package:flutter_test/flutter_test.dart';
import 'package:commons_tools_sdk/src/commons_tools_sdk.dart';

main() {
  test('Test debouncer', () async {
    // Given
    bool test = false;
    final debouncer = Debouncer(milliseconds: 1000);

    // When
    debouncer.run(() => test = true);

    // Then
    expect(test, isFalse);
    await Future.delayed(const Duration(milliseconds: 300));
    expect(test, isFalse);
    await Future.delayed(const Duration(milliseconds: 700));
    expect(test, isTrue);
  });

  test('Test debouncer check value before time', () async {
    // Given
    bool test = false;
    final debouncer = Debouncer(milliseconds: 1000);

    // When
    debouncer.run(() => test = true);

    // Then
    expect(test, isFalse);
    await Future.delayed(const Duration(milliseconds: 300));
    expect(test, isFalse);
    await Future.delayed(const Duration(milliseconds: 600));
    expect(test, isFalse);
  });

  test('Test debouncer dispose', () async {
    // Given
    bool test = false;
    final debouncer = Debouncer(milliseconds: 300);

    // When
    debouncer.run(() => test = true);
    debouncer.dispose();

    // Then
    expect(test, isFalse);
    await Future.delayed(const Duration(milliseconds: 1000));
    expect(test, isFalse);
  });
}
