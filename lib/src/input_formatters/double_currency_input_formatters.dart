part of solfacil_tools_sdk;

class DoubleCurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    double value = int.parse(newValue.text) / 100;
    
    final formatter = NumberFormat.decimalPattern('pt_Br');
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    String newText = value.toCurrency();

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
