import 'package:flutter_architecture/shared/domain/models/either.dart';
import 'package:flutter_architecture/shared/domain/models/models.dart';
import 'package:flutter_architecture/shared/exceptions/http_exception.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> fetchUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
