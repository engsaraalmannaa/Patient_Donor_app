import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyDonationsDataSourse {
  static ApiHelper apiHelper = ApiHelper();
static Future<List<DonationModel>> getAllDonations() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.indexmydonation,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);
    List<dynamic> data = response['data'];
    return response != null
        ? data.map((e) => DonationModel.fromJson(e)).toList()
        : [];
  }


}