part of commons_tools_sdk;

class YearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    int value = newValue.selection.baseOffset == 0
        ? 0
        : int.parse(newValue.text.onlyDigits());
    final formatter = NumberFormat(null, 'pt_Br');
    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText == '1' ? '$newText ano' : '$newText anos',
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
