part of commons_tools_sdk;

@Deprecated('Use NumberInputFormatter with suffix')
class KwhInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int value = newValue.selection.baseOffset == 0
        ? 0
        : int.parse(newValue.text.onlyDigits());

    final formatter = NumberFormat(null, 'pt_Br');
    String newText = formatter.format(value);

    return newValue.copyWith(
        text: '$newText kWh',
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
