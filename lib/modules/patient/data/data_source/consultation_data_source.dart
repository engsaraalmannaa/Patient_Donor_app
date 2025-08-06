import 'package:Pationt_Donor/modules/patient/data/model/show_consultation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/network/api_helper/api_enum.dart';
import '../../../../core/network/api_helper/api_helper.dart';
import '../model/consultation_model.dart';

class ConsultationDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<ConsultationModel>> getAllConsultations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexconsultations,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    //List<dynamic> data = response!['data'] ?? [""];
    //List<ConsultationModel>? consultation;
    List<dynamic> data = response['data'] ?? [];

    return response != null
        ? data.map((e) => ConsultationModel.fromJson(e)).toList()
        : [];
  }


  static Future<List<Data>> ShowConsultation(
      int id) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.showconsultation(id),
        method: RequestType.get,
        requiresAuth: true,
      
        context: Get.context!);
    ShowConsultationModel? showconsultation =ShowConsultationModel();

        if (response != null && response["data"] != null) {
    List<dynamic> rawList = response["data"];
    return rawList.map((json) => Data.fromJson(json)).toList();
  }

  return [];
  }
}
