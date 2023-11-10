import 'package:flutter_architecture/shared/domain/models/either.dart';
import 'package:flutter_architecture/shared/domain/models/models.dart';
import 'package:flutter_architecture/shared/exceptions/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> loginUser({required User user});
}
