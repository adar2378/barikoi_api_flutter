class OutSideDhakaException implements Exception {
  String message;
  OutSideDhakaException(this.message);
  String toString() {
    String result = "OutSideDhakaException";
    if (message != null) result = "$result: $message";
    return result;
  }
}

class LimitExceededException implements Exception {
  String message;
  LimitExceededException(this.message);
  String toString() {
    String result = "LimitExceededException";
    if (message != null) result = "$result: $message";
    return result;
  }
}

class NotFoundException implements Exception {
  String message;
  NotFoundException(this.message);
  String toString() {
    String result = "NotFoundException";
    if (message != null) result = "$result: $message";
    return result;
  }
}
