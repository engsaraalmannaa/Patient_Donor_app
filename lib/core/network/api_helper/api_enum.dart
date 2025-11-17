enum RequestType { get, post, put, delete, patch }

enum ExceptionType {
  ConnectionError,
  NotAuthorized,
  NotFound,
  InternalServerException,
  ServiceUnavailableException,
  PageGone,
  EmailAlreadyExists,
  UserNameAlreadyExists,
  PasswordInvalid,
  InvalidCredentials,
  VerifyTokenInvalid,
  ResetCodeInvalid,
  InvalidResetToken,
  Other,
}

enum NetworkErrorType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
  unauthorized,
  forbidden,
  notFound,
  serverError,
  validationError,
}
