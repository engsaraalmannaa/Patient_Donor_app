import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/base_controllers/send_data_controller.dart';
import '../../../../../core/const/api_const.dart';
import '../../../../../core/core_components/pop_up.dart';
import '../../../../../core/data_state/handler.dart';
import '../../../data/data_source/auth_data_source.dart';

class RegisterdonorController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final last_nameController = TextEditingController();
  final first_nameController = TextEditingController();
  final father_nameController = TextEditingController();
  final genderController = TextEditingController();
  final birth_dataController = TextEditingController();
  final national_numberController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final password_confirmationController = TextEditingController();
  final countryController = TextEditingController();
 


  String userRole = 'donor';
  //final endpoint = ApiConst.registerpatient;
  bool isloading=false;
  Future <bool?> registerfunction()async {
    isloading=true;
    update();
    print("i am in register funcation");
    print("email :${emailController.text}");
    print("name :${last_nameController.text}");
    print("password :${passwordController.text}");
    print("role: $userRole");
    final String endpoint = userRole == 'patient'
        ? ApiConst.registerpatient
        : ApiConst.registerdonor;
  
    final result = await AuthDataSource.registerdonor(
        emailController.text,
        passwordController.text,
        last_nameController.text,
        first_nameController.text,
        father_nameController.text,
        genderController.text,
        birth_dataController.text,
        national_numberController.text,
        addressController.text,
        phoneController.text,
        password_confirmationController.text,
        countryController.text,
        endpoint

    );
    update();
    isloading=false;
    update();
    await CacheHelper.set('token_placeholder',key: 'userRole', value: userRole);  // تخزين role
    return result;
  }

}
