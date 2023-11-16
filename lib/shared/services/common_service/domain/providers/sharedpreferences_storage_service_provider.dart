
import 'package:flutter_architecture/shared/services/common_service/data/repositories/local/shared_prefs_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageServiceProvider = Provider((ref) {
  final SharedPrefsRepositoryImpl prefsService = SharedPrefsRepositoryImpl();
  prefsService.init();
  return prefsService;
});
