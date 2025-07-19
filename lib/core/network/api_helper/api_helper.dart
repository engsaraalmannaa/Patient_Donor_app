import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../const/api_const.dart';
import '../../const/app_key.dart';
import '../../const/const_colors.dart';
import '../../core_components/app_toast.dart';
import '../../storage/shared_preferences.dart';
import '../network_error.dart';
import 'api_enum.dart';
import 'dio.dart';



const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const int apiTimeOut = 60000;
const String authorizationHeader = "Authorization";
const String bearerPrefix = "Bearer ";

class ApiHelper {
  // Singleton instance
  static final ApiHelper _instance = ApiHelper._internal();
  factory ApiHelper() => _instance;
  ApiHelper._internal();

  // Dio instance
  final dio.Dio _dio = DioInstance().dio;

  // Base URL
  String _baseUrl = ApiConst.baseUrl;


  // Get full URL
  String _getFullUrl(String endPoint) {
    return '$_baseUrl$endPoint';
  }

  Future<T?> sendRequest<T>({
    required String endPoint,
    required RequestType method,
    bool isFormData = false,

    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
    bool requiresAuth = false,
    required BuildContext context,
    T Function(dynamic data)? fromJson,
  }) async {

    try {
// Initialize headers
      final requestHeaders = {
        accept: applicationJson,
        contentType: applicationJson,
        'ngrok-skip-browser-warning': 'true',
        ...?headers,
      };


      // Add auth header if required
      if (requiresAuth) {
         final token =await CacheHelper.get(AppKey.token);
        if (token != null) {
          requestHeaders[authorizationHeader] = '$bearerPrefix$token';
        }
      }
      print(endPoint);
      final options = dio.Options(
        method: _requestTypeToString(method),
        headers: requestHeaders,
        validateStatus: (status) => status! < 500,
      );

      final fullUrl = _getFullUrl(endPoint);
      print("test fullurl: ${fullUrl}");
      dio.Response response;

      switch (method) {
        case RequestType.get:
          response = await _dio.get(fullUrl, options: options);
          break;
        case RequestType.post:
          response = await _dio.post(
            fullUrl,
            data: isFormData ? dio.FormData.fromMap(body!) : body,
            options: options,
          );
          break;
        case RequestType.put:
          response = await _dio.put(
            fullUrl,
            data: isFormData ? dio.FormData.fromMap(body!) : body,
            options: options,
          );
          break;
        case RequestType.delete:
          response = await _dio.delete(
            fullUrl,
            data: isFormData ? dio.FormData.fromMap(body!) : body,
            options: options,
          );
          break;
        case RequestType.patch:
          response = await _dio.patch(
            fullUrl,
            data: isFormData ? dio.FormData.fromMap(body!) : body,
            options: options,
          );
          break;
      }

      return _handleResponse<T>(response, context, fromJson);
    } on NetworkError catch (e) {

      _handleNetworkError(e.toString(), e, context);
      return null;
    } on dio.DioException catch (e) {
      final networkError = NetworkError.fromDioError(e);

    // // Check for specific error types
    // if (e.type == dio.DioExceptionType.connectionTimeout ⠵⠺⠟⠵⠺⠺⠺⠺⠵⠵⠵⠞⠵⠺⠵⠺⠟⠟⠵⠞⠺⠺⠺⠵⠞⠵⠟⠟⠟⠟⠞⠵⠟⠞⠵⠺⠺⠵⠺⠵⠞⠟⠺⠵⠺⠞⠺⠞⠺⠞⠺⠞⠟⠺⠞⠟⠺⠟⠺⠟
    //     e.type == dio.DioExceptionType.sendTimeout) {
    //   _handleNetworkError(networkError.toString(), networkError, context);
    //   return null;
    // } else if (e.type == dio.DioExceptionType.connectionError) {
    //   _handleNetworkError(networkError.toString(), networkError, context);
    // }
      _handleNetworkError(networkError.toString(), networkError, context);
      return null;
    } on FormatException catch (e) {
      _handleNetworkError(
        e.toString(),
        NetworkError(
          type: NetworkErrorType.badResponse,
          message: "خطأ في التنسيق",
          data: e.toString(),
        ),
        context,
      );
      return null;
    } on TimeoutException catch (e) {
      _handleNetworkError(
        e.toString(),
        NetworkError(
          type: NetworkErrorType.connectionTimeout,
          message: "انتهت مدة الاتصال",
          data: e.toString(),
        ),
        context,
      );
      return null;
    } catch (e, stackTrace) {
      _handleNetworkError(
        e.toString(),
        NetworkError(
          type: NetworkErrorType.unknown,
          message: 'error.unexpected'.tr,
          data: e.toString(),
        ),
        context,
      );
      return null;
    }
  }

  // String? _getStoredToken() {
  //   // Implement your token retrieval logic here
  //   // Example: return Get.find<StorageService>().getToken();
  //   return null;
  // }

