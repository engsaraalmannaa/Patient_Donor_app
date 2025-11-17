import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/core_components/app_toast.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_appointment_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyAppointmentDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<Data>> getAllMyAppointment() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexappointment,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    MyAppointmentModel? appointment = MyAppointmentModel();

    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Data.fromJson(json)).toList();
    }

    return [];
  }

  static Future<bool> acceptappointment(int id) async {
    var response = await apiHelper.sendRequest(
      context: Get.context!,
      endPoint: ApiConst.acceptappointment(id),
      requiresAuth: true,
      method: RequestType.put,
    );
    if (response != null) {
      AppToast.showToast(message: "تم الموافقة على الموعد");
      
      return true;
    }
    return false;
  }

  static Future<bool> rejectappointment(int id) async {
    var response = await apiHelper.sendRequest(
        context: Get.context!,
        endPoint: ApiConst.rejectappointment(id),
        requiresAuth: true,
        method: RequestType.put,
        body: null);
    if (response != null) {
      AppToast.showToast(
          message: "تم رفض الموعد بنجاح .. سيتم إخيارك بالوقت الجديد");
      return true;
    }
    return false;
  }
}
