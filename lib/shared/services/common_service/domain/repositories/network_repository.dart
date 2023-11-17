import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/response.dart';
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';

abstract class NetworkRepository {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
