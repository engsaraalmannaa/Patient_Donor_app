import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_disease_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyDiseaseDataSource {
  static ApiHelper apiHelper = ApiHelper();
   static Future<List<Data>> getAllMyDisease() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexdisease,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    MyDiseaseModel? mydesease = MyDiseaseModel();
    if (response != null && response["data"] != null) {
      List<dynamic> rawList = response["data"];
      return rawList.map((json) => Data.fromJson(json)).toList();
    }

    return [];
  }
}