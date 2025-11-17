import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_helper.dart';
import 'package:Pationt_Donor/modules/donor/data/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileDataSource {
  static ApiHelper apiHelper = ApiHelper();
  static Future<void> editprofile(
      {required String first_name,
      required String email,
      required String phone}) async {
    final response = await apiHelper.sendRequest(
        endPoint: ApiConst.updateprofile,
        method: RequestType.put,
        requiresAuth: true,
        body: {
          "first_name": first_name,
         "email": email,
          "phone": phone},
        context: Get.context!);
    print("response = $response");
  }

  static Future<ProfileModel> showprofile() async {
    var response = await apiHelper.sendRequest(
        endPoint: ApiConst.showprofile,
        method: RequestType.get,
        requiresAuth: true,
        context: Get.context!);

    if (response == null || response['data'] == null) {
      throw Exception("لا يوجد استجابة من السيرفر");
    }

    return ProfileModel.fromJson(response);
  }
}
