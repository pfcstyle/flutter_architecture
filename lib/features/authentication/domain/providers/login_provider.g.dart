// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authdataSourceHash() => r'c0f91d319387a5de9f5c9e871b1eebd9803a3bc1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [authdataSource].
@ProviderFor(authdataSource)
const authdataSourceProvider = AuthdataSourceFamily();

/// See also [authdataSource].
class AuthdataSourceFamily extends Family<LoginUserRemoteDataSource> {
  /// See also [authdataSource].
  const AuthdataSourceFamily();

  /// See also [authdataSource].
  AuthdataSourceProvider call(
    NetworkRepository networkService,
  ) {
    return AuthdataSourceProvider(
      networkService,
    );
  }

  @override
  AuthdataSourceProvider getProviderOverride(
    covariant AuthdataSourceProvider provider,
  ) {
    return call(
      provider.networkService,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authdataSourceProvider';
}

/// See also [authdataSource].
class AuthdataSourceProvider
    extends AutoDisposeProvider<LoginUserRemoteDataSource> {
  /// See also [authdataSource].
  AuthdataSourceProvider(
    NetworkRepository networkService,
  ) : this._internal(
          (ref) => authdataSource(
            ref as AuthdataSourceRef,
            networkService,
          ),
          from: authdataSourceProvider,
          name: r'authdataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authdataSourceHash,
          dependencies: AuthdataSourceFamily._dependencies,
          allTransitiveDependencies:
              AuthdataSourceFamily._allTransitiveDependencies,
          networkService: networkService,
        );

  AuthdataSourceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.networkService,
  }) : super.internal();

  final NetworkRepository networkService;

  @override
  Override overrideWith(
    LoginUserRemoteDataSource Function(AuthdataSourceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AuthdataSourceProvider._internal(
        (ref) => create(ref as AuthdataSourceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        networkService: networkService,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<LoginUserRemoteDataSource> createElement() {
    return _AuthdataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthdataSourceProvider &&
        other.networkService == networkService;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, networkService.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AuthdataSourceRef on AutoDisposeProviderRef<LoginUserRemoteDataSource> {
  /// The parameter `networkService` of this provider.
  NetworkRepository get networkService;
}

class _AuthdataSourceProviderElement
    extends AutoDisposeProviderElement<LoginUserRemoteDataSource>
    with AuthdataSourceRef {
  _AuthdataSourceProviderElement(super.provider);

  @override
  NetworkRepository get networkService =>
      (origin as AuthdataSourceProvider).networkService;
}

String _$authRepositoryHash() => r'1efbc9a1b38615ceeaf937402def99e42122c22d';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider =
    AutoDisposeProvider<AuthenticationRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthenticationRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
