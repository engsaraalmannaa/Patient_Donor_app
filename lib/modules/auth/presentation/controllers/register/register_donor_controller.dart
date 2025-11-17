import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/const/api_const.dart';
import '../../../../../core/core_components/pop_up.dart';
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
  RxBool isError = false.obs;

  String userRole = 'donor';
  bool isloading = false;
  Future<bool?> registerfunction() async {
    isloading = true;
    update();
    print("i am in register funcation");
    print("email :${emailController.text}");
    print("name :${last_nameController.text}");
    print("password :${passwordController.text}");
    print("role: $userRole");
    isError.value = false;
    final String endpoint = userRole == 'patient'
        ? ApiConst.registerpatient
        : ApiConst.registerdonor;

    final result = await AuthDataSource.registerdonor(
        email: emailController.text,
        password: passwordController.text,
        last_name: last_nameController.text,
        first_name: first_nameController.text,
        father_name: father_nameController.text,
        gender: genderController.text,
        birth_data: birth_dataController.text,
        national_number: national_numberController.text,
        address: addressController.text,
        phone: phoneController.text,
        password_confirmation: password_confirmationController.text,
        country: countryController.text,
        endpoint: endpoint);
    update();
    isloading = false;
    update();
    if (result != true) {
      isError.value = true; 
    }
   
    return result;
  }
}
