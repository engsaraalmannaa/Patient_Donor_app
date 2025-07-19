import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../core_components/pop_up.dart';
import '../data_state/data_state.dart';
import '../data_state/data_status.dart';
import '../data_state/handler.dart';

abstract class SendDataController<T> extends GetxController {


  DataState<T> _dataState = DataState<T>();
  DataStatus get status => _dataState.status;
  String get message => _dataState.message;
  final formKey = GlobalKey<FormState>();

  bool validate() => formKey.currentState?.validate() ?? true;

  // Future<T> apiCall();

  void sendData() async{
    if(! validate() ){
      return;
    }
    _dataState = DataState<T>(
        status: DataStatus.loading
    );
    update();
    showLoader();
    // _dataState = await handle(apiCall);
    Get.back();
    update();
    if(_dataState.status.isFail){
      onFail();
    }
    if(_dataState.status.isSuccess){
      onSuccess();
    }
  }

  void onSuccess(){}

  void onFail(){
    print(message);
    showSnackBar(message);
  }

}