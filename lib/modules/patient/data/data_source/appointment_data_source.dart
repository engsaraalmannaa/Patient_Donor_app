import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/doctorbyspecialety_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<SpecialtiesModel> getAllSpecialety() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.specialties,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);

    if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return SpecialtiesModel.fromJson(response);
  }

  static Future<DoctorBySpecialetyModel> getAlldoctorsbyspecialety(
      {required String id}) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.docbyspecialety(id: id),
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);

    if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return DoctorBySpecialetyModel.fromJson(response);
  }

  static Future<void> appointmentriq(
      {required String specialty_id, required String doctor_id}) async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.appointmentrequest,
        method: RequestType.post,
        requiresAuth: true,
        body: {"specialty_id": specialty_id, "doctor_id": doctor_id},
        context: Get.context!);
    if (response != null) {
      showSnackBar("تم حجز موعد .. سيتم ابلاغك بالوقت");
      return;
    }
    showSnackBar("فشل في إرسال الموعد");
  }
}
