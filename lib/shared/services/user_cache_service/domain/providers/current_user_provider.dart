import 'package:flutter_architecture/shared/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_architecture/shared/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@riverpod
Future<User?> currentUser(CurrentUserRef ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = (await repository.fetchUser());

  return eitherType.fold((l) => null, (r) => r);
}
