import 'package:intl/intl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/constants/regex.dart';
import 'package:solfacil_tools_sdk/extensions/string_extensions.dart';

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

  test('Valid cpf', () {
    // Given
    const cpf = '01234567890';

    // When
    final isValid = cpf.isValidCPF;

    // Then
    expect(isValid, true);
  });

  test('Valid cpf with masks', () {
    // Given
    const cpf = '012.345.678-90';

    // When
    final isValid = cpf.isValidCPF;

    // Then
    expect(isValid, true);
  });

  test('Valid cpf passing empty text', () {
    // Given
    const cpf = '';

    // When
    final isValid = cpf.isValidCPF;

    // Then
    expect(isValid, false);
  });

  test('Valid cpf passing equal digits', () {
    // Given
    const cpf = '11111111111';

    // When
    final isValid = cpf.isValidCPF;

    // Then
    expect(isValid, false);
  });

  test('Valid cpf passing wrong cpf', () {
    // Given
    const cpf = '12345567890';

    // When
    final isValid = cpf.isValidCPF;

    // Then
    expect(isValid, false);
  });

  test('Valid cnpj', () {
    // Given
    const cpf = '54854501000164';

    // When
    final isValid = cpf.isValidCNPJ;

    // Then
    expect(isValid, true);
  });

  test('Valid cnpj with masks', () {
    // Given
    const cpf = '23.033.952/0001-07';

    // When
    final isValid = cpf.isValidCNPJ;

    // Then
    expect(isValid, true);
  });

  test('Valid cnpj passing empty text', () {
    // Given
    const cpf = '';

    // When
    final isValid = cpf.isValidCNPJ;

    // Then
    expect(isValid, false);
  });

  test('Valid cnpj passing equal digits', () {
    // Given
    const cpf = '11111111111111';

    // When
    final isValid = cpf.isValidCNPJ;

    // Then
    expect(isValid, false);
  });

  test('Valid cnpj passing wrong cnpj', () {
    // Given
    const cpf = '54854501000165';

    // When
    final isValid = cpf.isValidCNPJ;

    // Then
    expect(isValid, false);
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
}
