class DomainValidationException implements Exception {
  final String message;

  @override
  String toString() => message;

  DomainValidationException(this.message);
}

T validateNotNull<T>(String message, T? value) {
  if (value == null) throw DomainValidationException(message);
  return value;
}
