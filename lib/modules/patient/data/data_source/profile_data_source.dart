import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileDataSourcePatient {
  static ApiHelper apiHelper = ApiHelper();
  static Future<PatientProfileModel> getProfileInfo() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.profileshow,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);

    if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return PatientProfileModel.fromJson(response);
   
  }


  static Future<void> editprofilepatient(
      {required String first_name,
      required String father_name,
      required String last_name,
      required String gender,
      required String birth_date,
      required String national_number,
      required String address,
      required String phone,
      required String email,
      required String social_status,
      required String emergency_num,
      required String insurance_company,
      required String insurance_num,
      required String smoker,
      required String pregnant,
      required String blood_type,
      required String genetic_diseases,
      required String chronic_diseases,
      required String drug_allergy,
      required String present_medicines,
      required String last_operations,
      }) async {
    final response = await apiHelper.sendRequest(
        endPoint: ApiConst.profileedit,
        method: RequestType.put,
        requiresAuth: true,
        body: {
          "first_name": first_name,
         "father_name": father_name,
          "last_name": last_name,
          "gender": gender,
          "birth_date": birth_date,
          "phone": phone,
          "national_number": national_number,
          "address": address,
          "email": email,
          "social_status": social_status,
          "emergency_num": emergency_num,
          "insurance_company": insurance_company,
          "insurance_num": insurance_num,
          "smoker": smoker,
          "pregnant": pregnant,
          "blood_type": blood_type,
          "genetic_diseases": genetic_diseases,
          "chronic_diseases": chronic_diseases,
          "drug_allergy": drug_allergy,
          "present_medicines": present_medicines,
          "last_operations": last_operations,
          },
        context: Get.context!);
    print("response = $response");
  }
}
