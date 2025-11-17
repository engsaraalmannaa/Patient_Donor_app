

import 'dart:io';
import 'package:Pationt_Donor/core/core_components/app_toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:Pationt_Donor/modules/donor/data/model/show_my_donation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_core/src/get_main.dart';

class MyDonationsDataSourse {
  static ApiHelper apiHelper = ApiHelper();
static Future<List<Data>> getAllDonations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexmydonation,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    
    DonationModel? donation =DonationModel();
 
  if (response != null && response["data"] != null) {
    List<dynamic> rawList = response["data"];
    return rawList.map((json) => Data.fromJson(json)).toList();
  }

  return [];
  }

static Future<Show_My_Donation_Model> getthisdonation(int id) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.showmydonation(id),
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
        if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return Show_My_Donation_Model.fromJson(response);
 
  }


static Future<bool> updateDonorCase(int id,
      dio.FormData formData) async {
    final response = await apiHelper.sendRequest(
        context: Get.context!,
        endPoint: ApiConst.editmydonation(id),
        method: RequestType.post,
       body2: formData,
      headers: {
        'Content-Type': 'multipart/form-data',
        "_method": "PUT",
      },
      isFormData: true,
    
        requiresAuth: true
    );
    if (response != null) {
      AppToast.showToast(message: "تم تعديل حالة التبرع بنجاح");
      Get.back();
      return true;
    }
    return false;
  }







}