import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/const/app_key.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/core_components/pop_up.dart';
import '../../../data/data_source/auth_data_source.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String userRole = 'patient';
  bool isloading = false;
  Map<String, dynamic>? userData;
  Future<bool?> loginfunction() async {
    isloading = true;
    update();
    print("i am in login funcation");
    print("email :${emailController.text}");
    print("password :${passwordController.text}");
    print("role: $userRole");
    String endpoint =
        userRole == 'patient' ? ApiConst.loginpatient : ApiConst.logindonor;

    final result = await AuthDataSource.login(
        emailController.text, passwordController.text, endpoint, userRole);

    update();
    isloading = false;
    update();
    if (result != null) {
      userData = result;

      await CacheHelper.set(key: "email", value: userData!['email']);
      await CacheHelper.set(key: "first_name", value: userData!['first_name']);
      await CacheHelper.set(key: "last_name", value: userData!['last_name']);
      await CacheHelper.set(
          key: "father_name", value: userData!['father_name']);

      return true;
    }
    return false;
  }
}
