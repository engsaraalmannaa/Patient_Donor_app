import 'package:Pationt_Donor/core/core_components/pop_up.dart';
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
      String email, String password, String endpoint, String userRole) async {
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

    if (response != null) {
      await CacheHelper.set(key: AppKey.role, value: userRole); // تخزين role
      await CacheHelper.set(key: AppKey.token, value: response["token"]);
      // final user = response['user'];
      // await CacheHelper.set(
      //     key: 'user_name',
      //     value: "${user['first_name']}" ?? "" "${user['last_name']}" ?? "");
      // await CacheHelper.set(key: 'user_email', value: user['email']);
      // await CacheHelper.set(
      //     key: 'user_id', value: response['data']['user_id'].toString());

      return true;
    }
    Get.snackbar(
        "خطأ في تسجيل الدخول", response?["message"] ?? "فشل تسجيل الدخول",
        backgroundColor: Colors.red, colorText: Colors.white);
    return false;
  }

  static Future<Map<String, dynamic>?> registerpatient(
      {required String first_name,
      required String father_name,
      required String last_name,
      required String gender,
      required String birth_data,
      required String national_number,
      required String address,
      required String phone,
      required String email,
      required String password,
      required String password_confirmation,
      required String social_status,
      required String emergency_num,
      required String insurance_company,
      required String insurance_num,
      required bool smoker,
      required bool pregnant,
      required String blood_type,
      required String genetic_diseases,
      required String chronic_diseases,
      required String drug_allergy,
      required String last_operations,
      required String present_medicines,
      required String endpoint}) async {
    String userRole = 'patient';

    print(father_name ?? "000");
    print(email ?? "000");
    print(password ?? "000");
    //print(confpassword ?? "000");
    var response = await apiHelper.sendRequest(
      endPoint: endpoint,
      method: RequestType.post,
      context: Get.context!,
      body: {
        "first_name": first_name, // required|string|max:255
        "father_name": father_name, // required|string|max:255
        "last_name": last_name, // required|string|max:255
        "gender": gender, // required|in:male,female
        "birth_date": birth_data, // required|date
        "national_number":
            national_number, // required|string|unique:patients,national_number
        "address": address, // required|string|max:255
        "phone": phone, // required|string|unique:patients,phone
        "email": email, // required|email|unique:patients,email
        "password": password, // required|string|min:8|confirmed
        "password_confirmation":
            password_confirmation, // required for confirmation matching
        "social_status": social_status, // nullable|string // optional
        "emergency_num": emergency_num, // nullable|string|max:20 // optional
        "insurance_company":
            insurance_company, // nullable|string|max:255 // optional
        "insurance_num": insurance_num, // nullable|string|max:50 // optional
        "smoker": smoker, // nullable|boolean // optional
        "pregnant": pregnant, // nullable|boolean // optional
        "blood_type": blood_type, // nullable|string|max:3 // optional
        "genetic_diseases": genetic_diseases, // nullable|string // optional
        "chronic_diseases": chronic_diseases, // nullable|string // optional
        "drug_allergy": drug_allergy, // nullable|string // optional
        "last_operations": last_operations, // nullable|string // optional
        "present_medicines": present_medicines,
      },
    );
    print('RESPONSE: $response');
    //print("test respo${response}");
    if (response?['errors'] != null) {
      final emailErrors = response['errors']['email'];
      if (emailErrors != null && emailErrors.isNotEmpty) {
        showSnackBar(emailErrors.first.toString());
      }
      return response;
    }
    if (response != null) {
      //await CacheHelper.set(key: AppKey.token, value: response["token"]);
      await CacheHelper.set(key: AppKey.role, value: userRole);
      Get.back();
    }
    return response;
  }

  static Future<bool?> registerdonor(
      {required String first_name,
      required String father_name,
      required String last_name,
      required String gender,
      required String birth_data,
      required String national_number,
      required String address,
      required String phone,
      required String email,
      required String password,
      required String password_confirmation,
      required String country,
      required String endpoint}) async {
    String userRole = 'donor';
    // final gen = genderController.text == " ذكر" ? " male" : "female";
    print(father_name ?? "000");
    print(email ?? "000");
    print(password ?? "000");
    //print(confpassword ?? "000");
    var response = await apiHelper.sendRequest(
      endPoint: endpoint,
      method: RequestType.post,
      context: Get.context!,
      body: {
        "first_name": first_name, // required|string|max:255
        "father_name": father_name, // required|string|max:255
        "last_name": last_name, // required|string|max:255
        "gender": gender, // required|in:male,female
        "birth_date": birth_data, // required|date
        "national_number":
            national_number, // required|string|unique:patients,national_number
        "address": address, // required|string|max:255
        "phone": phone, // required|string|unique:patients,phone
        "email": email, // required|email|unique:patients,email
        "password": password, // required|string|min:8|confirmed
        "password_confirmation":
            password_confirmation, // required for confirmation matching
        "country": country,
      },
    );
    //print("test respo${response}");
    if (response != null) {
        await CacheHelper.set(key: AppKey.role, value: userRole);
      Get.back();
      return true;
    }
    return null;
  }
}
