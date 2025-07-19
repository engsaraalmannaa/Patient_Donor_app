import 'package:dio/dio.dart';

import '../storage/storage_helper.dart';
import 'exceptions.dart';
import 'network_helper.dart';

class DioNetworkHelper extends NetworkHelper{

  DioNetworkHelper() : super.create();

  final _dio = Dio();

  Map<String,String> get _headers => {
    'Accept':'application/json',
    'Content-Type':'application/json',
    if(StorageHelper().hasToken)
      'Authorization' : 'Bearer ${StorageHelper().token}'
  };


  @override
  Future<AppResponse> get(String url, {Map<String, String>? headers}) =>
      _handle(() async {
        var response = await _dio.get(
          url,
          options: Options(
            headers: {
              ..._headers,
              if(headers != null)
                ...headers
            },
          ),
        );
        return response.appResponse;
      });


  @override
  Future<AppResponse> post(String url, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, String>? files,
  }) => _handle(() async {
    final data = {
      if(body != null)
        ...body,
      if(files != null)
        ...(files.map(
                (key,value) =>
                MapEntry(key, MultipartFile.fromFileSync(value))
        )),

    };
    var response = await _dio.post(
      url,
      data: FormData.fromMap(data),
      options: Options(
        headers: {
          ..._headers,
          if(headers != null)
            ...headers
        },
      ),
    );
    return response.appResponse;
  });



  Future<AppResponse> _handle(Future<AppResponse> Function() process) async {
    try {
      return await process();
    } on DioException catch(e){
      if(e.response == null){
        throw ConnectionError();
      }
      throw ServerError(
        code: e.response!.statusCode ?? 500,
        data: e.response!.data,
        message: e.response!.data?['message'],
      );
    } catch (e){
      //
      rethrow;
    }
  }


}

extension DioToAppResponse on Response {

  AppResponse get appResponse => AppResponse(
    data: data,
    code: statusCode ?? 200,
    headers: headers.map.map(
            (k,v) => MapEntry(k, v.join())
    ),
  );
}
