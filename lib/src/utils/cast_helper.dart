T? castOrNull<T>(dynamic value) {
  if (value == null) return null;
  return value is T ? value : null;
}
