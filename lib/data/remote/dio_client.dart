import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hh_express/data/remote/interceptors/log_interceptor.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/api/response_model.dart';
import 'package:hh_express/settings/consts.dart';

mixin DioClientMixin {
  final DioClient _dio = DioClient();
  DioClient get dio => _dio;
}

class DioClient {
  DioClient({
    String? baseUrl,
    ResponseType? type,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? EndPoints.baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            sendTimeout: const Duration(seconds: 15),
            responseType: type ?? ResponseType.json,
          ),
        )..interceptors.addAll(
            [
              LoggerInterceptor(),
              InterceptorsWrapper(
                onResponse: (res, handler) {
                  'end response'.log();
                  handler.next(res);
                },
                onRequest: (options, handler) async {
                  handler.next(options);
                },
                onError: (e, handler) async {
                  handler.next(e);
                },
              )
            ],
          );

  late final Dio _dio;

  Future<ApiResponse> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final res = await _dio.post<dynamic>(
        endPoint,
        data: data,
        options: options,
      );
      return ApiResponse.fromJson(res.data as Map<String, dynamic>);
    } catch (e, s) {
      'zero Step'.log();

      return _handleException(e, s);
    }
  }

  Future<ApiResponse> get({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.get<dynamic>(
        endPoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return ApiResponse.fromJson(res.data as Map<String, dynamic>);
    } catch (e, s) {
      'ERROR GET'.log();
      return _handleException(e, s);
    }
  }

  Future<ApiResponse> delete({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(endPoint,
          data: data, options: options, queryParameters: queryParameters);
      return ApiResponse.fromJson(response.data);
    } catch (e, s) {
      return _handleException(e, s);
    }
  }
}

ApiResponse _handleException(Object e, StackTrace? stack) {
  final error = e as DioException;

  if (e.error is SocketException) {
    'MY log Soceet Exeptionnn'.log();
    return ApiResponse(
      data: {},
      error: 'SocketExeption',
      message: 'Socket Exeption Show Some TellSomeThing',
      success: false,
    );
  }
  if (e.response != null && e.response!.data is Map) {
    '${e.requestOptions.data} MyDioExeption'.log();
    return ApiResponse.fromJson(e.response!.data);
  }
  return ApiResponse(
    data: {},
    error: 'Unknown Error',
    message: 'Unknown Error',
    success: false,
  );
}
