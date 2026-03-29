import '../../logger.dart';

T? castOrNull<T>(dynamic value) {
  if (value == null) return null;
  try {
    return value;
  } catch (e) {
    final errorPath = StackTrace.current.toString().split('\n')[1];
    LogManager.shared.logWarning('Cast error: $e | $errorPath');
    return null;
  }
}
