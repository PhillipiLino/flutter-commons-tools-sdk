part of 'input_formatters.dart';

class PercentInputFormatter extends NumberInputFormatter {
  PercentInputFormatter({
    super.withDecimals = false,
    super.allowNegative = false,
  }) : super(suffix: '%');
}
