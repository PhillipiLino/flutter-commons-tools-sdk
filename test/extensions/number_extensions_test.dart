import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:commons_tools_sdk/src/commons_tools_sdk.dart';

main() {
  test('Value to currency', () {
    // Given
    const value = 2300.12;
    final currencyFormatter = NumberFormat.simpleCurrency(locale: 'pt_Br');
    final formatterSymbol = currencyFormatter.currencySymbol;

    // When
    final formattedValue = value.toCurrency();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '$formatterSymbol 2.300,12');
  });

  test('Value to currency passing null', () {
    // Given
    const int? value = null;
    final currencyFormatter = NumberFormat.simpleCurrency(locale: 'pt_Br');
    final formatterSymbol = currencyFormatter.currencySymbol;

    // When
    final formattedValue = value.toCurrency();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '$formatterSymbol 0,00');
  });

  test('Value to currency without cents', () {
    // Given
    const value = 2300.12;
    final currencyFormatter = NumberFormat.simpleCurrency(locale: 'pt_Br');
    final formatterSymbol = currencyFormatter.currencySymbol;

    // When
    final formattedValue = value.toCurrency(showDecimals: false);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '$formatterSymbol 2.300');
  });

  test('Value to currency with different locale', () {
    // Given
    const locale = 'en_US';
    const value = 230.12;
    final currencyFormatter = NumberFormat.simpleCurrency(locale: locale);
    final formatterSymbol = currencyFormatter.currencySymbol;

    // When
    final formattedValue =
        value.toCurrency(locale: locale, showDecimals: false);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '${formatterSymbol}230');
  });

  test('Value to locale', () {
    // Given
    const value = 2300.12;

    // When
    final formattedValue = value.toLocale();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '2.300,12');
  });

  test('Value to locale passing null', () {
    // Given
    const int? value = null;

    // When
    final formattedValue = value.toLocale();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '0,00');
  });

  test('Value to locale without decimals', () {
    // Given
    const value = 2300.12;

    // When
    final formattedValue = value.toLocale(showDecimals: false);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '2.300');
  });

  test('Value to locale with different locale', () {
    // Given
    const locale = 'en_US';
    const value = 230.12;

    // When
    final formattedValue = value.toLocale(locale: locale, showDecimals: false);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '230');
  });

  test('Value to percent', () {
    // Given
    const value = 0.9;

    // When
    final formattedValue = value.toPercent();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '0,90 %');
  });

  test('Value to percent without decimals', () {
    // Given
    const value = 1.90;

    // When
    final formattedValue = value.toPercent(showDecimals: false);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '1 %');
  });

  test('Value to percent passing null', () {
    // Given
    const int? value = null;

    // When
    final formattedValue = value.toPercent();

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '0,00 %');
  });

  test('Value to percent with different locale', () {
    // Given
    const locale = 'en_US';
    const value = 0.23;

    // When
    final formattedValue = value.toPercent(locale: locale);

    // Then
    expect(formattedValue, isA<String>());
    expect(formattedValue, '0.23 %');
  });
}
