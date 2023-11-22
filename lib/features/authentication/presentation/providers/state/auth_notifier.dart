import 'package:flutter_architecture/features/authentication/domain/providers/login_provider.dart';
import 'package:flutter_architecture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_architecture/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:flutter_architecture/shared/services/user_cache_service/domain/repositories/user_cache_repository.dart';
import 'package:flutter_architecture/shared/models/user/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {

  late final AuthenticationRepository _authRepository;
  late final UserRepository _userRepository;
  
  @override
  AuthState build() {
    // ref.onDispose(() { })
    // state = const AsyncValue.data(AuthState.initial());
    _authRepository = ref.watch(authRepositoryProvider);
    _userRepository = ref.watch(userLocalRepositoryProvider);
    return const AuthState.initial();
  }

  Future<void> loginUser(String username, String password) async {
    state = const AuthState.loading();
    final response = await _authRepository.loginUser(
      user: User(username: username, password: password),
    );

    state = await response.fold(
      (failure) => AuthState.failure(failure),
      (user) async {
        final hasSavedUser = await _userRepository.saveUser(user: user);
        if (hasSavedUser) {
          return const AuthState.success();
        }
        return AuthState.failure(GlobalExceptions.cacheFailureException());
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
