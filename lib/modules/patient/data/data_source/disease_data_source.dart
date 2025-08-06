import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DiseaseDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<void> adddisease({
    required String specialty_id, 
     required String doctor_id,
      required String patient_status,
      required int available_money,
      required String urgency_level,
      required String final_time,
     }) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.storedisease,
        method: RequestType.post,
        requiresAuth: true,
        body: {
         "specialty_id":specialty_id ,
  "doctor_id": doctor_id,
  "patient_status": patient_status,
  "available_money": available_money,
  "urgency_level": urgency_level,
  "final_time": final_time
           },
        context: Get.context!);
  }
}
