import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WriteConsultationDataSource {
  static ApiHelper apiHelper = ApiHelper();
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
  static Future<void> writeConsultations(
      {required String 
      specialty_id, 
      required String question}) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.writeconsultations,
        method: RequestType.post,
        requiresAuth: true,
        body: {
          "specialty_id": specialty_id ,
          "question":question
           },
        context: Get.context!);
  }
}
