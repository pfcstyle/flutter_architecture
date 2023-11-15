import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('Provider ${provider.name ?? provider.runtimeType} was initialized with $value');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('Provider ${provider.name ?? provider.runtimeType} updated from $previousValue to $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    log('Provider ${provider.name ?? provider.runtimeType} was disposed');
    super.didDisposeProvider(provider, container);
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log('Provider ${provider.name ?? provider.runtimeType} threw $error at $stackTrace');
  }
}
