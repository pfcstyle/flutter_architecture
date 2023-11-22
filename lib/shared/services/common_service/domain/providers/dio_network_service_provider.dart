import 'package:flutter_architecture/shared/services/common_service/domain/repositories/network_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/shared/services/common_service/data/repositories/remote/dio_network_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_network_service_provider.g.dart';

@riverpod
NetworkRepository netwokService(NetwokServiceRef ref){
    final Dio dio = Dio();
    return DioNetworkRepositoryImpl(dio);
}
