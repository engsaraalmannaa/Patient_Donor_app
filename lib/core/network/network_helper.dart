import 'dio_network_helper.dart';

abstract class NetworkHelper {

  NetworkHelper.create();


  static NetworkHelper? _helper;
  factory NetworkHelper() => _helper ??= DioNetworkHelper();


  Future<AppResponse> get(String url,{
    Map<String,String>? headers
  });

  Future<AppResponse> post(String url,{
    Map<String,dynamic>? body,
    Map<String, String>? files,
    Map<String,String>? headers
  });

}

class AppResponse{

  final dynamic data;
  final int code;
  final Map<String,String> headers;

  AppResponse({
    required this.data,
    required this.code,
    required this.headers
  });
}