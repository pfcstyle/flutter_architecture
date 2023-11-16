import 'package:dio/dio.dart';
import 'package:flutter_architecture/shared/services/common_service/data/repositories/remote/dio_network_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final netwokServiceProvider = Provider<DioNetworkRepositoryImpl>(
  (ref) {
    final Dio dio = Dio();
    return DioNetworkRepositoryImpl(dio);
  },
);
