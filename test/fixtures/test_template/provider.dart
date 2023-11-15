
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/provider_test.dart';

class MyNotifier extends Notifier<int> {
  @override
  int build() => throw UnimplementedError();
}

// Your mock needs to subclass the Notifier base-class corresponding
// to whatever your notifier uses
class MyNotifierMock extends Notifier<int> with Mock implements MyNotifier {}

final exampleProvider = FutureProvider<String>((ref) async => 'Hello world');

// Reference https://riverpod.dev/docs/essentials/testing

void main() {
  test('Some description', () async {
    // Create a ProviderContainer for this test.
    // DO NOT share ProviderContainers between tests.
    // In unit tests, by reusing our previous "createContainer" utility.
    final container = createContainer(
      // We can specify a list of providers to mock:
      overrides: [
        // In this case, we are mocking "exampleProvider".
        exampleProvider.overrideWith((ref) {
          // This function is the typical initialization function of a provider.
          // This is where you normally call "ref.watch" and return the initial state.

          // Let's replace the default "Hello world" with a custom value.
          // Then, interacting with `exampleProvider` will return this value.
          return 'Hello from tests';
        }),
      ],
    );

    expect(
      container.read(exampleProvider),
      equals('Hello from tests'),
    );

    // Our expectation is asynchronous, so we should use "expectLater"
    await expectLater(
      // We read "provider.future" instead of "provider".
      // This is possible on asynchronous providers, and returns a future
      // which will resolve with the value of the provider.
      container.read(exampleProvider.future),
      // We can verify that the future resolves with the expected value.
      // Alternatively we can use "throwsA" for errors.
      completion('some value'),
    );

  });
}