import 'package:flutter_architecture/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_architecture/shared/domain/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = FutureProvider<User?>((ref) async {
  final repository = ref.watch(userLocalRepositoryProvider);
  final eitherType = (await repository.fetchUser());

  return eitherType.fold((l) => null, (r) => r);
});
