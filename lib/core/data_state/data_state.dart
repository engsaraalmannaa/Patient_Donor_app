import 'data_status.dart';

class DataState<T> {

  final T? data;
  final DataStatus status;
  final String message;

  DataState({
    this.data,
    this.status = DataStatus.init,
    this.message = ''
  });

  @override
  String toString() {
    return 'DataState{data: $data, status: $status, message: $message}';
  }
}