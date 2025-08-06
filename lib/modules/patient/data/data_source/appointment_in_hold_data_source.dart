import 'package:Pationt_Donor/core/const/api_const.dart';
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
    //List<dynamic> data = response!['data'] ?? [""];
    AppointmentInHoldModel? appointmentinhold = AppointmentInHoldModel();
    //   if (response != null) {
    //     appointment = MyAppointmentModel.fromJson(response);

    //   }

    //   return response!=null? response["data"]:[];
    //
    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Data.fromJson(json)).toList();
    }

    return [];
  }
}
