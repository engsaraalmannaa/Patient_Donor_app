import 'dart:async';
import 'data_state.dart';
import 'data_status.dart';


Future<DataState<T>> handle<T>(FutureOr<T> Function() process)async{
  try{
    var data = await process();
    return DataState(
        data: data,
        status: DataStatus.success
    );
  }
  catch(e){
    return DataState(
        message: e.toString(),
        status: DataStatus.fail
    );
  }
}