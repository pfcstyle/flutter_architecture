
import 'package:flutter_architecture/shared/services/common_service/data/repositories/local/shared_prefs_storage_repository_impl.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sharedpreferences_storage_service_provider.g.dart';

@riverpod
StorageRepository storageService(StorageServiceRef ref){
  final SharedPrefsRepositoryImpl prefsService = SharedPrefsRepositoryImpl();
  prefsService.init();
  return prefsService;
}
