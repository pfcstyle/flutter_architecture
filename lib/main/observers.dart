import 'package:flutter_architecture/main/log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    Log.v('Provider ${provider.name ?? provider.runtimeType} was initialized with $value');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Log.v('Provider ${provider.name ?? provider.runtimeType} updated from $previousValue to $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    Log.v('Provider ${provider.name ?? provider.runtimeType} was disposed');
    super.didDisposeProvider(provider, container);
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    Log.v('Provider ${provider.name ?? provider.runtimeType} threw $error at $stackTrace');
  }
}
