import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/core_components/app_toast.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/appointment_in_hold_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentInHoldDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<Data>> getAllAppointmentInHold() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexappointmentrequest,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    AppointmentInHoldModel? appointmentinhold = AppointmentInHoldModel();
    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Data.fromJson(json)).toList();
    }

    return [];
  }

static Future<bool> deletrappointrequist({required int id}) async {
    var response = await apiHelper.sendRequest(
      context: Get.context!,
      endPoint: ApiConst.deleteappointmentrequest(id:id),
      method: RequestType.delete,
      requiresAuth: true
    );
    if (response != null) {
      AppToast.showToast(message: "تم حذف الموعد  بنجاح");
      print("response: $response");

      return true;
    }
    print("response: $response");

    return false;
  }
}

