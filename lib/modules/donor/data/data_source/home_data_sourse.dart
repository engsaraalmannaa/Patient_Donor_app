

import 'dart:io';

import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/const/app_key.dart';
import 'package:Pationt_Donor/core/core_components/app_toast.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart' ;
import 'package:Pationt_Donor/modules/donor/data/model/show_disease_model.dart';
import 'package:dio/dio.dart' as dio;
//import 'package:dio/dio.dart'; 
import 'package:get/get.dart';
//import 'package:dio/dio.dart' as dio;
//import 'package:get/get_connect/http/src/multipart/form_data.dart';

//import 'package:get/get_core/src/get_main.dart';


class HomeDataSourse {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<Data>> getAllDisease() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexdiseas,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    DiseaseModel? diseases = DiseaseModel();

    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Data.fromJson(json)).toList();
    }

    return [];
  }

  static Future<ShowDiseaseModel> getthisdiseas(int id) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.showdisease(id),
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
        if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return ShowDiseaseModel.fromJson(response);
 
  }

  static Future<void> postdonation(dio.FormData formData) async {
 final response = await apiHelper.sendRequest(
        context: Get.context!,
        endPoint: ApiConst.postdonation,
        method: RequestType.post,
       body2: formData,
      headers: {
        'Content-Type': 'multipart/form-data',
        
      },
      isFormData: true,
    
        requiresAuth: true
    );
    if (response != null) {
      AppToast.showToast(message: "تم التبرع بنجاح");
      Get.back();
      return response;
    }
    return response;
  }

//     try {
//       //Dio dio = Dio();
// //  String token = CacheHelper.get('token') ?? '';
// //       if (token.isEmpty) {
// //         throw Exception("توكن غير موجود، يرجى تسجيل الدخول أولاً");
// //       }
// //       dio.FormData formData = dio.FormData.fromMap({
// //         "disease_id": disease_id,
// //         "amount": amount,
// //         if (image != null)
// //           "image": await dio.MultipartFile.fromFile(
// //             image.path,
// //             filename: image.path.split('/').last,
// //           ),
// //       });

//       final response = await dio.Dio().post(
//         ApiConst.postdonation,
//         data: formData,
//         options: dio.Options(
//           headers: {
//             'Authorization': 'Bearer $token', // إذا عندك توكن
//             'Accept': 'application/json',
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//       );

//       print("🔹 statusCode: ${response.statusCode}");
//       print("🔹 data: ${response.data}");
//     } catch (e) {
//       print("❌ خطأ في postdonation: $e");
//     }
  }



