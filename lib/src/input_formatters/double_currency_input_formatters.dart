part of solfacil_tools_sdk;

class DoubleCurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
      double value =
          newValue.selection.baseOffset == 0.0 ? 0.0: double.parse(newValue.text);


    final formatter = NumberFormat("##.##", 'pt_Br');
    String formattedValue = formatter.format(value);
    String newText = 'R\$ $formattedValue';

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
