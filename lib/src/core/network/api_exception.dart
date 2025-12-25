abstract class ApiException implements Exception {
  final String? message;
  final String prefix;

  ApiException(this.message, this.prefix);

  @override
  String toString() => message != null ? '$prefix: $message' : prefix;
}

class EmptyResultApiException extends ApiException {
  EmptyResultApiException() : super(null, 'No Data');
}

class BadRequestException extends ApiException {
  BadRequestException(String? message) : super(message, 'Invalid Request');
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(String? message) : super(message, 'Unauthorised');
}

class FetchDataException extends ApiException {
  FetchDataException(String? message) : super(message, 'Error During Communication');
}

class NotFoundException extends ApiException {
  NotFoundException(String? message) : super(message, 'Not Found');
}

class ConnectionException extends ApiException {
  ConnectionException(String? message) : super(message, 'Connection Error');
}

class BadResponseException extends ApiException {
  BadResponseException(dynamic message) : super(message, 'Bad Response');
}
