part of commons_tools_sdk;

class NumberInputFormatter extends TextInputFormatter {
  final String suffix;
  final bool withDecimals;
  final bool allowNegative;

  NumberInputFormatter({
    this.suffix = '',
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

    if (withDecimals) value = value / 100.0;
    if (value == 0 || !allowNegative) isNegative = false;

    final preffix = isNegative ? '-' : '';
    final suffixSize = suffix.isEmpty ? 0 : suffix.length + 1;

    String newText = value.toLocale(showDecimals: withDecimals);
    newText = suffix.isEmpty ? '$preffix$newText' : '$preffix$newText $suffix';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length - suffixSize),
    );
  }
}
