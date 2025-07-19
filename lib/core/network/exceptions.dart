
class ConnectionError implements Exception {
  @override
  String toString() => "connection error,check your internet connection";
}

class ServerError implements Exception {

  final int code;
  final dynamic data;
  final String? message;


  ServerError({this.code = 400, this.data,this.message});

  @override
  String toString() => message ?? "server error with code : $code";

}

class AuthenticationError extends ServerError {

  AuthenticationError():super(
      code: 401
  );

  @override
  String toString() => "authentication error";

}
