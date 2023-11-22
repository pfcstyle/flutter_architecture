import 'package:flutter_architecture/shared/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
Future<bool> userLoginCheck(UserLoginCheckRef ref) async {
  final repo = ref.watch(userLocalRepositoryProvider);
  return await repo.hasUser();
}
