import 'package:flutter_architecture/shared/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/data/repositories/user_repository_impl.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/storage_repository.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/providers/sharedpreferences_storage_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDatasourceProvider = Provider.family<UserDataSource, StorageRepository>(
  (_, networkService) => UserLocalDatasource(networkService),
);

final userLocalRepositoryProvider = Provider<UserRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(userDatasourceProvider(storageService));

  final respository = UserRepositoryImpl(datasource);

  return respository;
});
