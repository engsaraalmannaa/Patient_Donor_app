import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/data_source/profile_data_source.dart';
import 'package:Pationt_Donor/modules/donor/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isloading = false;
  final TextEditingController first_name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController father_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController birth_data = TextEditingController();
  final TextEditingController national_number = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController country = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    first_name.text = CacheHelper.get("first_name") ?? "";
    email.text = CacheHelper.get("email") ?? "";
    phone.text = CacheHelper.get("phone") ?? "";
    father_name.text = CacheHelper.get("father_name") ?? "";
    last_name.text = CacheHelper.get("last_name") ?? "";
    gender.text = CacheHelper.get("gender") ?? "";
    birth_data.text = CacheHelper.get("birth_data") ?? "";
    national_number.text = CacheHelper.get("national_number") ?? "";
    address.text = CacheHelper.get("address") ?? "";
    country.text = CacheHelper.get("country") ?? "";
  }

  Future<void> updateprofile() async {
    isloading = true;
    update();
    await Future.delayed(Duration(seconds: 1)); 

    await CacheHelper.set(key: "user_name", value: first_name.text);
    await CacheHelper.set(key: "email", value: email.text);
    await CacheHelper.set(key: "user_phone", value: phone.text);
    try {
      await ProfileDataSource.editprofile(
        first_name: first_name.text,
        email: email.text,
        phone: phone.text,
      );
      var replyText = first_name.text;
      var replyEmail = email.text;
      var replyphone = phone.text;
      showSnackBar("تم إرسال الرد بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الرد");
    }
    isloading = false;
    update();
  }

  ProfileModel? data;
  Future<void> profile() async {
    isloading = true;
    update();

    try {
      data = await ProfileDataSource.showprofile();

      first_name.text = data?.data?.firstName ?? "";
      father_name.text = data?.data?.fatherName ?? "";
      last_name.text = data?.data?.lastName ?? "";
      email.text = data?.data?.email ?? "";
      phone.text = data?.data?.phone ?? "";
      gender.text = data?.data?.gender ?? "";
      birth_data.text = data?.data?.birthDate ?? "";
      national_number.text = data?.data?.nationalNumber ?? "";
      address.text = data?.data?.address ?? "";
      country.text = data?.data?.country ?? "";
    } catch (e) {
      print("خطأ أثناء جلب البيانات: $e");
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showSnackBar("حدث خطأ أثناء تحميل المعلومات");
      });
    }
    isloading = false;
    update();
  }
}
