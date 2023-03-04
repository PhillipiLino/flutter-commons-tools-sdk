part of commons_tools_sdk;

class PercentInputFormatter extends NumberInputFormatter {
  PercentInputFormatter({
    super.withDecimals = false,
    super.allowNegative = false,
  }) : super(suffix: '%');
}
