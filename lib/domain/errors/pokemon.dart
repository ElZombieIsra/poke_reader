import 'package:equatable/equatable.dart';

class PokeException extends Equatable implements Exception {
  final String message;
  final int errorCode;

  PokeException(
    this.message, {
    this.errorCode,
  });

  @override
  List<Object> get props => [
        message,
        errorCode,
      ];

  @override
  bool get stringify => true;

  /// Returns a human readable representation of the error
  String get toMessage {
    String _message = message;
    if (errorCode != null) _message += ". Error code: $errorCode";
    return _message;
  }
}
