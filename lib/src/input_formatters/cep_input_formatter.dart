part of 'input_formatters.dart';

class CEPInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.length < 5) {
      final selection = TextSelection.collapsed(offset: text.length);
      return newValue.copyWith(text: text, selection: selection);
    }

    final partOne = text.substring(0, 5);
    final partTwo = text.length >= 5 ? text.substring(5, text.length) : '';

    final firstDivider = partTwo.isEmpty ? '' : '-';

    final newText = '$partOne$firstDivider$partTwo';
    final selection = TextSelection.collapsed(offset: newText.length);

    return newValue.copyWith(text: newText, selection: selection);
  }
}