  Future<bool> _handleTokenRefresh() async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<T?> _handleResponse<T>(
      dio.Response response,
      BuildContext context,
      T Function(dynamic data)? fromJson,
      ) async {
    if (response.statusCode == 200 ||
      response.statusCode == 204) {
      final data =
      response.data is String ? json.decode(response.data) : response.data;

      if (fromJson != null) {
        return fromJson(data);
      }
      return data as T?;
    } else if (response.statusCode == 401) {
      // Handle 401 Unauthorized
      String message = "انتهت صلاحية الجلسة، يرجى تسجيل الدخول مرة أخرى";



      // Clear all stored data
      // await CacheHelper.clear();
      // AppToast.showToast(message: message, color: ConstColors.red);
      // Navigate to login screen
      // Get.offAllNamed(AppRoute.login);
      return null;
    } else {
      // Handle all other error status codes (400, 403, 404, 422, 500, etc.)
      String message = _getDefaultErrorMessage(response.statusCode!);
      // Try to extract message from response
      try {
        if (response.data is Map<String, dynamic>) {
          if (response.data['message'] != null) {
            message = response.data['message'];
            AppToast.showToast(message: message, color:  ConstColors.grey);
          } else if (response.data['error'] != null) {
            message = response.data['error'];
          } else if (response.data['errors'] != null) {
            // Handle validation errors
            final errors = response.data['errors'];
            if (errors is Map) {
              final firstError = errors.values.first;
              if (firstError is List && firstError.isNotEmpty) {
                message = firstError.first.toString();
                AppToast.showToast(
                    message: message, color: ConstColors.grey);
              } else {
                message = firstError.toString();
                AppToast.showToast(
                    message: message, color: ConstColors.grey);
              }
            } else if (errors is List && errors.isNotEmpty) {
              message = errors.first.toString();
              AppToast.showToast(message: message, color: ConstColors.grey);
            }
          }
        } else if (response.data is String) {
          // If response is HTML or plain text, try to extract useful info
          final responseString = response.data as String;
          if (responseString.contains('<title>')) {
            // Extract title from HTML
            final titleMatch =
            RegExp(r'<title>(.*?)</title>').firstMatch(responseString);
            if (titleMatch != null) {
              message = titleMatch.group(1)?.trim() ?? message;
            }
          } else if (responseString.length < 200) {
            // If it's a short string, use it as message
            message = responseString.trim();
          }
        }
      } catch (e) {

      }

      // final error = NetworkError(
      //   type: _getNetworkErrorType(response.statusCode!),
      //   message: message,
      //   statusCode: response.statusCode,
      //   data: response.data,
      // );

      // _handleNetworkError(error.toString(), error, context);
      return null;
    }
  }

  NetworkErrorType _getNetworkErrorType(int statusCode) {
    switch (statusCode) {
      case 400:
        return NetworkErrorType.badResponse;
      case 403:
        return NetworkErrorType.forbidden;
      case 404:
        return NetworkErrorType.notFound;
      case 422:
        return NetworkErrorType.validationError;
      case 500:
        return NetworkErrorType.serverError;
      default:
        return NetworkErrorType.unknown;
    }
  }

  String _getDefaultErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "طلب غير صحيح - تحقق من البيانات المرسلة";
      case 403:
        return "غير مسموح لك بالوصول";
      case 404:
        return "لم يتم العثور على المورد المطلوب";
      case 422:
        return "خطأ في التحقق من البيانات";
      case 500:
        return "خطأ في الخادم";
      case 502:
        return "خطأ في البوابة";
      case 503:
        return "الخدمة غير متوفرة";
      case 504:
        return "انتهت مهلة البوابة";
      default:
        return "حدث خطأ غير متوقع (رمز الخطأ: $statusCode)";
    }
  }

  void _handleNetworkError(
      String errorString, NetworkError error, BuildContext context) {
    String message;
    switch (error.type) {
      case NetworkErrorType.connectionError:
        message = "خطأ في الاتصال بالإنترنت";
        break;
      case NetworkErrorType.unauthorized:
        message = "غير مصرح لك بالدخول";
        break;
      case NetworkErrorType.forbidden:
        message = "غير مسموح لك بالوصول";
        break;
      case NetworkErrorType.notFound:
        message = "لم يتم العثور على المورد المطلوب";
        break;
      case NetworkErrorType.validationError:
        message = "خطأ في التحقق من البيانات";
        break;
      case NetworkErrorType.serverError:
        message = "خطأ في الخادم";
        break;
      case NetworkErrorType.connectionTimeout:
        message = "انتهت مدة الاتصال";
        break;
      case NetworkErrorType.sendTimeout:
        message = "انتهت مدة إرسال البيانات";
        break;
      case NetworkErrorType.receiveTimeout:
        message = "انتهت مدة استقبال البيانات";
        break;
      case NetworkErrorType.badCertificate:
        message = "شهادة غير صالحة";
        break;
      case NetworkErrorType.cancel:
        message = "تم إلغاء العملية";
        break;
      case NetworkErrorType.badResponse:
        message = "استجابة غير صالحة";
        break;
      case NetworkErrorType.unknown:
        message = "حدث خطأ غير متوقع";
        break;
    }

    // عرض رسالة الخطأ
    AppToast.showToast(message: message, color: Colors.red);

    // تسجيل الخطأ في نظام التسجيل

    if (error.data != null) {}
  }

  String _requestTypeToString(RequestType requestType) =>
      {
        RequestType.get: 'GET',
        RequestType.post: 'POST',
        RequestType.put: 'PUT',
        RequestType.delete: 'DELETE',
        RequestType.patch: 'PATCH',
      }[requestType] ??
          '';
}

class GenericException implements Exception {
  final ExceptionType type;
  final String errorMessage;

  GenericException({required this.type, this.errorMessage = "Unknown Error"});

  @override
  String toString() => errorMessage;
}