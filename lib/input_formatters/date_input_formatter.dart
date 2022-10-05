import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (text.length < 3) {
      final selection = TextSelection.collapsed(offset: text.length);
      return newValue.copyWith(text: text, selection: selection);
    }

    final partOne = text.substring(0, 2);
    final partTwoLimit = text.length >= 4 ? 4 : text.length;
    final partTwo = text.length >= 2 ? text.substring(2, partTwoLimit) : '';
    final partThree = text.length >= 4 ? text.substring(4, text.length) : '';

    final firstDivider = partTwo.isEmpty ? '' : '/';
    final secondDivider = partThree.isEmpty ? '' : '/';

    final newText = [
      partOne,
      firstDivider,
      partTwo,
      secondDivider,
      partThree,
    ].join();

    final selection = TextSelection.collapsed(offset: newText.length);

    return newValue.copyWith(text: newText, selection: selection);
  }
}
