import 'package:flutter_architecture/features/authentication/domain/providers/login_provider.dart';
import 'package:flutter_architecture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_architecture/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_architecture/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_architecture/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_architecture/shared/domain/models/user/user_model.dart';
import 'package:flutter_architecture/shared/exceptions/http_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {

  late final AuthenticationRepository authRepository;
  late final UserRepository userRepository;
  
  @override
  AuthState build() {
    // ref.onDispose(() { })
    // state = const AsyncValue.data(AuthState.initial());
    authRepository = ref.watch(authRepositoryProvider);
    userRepository = ref.watch(userLocalRepositoryProvider);
    return const AuthState.initial();
  }

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await authRepository.loginUser(
      user: User(username: username, password: password),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        final hasSavedUser = await userRepository.saveUser(user: user);
        if (hasSavedUser) {
          return const AuthState.success();
        }
        return AuthState.failure(CacheFailureException());
      },
    );

    // refresh state
    // ref.invalidateSelf();
    // await future;
    // Updating the local cache manually
    // final previousState = await this.Future;
    // state = AsyncData([...previousState, todo]);
  }
}
