import 'package:get/get.dart';
import '../data_state/data_state.dart';
import '../data_state/data_status.dart';
import '../data_state/handler.dart';
abstract class LoadDataController<T> extends GetxController{

  DataState<T> _dataState = DataState(
      status: DataStatus.loading
  );


  DataState<T> get state => _dataState;

  DataStatus get status => _dataState.status;

  T get data => _dataState.data!;

  String get message => _dataState.message;

  Future<T> apiCall();

  void loadData()async{
    _dataState = DataState(
        status: DataStatus.loading
    );
    update();
    _dataState = await handle(apiCall);
    update();
    if(_dataState.status.isFail){
      onFail();
    }
    if(_dataState.status.isSuccess){
      onSuccess();
    }
  }

  void onSuccess(){}

  void onFail(){}

  @override
  void onReady() {
    super.onReady();
    loadData();
  }





}