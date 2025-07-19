import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/network/api_helper/api_enum.dart';
import '../../../../core/network/api_helper/api_helper.dart';
import '../model/consultation_model.dart';

class ConsultationDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<List<ConsultationModel>> getAllConsultations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.consultations,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    //List<dynamic> data = response!['data'] ?? [""];
    List<dynamic> data = response['data'];
    if (data == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }
    List<ConsultationModel> consultations = data.map((e) => ConsultationModel.fromJson(e)).toList();
    //log(response.data.length.toString());
    //log(jsonEncode(response.data));
    return consultations;
  }
}