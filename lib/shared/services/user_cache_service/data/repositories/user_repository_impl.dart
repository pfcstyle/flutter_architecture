import 'package:flutter_architecture/shared/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/user/user_model.dart';
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.dataSource);

  final UserDataSource dataSource;

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<Either<AppException, User>> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> saveUser({required User user}) {
    return dataSource.saveUser(user: user);
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }
}
