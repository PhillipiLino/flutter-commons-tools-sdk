part of solfacil_tools_sdk;

class CNPJInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length < 3) {
      final selection = TextSelection.collapsed(offset: text.length);
      return newValue.copyWith(text: text, selection: selection);
    }

    final partOne = text.substring(0, 2);
    final partTwoLimit = text.length >= 5 ? 5 : text.length;
    final partTwo = text.length >= 2 ? text.substring(2, partTwoLimit) : '';
    final partThreeLimit = text.length >= 8 ? 8 : text.length;
    final partThree = text.length >= 5 ? text.substring(5, partThreeLimit) : '';
    final partFourlimit = text.length >= 12 ? 12 : text.length;
    final partFour = text.length >= 8 ? text.substring(8, partFourlimit) : '';
    final partFive = text.length >= 12 ? text.substring(12, text.length) : '';

    final firstDivider = partTwo.isEmpty ? '' : '.';
    final secondDivider = partThree.isEmpty ? '' : '.';
    final thirtyDivider = partFour.isEmpty ? '' : '/';
    final fourtyDivider = partFive.isEmpty ? '' : '-';

    final newText = [
      partOne,
      firstDivider,
      partTwo,
      secondDivider,
      partThree,
      thirtyDivider,
      partFour,
      fourtyDivider,
      partFive
    ].join();

    final selection = TextSelection.collapsed(offset: newText.length);

    return newValue.copyWith(text: newText, selection: selection);
  }
}
