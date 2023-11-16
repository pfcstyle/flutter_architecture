import 'package:flutter_architecture/shared/services/common_service/domain/repositories/network_repository.dart';
import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/models.dart';
import 'package:flutter_architecture/shared/exceptions/http_exception.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, User>> loginUser({required User user});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkRepository networkService;

  LoginUserRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, User>> loginUser({required User user}) async {
    try {
      final eitherType = await networkService.post(
        '/auth/login',
        data: user.toJson(),
      );
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          final user = User.fromJson(response.data);
          // update the token for requests
          networkService.updateHeader(
            {'Authorization': user.token},
          );

          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}
