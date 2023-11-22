import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/response.dart';

class AppException extends Equatable implements Exception {
  final String? message;
  final int? statusCode;
  final String? identifier;

  const AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
  
  @override
  List<Object?> get props => [statusCode, identifier, message];
}

class GlobalExceptions{
  static AppException cacheFailureException({String? message}) => AppException(message: message ?? 'Unable to save to cache', statusCode: 100, identifier: 'Cache failure exception');
}

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}
