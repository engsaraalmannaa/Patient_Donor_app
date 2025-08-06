import 'package:Pationt_Donor/modules/patient/presentation/screens/show_consultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/data_source/consultation_data_source.dart';
import '../../data/model/consultation_model.dart';

class HomeController extends GetxController {
  List<ConsultationModel>? data;
  @override
  void onInit() {
    super.onInit();
    Future.microtask(() => Consultations());
  }

  //final TextEditingController answer = TextEditingController();
  String? idConsltation;
  bool isloading = false;
  Future<void> Consultations() async {
    isloading = true;
    update();
    data = await ConsultationDataSource.getAllConsultations();
    print(data?.length.toString());
    isloading = false;
    update();
  }



}
