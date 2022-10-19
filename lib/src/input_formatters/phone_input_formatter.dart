part of solfacil_tools_sdk;

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.onlyDigits();
    if (text.length < 3) {
      final selection = TextSelection.collapsed(offset: text.length);
      return newValue.copyWith(text: text, selection: selection);
    }

    final ddd = text.substring(0, 2);
    final partOneLimit = text.length >= 8 ? 7 : text.length;
    final partOne = text.substring(2, partOneLimit);
    final partTwo = text.length >= 8 ? text.substring(7, text.length) : '';
    final divider = partTwo.isEmpty ? '' : '-';
    final newText = '($ddd) $partOne$divider$partTwo';
    final selection = TextSelection.collapsed(offset: newText.length);

    return newValue.copyWith(text: newText, selection: selection);
  }
}
