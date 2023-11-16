import 'package:flutter_architecture/features/authentication/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_architecture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_architecture/features/authentication/data/repositories/atuhentication_repository_impl.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/network_repository.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/providers/dio_network_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
LoginUserRemoteDataSource authdataSource(AuthdataSourceRef ref, NetworkRepository networkService){
  return LoginUserRemoteDataSource(networkService);
}

@riverpod
AuthenticationRepository authRepository(AuthRepositoryRef ref){
  final NetworkRepository networkService = ref.watch(netwokServiceProvider);
  final LoginUserDataSource dataSource =
      ref.watch(authdataSourceProvider(networkService));
  return AuthenticationRepositoryImpl(dataSource);
}
