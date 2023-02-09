part of solfacil_tools_sdk;

class YearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formatter = NumberFormat(null, 'pt_Br');
    String newText = formatter.format(oldValue);

    return newValue.copyWith(
        text: oldValue.text == '1'
            ? newText = '$newText ano'
            : newText = '$newText anos',
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
