part of commons_tools_sdk;

class CurrencyInputFormatter extends TextInputFormatter {
  final bool withDecimals;
  final bool allowNegative;

  CurrencyInputFormatter({
    this.withDecimals = false,
    this.allowNegative = false,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    bool isNegative = newValue.text.contains('-');
    final digitsText = newValue.text.onlyDigits();

    final baseOffset = newValue.selection.baseOffset;
    final showZero = baseOffset == 0 && digitsText.isEmpty;
    num value = showZero ? 0 : int.parse(digitsText);

    if (withDecimals) value = value / 100;
    if (value == 0 || !allowNegative) isNegative = false;

    final preffix = isNegative ? '-' : '';
    String newText = value.toCurrency(showDecimals: withDecimals);
    newText = '$preffix$newText';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
