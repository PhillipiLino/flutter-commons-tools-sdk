part of solfacil_tools_sdk;

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int value = newValue.selection.baseOffset == 0
        ? 0
        : int.parse(newValue.text.onlyDigits());

    final formatter = NumberFormat(null, 'pt_Br');
    String formattedValue = formatter.format(value);
    String newText = 'R\$ $formattedValue';

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
