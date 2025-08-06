import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/data_source/home_data_sourse.dart';
import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeControllerd extends GetxController {
  List<Data>? data = [];
 

  @override
  void onInit() {
    super.onInit();
    Diseases();
    
  }
  bool isloading = false;
  
  Future<void> Diseases() async {
    isloading = true;
    update();
    final result = await HomeDataSourse.getAllDisease();
     data = (await HomeDataSourse.getAllDisease());
    print(data?.length.toString());
    isloading = false;
    update();
  }
}
