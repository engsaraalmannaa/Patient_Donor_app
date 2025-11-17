import 'package:dio/dio.dart' as dio;
import 'api_helper/api_enum.dart';

class NetworkError {
  final NetworkErrorType type;
  final String message;
  final int? statusCode;
  final dynamic data;

  NetworkError({
    required this.type,
    required this.message,
    this.statusCode,
    this.data,
  });

  factory NetworkError.fromDioError(dio.DioException error) {
    switch (error.type) {
      case dio.DioExceptionType.connectionTimeout:
        return NetworkError(
          type: NetworkErrorType.connectionTimeout,
          message: 'Connection timeout occurred',
        );
      case dio.DioExceptionType.sendTimeout:
        return NetworkError(
          type: NetworkErrorType.sendTimeout,
          message: 'Send timeout occurred',
        );
      case dio.DioExceptionType.receiveTimeout:
        return NetworkError(
          type: NetworkErrorType.receiveTimeout,
          message: 'Receive timeout occurred',
        );
      case dio.DioExceptionType.badCertificate:
        return NetworkError(
          type: NetworkErrorType.badCertificate,
          message: 'Bad certificate occurred',
        );
      case dio.DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case dio.DioExceptionType.cancel:
        return NetworkError(
          type: NetworkErrorType.cancel,
          message: 'Request was cancelled',
        );
      case dio.DioExceptionType.connectionError:
        return NetworkError(
          type: NetworkErrorType.connectionError,
          message: 'No internet connection',
        );
      case dio.DioExceptionType.unknown:
        return NetworkError(
          type: NetworkErrorType.unknown,
          message: 'An unknown error occurred',
        );
    }
  }

  static NetworkError _handleBadResponse(dio.Response? response) {
    if (response == null) {
      return NetworkError(
        type: NetworkErrorType.unknown,
        message: 'No response received',
      );
    }

    switch (response.statusCode) {
      case 401:
        return NetworkError(
          type: NetworkErrorType.unauthorized,
          message: 'Unauthorized access',
          statusCode: response.statusCode,
          data: response.data,
        );
      case 403:
        return NetworkError(
          type: NetworkErrorType.forbidden,
          message: 'Access forbidden',
          statusCode: response.statusCode,
          data: response.data,
        );
      case 404:
        return NetworkError(
          type: NetworkErrorType.notFound,
          message: 'Resource not found',
          statusCode: response.statusCode,
          data: response.data,
        );
      case 422:
        return NetworkError(
          type: NetworkErrorType.validationError,
          message: 'Validation error',
          statusCode: response.statusCode,
          data: response.data,
        );
      case 500:
        return NetworkError(
          type: NetworkErrorType.serverError,
          message: 'Internal server error',
          statusCode: response.statusCode,
          data: response.data,
        );
      default:
        return NetworkError(
          type: NetworkErrorType.unknown,
          message: 'An error occurred',
          statusCode: response.statusCode,
          data: response.data,
        );
    }
  }
}
