import 'package:Pationt_Donor/modules/patient/data/model/show_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/data_source/consultation_data_source.dart';
import '../../data/model/consultation_model.dart';

class HomeController extends GetxController {
  List<ConsultationModel>? data;
  ConsultationData? data1;
  ShowConsultationModel? showConsultationModel;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() => indexConsultations());
  }

  int? idConsltation;
  bool isloading = false;
  Future<void> indexConsultations() async {
    isloading = true;
    update();
    data = await ConsultationDataSource.getAllConsultations();
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isloadingConsultations = false;
  Future<void> showConsultations() async {
    isloadingConsultations = true;
    update();

    ShowConsultationModel? result =
        await ConsultationDataSource.ShowConsultation(idConsltation!);
    showConsultationModel = result;
    data1 = result?.data;

    print("عدد الإجابات: ${data1?.answers?.length}");

    isloadingConsultations = false;
    update();
  }
}
