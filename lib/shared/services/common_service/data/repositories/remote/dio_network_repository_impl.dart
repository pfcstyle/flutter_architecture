import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/shared/configs/app_configs.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/network_repository.dart';
import 'package:flutter_architecture/shared/models/either.dart';
import 'package:flutter_architecture/shared/models/response.dart' as response;
import 'package:flutter_architecture/shared/exceptions/app_exception.dart';
import 'package:flutter_architecture/shared/globals.dart';
import 'package:flutter_architecture/shared/mixins/exception_handler_mixin.dart';

class DioNetworkRepositoryImpl extends NetworkRepository with ExceptionHandlerMixin {
  final Dio dio;
  DioNetworkRepositoryImpl(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
