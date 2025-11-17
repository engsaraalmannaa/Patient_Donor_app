import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../const/api_const.dart';

class DioInstance {
  Dio? _dio;

  Dio get dio => _dio ?? _instantiate();

  Dio _instantiate() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConst.baseUrl,
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    // Add request interceptor for token handling
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    // Add logging interceptor in debug mode
    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
          filter: (options, args) {
            // Don't log sensitive endpoints
            if (options.path.contains('/auth') ||
                options.path.contains('/token')) {
              return false;
            }
            // Don't log responses with binary data
            return !args.isResponse || !args.hasUint8ListData;
          },
        ),
      );
    }

    // Handle SSL certificate issues
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
      HttpClient client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        if (kDebugMode) {}
        return true;
      };
      return client;
    };

    return dio;
  }
}
