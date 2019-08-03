/// if the coordinate is out of Dhaka, then this exeption will be thrown
class OutSideDhakaException implements Exception {
  String message;
  OutSideDhakaException(this.message);
  String toString() {
    String result = "OutSideDhakaException";
    if (message != null) result = "$result: $message";
    return result;
  }
}

/// if the limit is exceeded, then this exeption will be thrown
class LimitExceededException implements Exception {
  String message;
  LimitExceededException(this.message);
  String toString() {
    String result = "LimitExceededException";
    if (message != null) result = "$result: $message";
    return result;
  }
}

/// if the result is empty, then this exeption will be thrown
class NotFoundException implements Exception {
  String message;
  NotFoundException(this.message);
  String toString() {
    String result = "NotFoundException";
    if (message != null) result = "$result: $message";
    return result;
  }
}
