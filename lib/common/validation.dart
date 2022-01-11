class NullResponseException implements Exception {
  final String message;

  @override
  String toString() => message;

  NullResponseException({this.message = "NullResponseException"});
}

class DomainValidationException implements Exception {
  final String message;

  @override
  String toString() => message;

  DomainValidationException({this.message = "DomainValidationException"});
}

class NetworkException implements Exception {
  final String message;

  @override
  String toString() => message;

  NetworkException({this.message = "NetworkException"});
}

T validateNotNull<T>(String message, T? value) {
  if (value == null) throw DomainValidationException(message: message);
  return value;
}
