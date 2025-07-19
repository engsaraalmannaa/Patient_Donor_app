import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/const/api_const.dart';
import '../../../../core/const/app_key.dart';
import '../../../../core/network/api_helper/api_enum.dart';
import '../../../../core/network/api_helper/api_helper.dart';
import '../../../../core/storage/shared_preferences.dart';
import '../../../patient/presentation/screens/home_screen.dart';

class AuthDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<bool?> login(
      String email, String password, String endpoint) async {
    print(email ?? "000");
    print(password ?? "000");
    var response = await apiHelper.sendRequest(
      endPoint: endpoint,
      method: RequestType.post,
      context: Get.context!,
      body: {
        "email": email,
        "password": password,
      },
    );
    print("test respo${response}");
    if (response != null) {
      await CacheHelper.set( 'token_placeholder',key: AppKey.token, value: response["token"]);
      return true;
    }
    Get.snackbar(
        "خطأ في تسجيل الدخول", response?["message"] ?? "فشل تسجيل الدخول",
        backgroundColor: Colors.red, colorText: Colors.white);
    return false;
  }






  static Future<bool?> registerpatient(
    String first_name,
    String father_name, 
    String last_name, 
    String gender,
    String birth_data,
    String national_number,
    String address,
    String phone,
    String email, 
    String password,
    String password_confirmation,
    String ?social_status,
    String ?emergency_num,
    String ?insurance_company,
    String ?insurance_num,
    bool ?smoker,
    bool ? pregnant,
    String ? blood_type,
    String ? genetic_diseases,
    String ? chronic_diseases,
    String ? drug_allergy,
    String ? last_operations,
    String ? present_medicines,
    String endpoint
    ) async {
    print(father_name ?? "000");
    print(email ?? "000");
    print(password ?? "000");
    //print(confpassword ?? "000");
    var response = await apiHelper.sendRequest(
      endPoint: endpoint,
      method: RequestType.post,
      context: Get.context!,
      body: {
         "first_name" : first_name,                   // required|string|max:255
    "father_name":father_name ,               // required|string|max:255
    "last_name":last_name,                     // required|string|max:255
    "gender":gender,                       // required|in:male,female
    "birth_date":birth_data,             // required|date
    "national_number":birth_data,    // required|string|unique:patients,national_number
    "address":address,           // required|string|max:255
    "phone" :phone ,                  // required|string|unique:patients,phone
    "email" : email,        // required|email|unique:patients,email
    "password" : password,                // required|string|min:8|confirmed
    "password_confirmation" : password_confirmation,   // required for confirmation matching
    "social_status" : social_status,              // nullable|string // optional
    "emergency_num" : emergency_num,          // nullable|string|max:20 // optional
    "insurance_company" : insurance_company,   // nullable|string|max:255 // optional
    "insurance_num" : insurance_num,           // nullable|string|max:50 // optional
    "smoker" : smoker,                         // nullable|boolean // optional
    "pregnant" : pregnant,                      // nullable|boolean // optional
    "blood_type" :blood_type,                     // nullable|string|max:3 // optional
    "genetic_diseases" : genetic_diseases,             // nullable|string // optional
    "chronic_diseases" : chronic_diseases,     // nullable|string // optional
    "drug_allergy" : drug_allergy,           // nullable|string // optional
    "last_operations" : last_operations,      // nullable|string // optional
    "present_medicines" : present_medicines,
      },
    );
    print("test respo${response}");
    if (response != null) {
      await CacheHelper.set('token_placeholder',key: AppKey.token, value: response["token"]);
      Get.offAllNamed(LoginScreen5.name);
    }
  }



  
  static Future<bool ?> registerdonor(
    String first_name,
    String father_name, 
    String last_name, 
    String gender,
    String birth_data,
    String national_number,
    String address,
    String phone,
    String email, 
    String password,
    String password_confirmation,
    String country,
    String endpoint
    ) async {
    print(father_name ?? "000");
    print(email ?? "000");
    print(password ?? "000");
    //print(confpassword ?? "000");
    var response = await apiHelper.sendRequest(
      endPoint: endpoint,
      method: RequestType.post,
      context: Get.context!,
      body: {
         "first_name" : first_name,                   // required|string|max:255
    "father_name":father_name ,               // required|string|max:255
    "last_name":last_name,                     // required|string|max:255
    "gender":gender,                       // required|in:male,female
    "birth_date":birth_data,             // required|date
    "national_number":birth_data,    // required|string|unique:patients,national_number
    "address":address,           // required|string|max:255
    "phone" :phone ,                  // required|string|unique:patients,phone
    "email" : email,        // required|email|unique:patients,email
    "password" : password,                // required|string|min:8|confirmed
    "password_confirmation" : password_confirmation,   // required for confirmation matching
    "country" : country,
      },
    );
    print("test respo${response}");
    if (response != null) {
      await CacheHelper.set('token_placeholder' ,key: AppKey.token, value: response["token"]);
      Get.offAllNamed(LoginScreen5.name);
    }
  }
}
