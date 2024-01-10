part of commons_tools_sdk;

class CPFInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length < 4) {
      final selection = TextSelection.collapsed(offset: text.length);
      return newValue.copyWith(text: text, selection: selection);
    }

    final partOne = text.substring(0, 3);
    final partTwoLimit = text.length >= 6 ? 6 : text.length;
    final partTwo = text.length >= 3 ? text.substring(3, partTwoLimit) : '';
    final partThreeLimit = text.length >= 9 ? 9 : text.length;
    final partThree = text.length >= 6 ? text.substring(6, partThreeLimit) : '';
    final partFour = text.length >= 9 ? text.substring(9, text.length) : '';

    final firstDivider = partTwo.isEmpty ? '' : '.';
    final secondDivider = partThree.isEmpty ? '' : '.';
    final thirtyDivider = partFour.isEmpty ? '' : '-';
    final newText =
        '$partOne$firstDivider$partTwo$secondDivider$partThree$thirtyDivider$partFour';
    final selection = TextSelection.collapsed(offset: newText.length);

    return newValue.copyWith(text: newText, selection: selection);
  }
}
