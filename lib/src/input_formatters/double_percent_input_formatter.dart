part of solfacil_tools_sdk;

class DoublePercentInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    double value = newValue.selection.baseOffset == 0
        ? 0
        : int.parse(newValue.text.onlyDigits()) / 1 ;

    final formatter = NumberFormat.decimalPattern('pt_Br');
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    String newText = formatter.format(value);

    return newValue.copyWith(
        text: '$newText %',
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
