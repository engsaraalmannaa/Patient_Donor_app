

import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/core_components/app_toast.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyConsultationsDataSource {
  static ApiHelper apiHelper = ApiHelper();
   static Future<List<Consultation>> getAllMyConsultations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexmyconsultation,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    MyConsultationsModel? myconsultations = MyConsultationsModel();
    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Consultation.fromJson(json)).toList();
    }

    return [];
  }

  static Future<bool> deletemyconsultation({required int id}) async {
    var response = await apiHelper.sendRequest(
      context: Get.context!,
      endPoint: ApiConst.deletemyconsultation(id),
      method: RequestType.delete,
      requiresAuth: true
    );
    if (response != null) {
      AppToast.showToast(message: "تم حذف الاستشارة بنجاح");
      print("response: $response");

      return true;
    }
    print("response: $response");

    return false;
  }

   static Future<void> editmyconsultation(
     int id , 
     int specialty_id,
    String question,) async {
    final response = await apiHelper.sendRequest(
        endPoint: ApiConst.updatemyconsultation(id),
        method: RequestType.put,
        requiresAuth: true,
        body: {
          "specialty_id": specialty_id,
          "question": question,
          },
        context: Get.context!);
    print("response = $response");
  }

   static Future<SpecialtiesModel> getAllSpecialety() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.specialties,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
  
    if (response == null || response['data'] == null ) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }
    
         return SpecialtiesModel.fromJson(response);
   
  }
}