import 'package:flutter_test/flutter_test.dart';
import 'package:solfacil_tools_sdk/src/solfacil_tools_sdk.dart';

main() {
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
}
