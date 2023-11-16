import 'package:flutter_architecture/shared/services/common_service/domain/providers/dio_network_service_provider.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/network_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dioNetwokServiceProvider is a NetworkService', () {
    final providerContainer = ProviderContainer();

    addTearDown(providerContainer.dispose);

    expect(
      providerContainer.read(netwokServiceProvider),
      isA<NetworkRepository>(),
    );
  });
}
