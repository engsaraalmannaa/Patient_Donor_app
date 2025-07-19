import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/base_controllers/send_data_controller.dart';
import '../../../../../core/core_components/pop_up.dart';
import '../../../../../core/data_state/handler.dart';
import '../../../data/data_source/auth_data_source.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
    String userRole=  'patient'; // أو 'donor'
  bool isloading=false;

   Future <bool?> loginfunction() async {
    isloading = true;
    update();
    print("i am in login funcation");
    print("email :${emailController.text}");
    print("password :${passwordController.text}");
    print("role: $userRole");
    String endpoint = userRole == 'patient'
        ? ApiConst.loginpatient
        : ApiConst.logindonor;
    /*await AuthDataSource.login(
        emailController.text,
        passwordController.text,
        endpoint
    );*/
    final result = await AuthDataSource.login(
      emailController.text,
      passwordController.text,
      endpoint,
    );
    update();
    isloading = false;
    update();
    await CacheHelper.set('token_placeholder',key: 'userRole', value: userRole);  // تخزين role
    return result;
  }

  }

