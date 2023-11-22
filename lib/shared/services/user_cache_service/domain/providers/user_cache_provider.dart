import 'package:flutter_architecture/shared/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/data/repositories/user_repository_impl.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/storage_repository.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/providers/sharedpreferences_storage_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_cache_provider.g.dart';

@riverpod
UserDataSource userDatasource(UserDatasourceRef ref, StorageRepository storageRepository){
  return UserLocalDatasource(storageRepository);
}

@riverpod
UserRepository userLocalRepository(UserLocalRepositoryRef ref){
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(userDatasourceProvider(storageService));

  final respository = UserRepositoryImpl(datasource);

  return respository;
}
