import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/models.dart';
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, User>> loginUser({required User user});
}
