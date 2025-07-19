
enum DataStatus{
  init,
  success,
  fail,
  loading;
}

extension isX on DataStatus {

  bool get isSuccess => this == DataStatus.success;
  bool get isFail => this == DataStatus.fail;
  bool get isInit => this == DataStatus.init;
  bool get isLoading => this == DataStatus.loading;

}