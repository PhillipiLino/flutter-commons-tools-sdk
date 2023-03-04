part of commons_tools_sdk;

extension DocumentStringExtension on String? {
  bool get isValidCPF {
    if (this == null) return false;

    var numbers = this!.onlyDigits();

    if (numbers.length != 11) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    List<int> digits =
        numbers.split('').map((String d) => int.parse(d)).toList();

    int calcDv1 = 0;
    for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digits[10 - i] * i;
    }
    calcDv1 %= 11;
    var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    if (digits[9] != dv1) return false;

    var calcDv2 = 0;
    for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digits[11 - i] * i;
    }
    calcDv2 %= 11;
    var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digits[10] != dv2) return false;

    return true;
  }

  bool get isValidCNPJ {
    if (this == null) return false;

    var cleanText = this!.onlyDigits();
    if (cleanText.isEmpty) return false;
    if (cleanText.length != 14) return false;

    if (RegExp(r'^(\d)\1*$').hasMatch(cleanText)) return false;

    var dvSize = cleanText.length - 2;
    var numbers = cleanText.substring(0, dvSize);
    var digits = cleanText.substring(dvSize);
    var soma = 0;
    var pos = dvSize - 7;

    for (var i = dvSize; i >= 1; i--) {
      var currentNumber = int.tryParse(numbers[dvSize - i]) ?? 0;
      soma += currentNumber * pos--;
      if (pos < 2) pos = 9;
    }

    var result = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (result != (int.tryParse(digits[0]) ?? 0)) return false;

    dvSize = dvSize + 1;
    numbers = cleanText.substring(0, dvSize);
    soma = 0;
    pos = dvSize - 7;
    for (var i = dvSize; i >= 1; i--) {
      var currentNumber = int.tryParse(numbers[dvSize - i]) ?? 0;
      soma += currentNumber * pos--;
      if (pos < 2) pos = 9;
    }

    result = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (result != (int.tryParse(digits[1]) ?? 0)) return false;

    return true;
  }
}
