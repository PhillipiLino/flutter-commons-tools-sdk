part of commons_tools_sdk;

class CPFAndCNPJInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length < 12) {
      return CPFInputFormatter().formatEditUpdate(oldValue, newValue);
    }

    return CNPJInputFormatter().formatEditUpdate(oldValue, newValue);
  }
}
