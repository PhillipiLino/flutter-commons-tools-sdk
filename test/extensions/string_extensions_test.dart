import 'package:intl/intl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/src/constants/regex.dart';
import 'package:solfacil_tools_sdk/src/extensions/string_extensions.dart';

main() {
  test('Valid email', () {
    // Given
    const email = 'test@test.com';

    // When
    final isValid = email.isValidEmail;

    // Then
    expect(isValid, true);
  });

  test('Valid email with empty text', () {
    // Given
    const email = '';

    // When
    final isValid = email.isValidEmail;

    // Then
    expect(isValid, false);
  });

  test('Valid email with text without @', () {
    // Given
    const email = 'teste_test.com';

    // When
    final isValid = email.isValidEmail;

    // Then
    expect(isValid, false);
  });

  test('Valid phone number', () {
    // Given
    const phone = '(11) 11111-1111';

    // When
    final isValid = phone.isValidPhoneNumber;

    // Then
    expect(isValid, true);
  });

  test('Valid phone number with empty text', () {
    // Given
    const phone = '';

    // When
    final isValid = phone.isValidPhoneNumber;

    // Then
    expect(isValid, false);
  });

  test('Valid phone number with text without masks', () {
    // Given
    const email = '11999999999';

    // When
    final isValid = email.isValidPhoneNumber;

    // Then
    expect(isValid, false);
  });

  test('Valid date with /', () {
    // Given
    const date = '18/04/1995';

    // When
    final isValid = date.isValidDate;

    // Then
    expect(isValid, isTrue);
  });

  test('Valid date with .', () {
    // Given
    const date = '18.04.1995';

    // When
    final isValid = date.isValidDate;

    // Then
    expect(isValid, isTrue);
  });

  test('Valid date with -', () {
    // Given
    const date = '18-04-1995';

    // When
    final isValid = date.isValidDate;

    // Then
    expect(isValid, isTrue);
  });

  test('Valid date with format yyyy-MM-dd', () {
    // Given
    const date = '1995-04-18';

    // When
    final isValid = date.isValidDate;

    // Then
    expect(isValid, isFalse);
  });

  test('Match regex', () {
    // Given
    const textToCompare = 'email@test.com';
    const regex = emailRegex;

    // When
    final result = textToCompare.matchRegex(regex);

    // Then
    expect(result, true);
  });

  test('Match invalid regex', () {
    // Given
    const textToCompare = 'email@test.com';
    const regex = 'EMAIL_REGEX';

    // When
    final result = textToCompare.matchRegex(regex);

    // Then
    expect(result, false);
  });

  test('Get value from formatted currency text', () {
    // Given
    const text = 'R\$ 45,00';

    // When
    final result = text.fromCurrency();

    // Then
    expect(result, 45);
  });

  test('Get value from formatted currency text with cents', () {
    // Given
    const text = 'R\$ 45,77';

    // When
    final result = text.fromCurrency();

    // Then
    expect(result, 45.77);
  });

  test('Get value from null text', () {
    // Given
    const String? text = null;

    // When
    final result = text.fromCurrency();

    // Then
    expect(result, 0);
  });

  test('Get value from different locale', () {
    // Given
    const locale = 'en_US';
    const value = 230.12;
    final currencyFormatter = NumberFormat.simpleCurrency(locale: locale);
    final formatterSymbol = currencyFormatter.currencySymbol;
    final text = '$formatterSymbol$value';

    // When
    final result = text.fromCurrency(locale);

    // Then
    expect(result, 230.12);
  });

  test('Remove diacritics', () {
    // Given
    const text =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';

    // When
    final result = text.removeDiacritics();
    const expectedResult =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    // Then
    expect(expectedResult, result);
  });

  test('Capitalize text', () {
    // Arrange
    const text = 'testing capitalize function';

    // Act
    final capitalized = text.toCapitalized();

    // Assert
    expect(capitalized, 'Testing capitalize function');
  });

  test('Capitalize text with number as first', () {
    // Arrange
    const text = '1 testing capitalize function';

    // Act
    final capitalized = text.toCapitalized();

    // Assert
    expect(capitalized, '1 testing capitalize function');
  });

  test('Text to title case', () {
    // Arrange
    const text = 'testing to title case function';

    // Act
    final capitalized = text.toTitleCase;

    // Assert
    expect(capitalized, 'Testing To Title Case Function');
  });
}
