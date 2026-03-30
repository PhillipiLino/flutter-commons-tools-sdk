import '../log/logger.dart';

T? castOrNull<T>(dynamic value) {
  if (value == null) return null;
  if (value is T) return value;
  LogManager.shared.logWarning(
    'castOrNull failed: expected $T, received ${value.runtimeType} ($value)',
  );
  return null;
}
