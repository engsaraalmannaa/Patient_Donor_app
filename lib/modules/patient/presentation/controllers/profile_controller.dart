import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/profile_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfilePatientController extends GetxController {
  // late Data model;
  // ProfilePatientController(this.model);

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
    social_status.text = CacheHelper.get("social_status") ?? "";
    emergency_num.text = CacheHelper.get("emergency_num") ?? "";
    insurance_company.text = CacheHelper.get("insurance_company") ?? "";
    insurance_num.text = CacheHelper.get("insurance_num") ?? "";
    smoker.text = CacheHelper.get("smoker") ?? "";
    pregnant.text = CacheHelper.get("pregnant") ?? "";
    blood_type.text = CacheHelper.get("blood_type") ?? "";
    genetic_diseases.text = CacheHelper.get("genetic_diseases") ?? "";
    chronic_diseases.text = CacheHelper.get("chronic_diseases") ?? "";
    drug_allergy.text = CacheHelper.get("drug_allergy") ?? "";
    last_operations.text = CacheHelper.get("last_operations") ?? "";
    present_medicines.text = CacheHelper.get("present_medicines") ?? "";
  }

  final TextEditingController first_name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController father_name = TextEditingController();
  final TextEditingController last_name = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController birth_data = TextEditingController();
  final TextEditingController national_number = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController social_status = TextEditingController();
  final TextEditingController emergency_num = TextEditingController();
  final TextEditingController insurance_company = TextEditingController();
  final TextEditingController insurance_num = TextEditingController();
  final TextEditingController smoker = TextEditingController();
  final TextEditingController pregnant = TextEditingController();
  final TextEditingController blood_type = TextEditingController();
  final TextEditingController genetic_diseases = TextEditingController();
  final TextEditingController chronic_diseases = TextEditingController();
  final TextEditingController drug_allergy = TextEditingController();
  final TextEditingController last_operations = TextEditingController();
  final TextEditingController present_medicines = TextEditingController();
  bool isloading = false;
  PatientProfileModel? data;



  Future<void> Profileinfo() async {
    isloading = true;
    update();
    try{
    data = await ProfileDataSourcePatient.getProfileInfo();

      // إذا حابب تعبي الفيلدات تلقائياً من البيانات:
      first_name.text = data?.data?.firstName ?? "";
      father_name.text = data?.data?.fatherName ?? "";
      last_name.text = data?.data?.lastName ?? "";
      email.text = data?.data?.email ?? "";
      phone.text = data?.data?.phone ?? "";
      gender.text = data?.data?.gender ?? "";
      birth_data.text = data?.data?.birthDate ?? "";
      national_number.text = data?.data?.nationalNumber ?? "";
      address.text = data?.data?.address ?? "";
      social_status.text = data?.data?.socialStatus ?? "";
      insurance_company.text = data?.data?.insuranceCompany ?? "";
      emergency_num.text = data?.data?.emergencyNum ?? "";
      insurance_num.text = data?.data?.insuranceNum ?? "";
      smoker.text = data?.data?.smoker.toString() ?? "";
      pregnant.text = data?.data?.pregnant.toString() ?? "";
      blood_type.text = data?.data?.bloodType ?? "";
      genetic_diseases.text = data?.data?.geneticDiseases ?? "";
      chronic_diseases.text = data?.data?.chronicDiseases ?? "";
      drug_allergy.text = data?.data?.drugAllergy ?? "";
      last_operations.text = data?.data?.lastOperations ?? "";
      present_medicines.text = data?.data?.presentMedicines ?? "";
  
    } catch (e) {
      print("خطأ أثناء جلب البيانات: $e");
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showSnackBar("حدث خطأ أثناء تحميل المعلومات");
      });
    }

    isloading = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }




   Future<void> updatepatientprofile() async {
    isloading = true;
    update();
    await Future.delayed(Duration(seconds: 1)); // تمثيل التأخير

    // بعدها خزن القيم الجديدة
    await CacheHelper.set(key: "user_name", value: first_name.text);
    await CacheHelper.set(key: "user_email", value: email.text);
    await CacheHelper.set(key: "user_phone", value: phone.text);
    await CacheHelper.set(key: "user_father_name", value: father_name.text);
    await CacheHelper.set(key: "user_last_name", value: last_name.text);
    await CacheHelper.set(key: "user_gender", value: gender.text);
    await CacheHelper.set(key: "user_birth_data", value: birth_data.text);
    await CacheHelper.set(key: "user_national_number", value: national_number.text);
    await CacheHelper.set(key: "user_address", value: address.text);
    await CacheHelper.set(key: "user_social_status", value: social_status.text);
    await CacheHelper.set(key: "user_emergency_num", value: emergency_num.text);
    await CacheHelper.set(key: "user_insurance_company", value: insurance_company.text);
    await CacheHelper.set(key: "user_insurance_num", value: insurance_num.text);
    await CacheHelper.set(key: "user_smoker", value: smoker.text);
    await CacheHelper.set(key: "user_pregnant", value: pregnant.text);
    await CacheHelper.set(key: "user_blood_type", value: blood_type.text);
    await CacheHelper.set(key: "user_chronic_diseases", value: chronic_diseases.text);
    await CacheHelper.set(key: "user_genetic_diseases", value: genetic_diseases.text);
    await CacheHelper.set(key: "user_drug_allergy", value: drug_allergy.text);
    await CacheHelper.set(key: "user_last_operations", value: last_operations.text);
    await CacheHelper.set(key: "user_present_medicines", value: present_medicines.text);


    try {
      await ProfileDataSourcePatient.editprofilepatient(
        first_name: first_name.text,
        email: email.text,
        phone: phone.text, 
        father_name:father_name.text,
         last_name: last_name.text,
          gender: gender.text,
           birth_date: birth_data.text,
           address: address.text,
           blood_type: blood_type.text,
           chronic_diseases: chronic_diseases.text,
           drug_allergy: drug_allergy.text,
           emergency_num: emergency_num.text,
           genetic_diseases: genetic_diseases.text,
           insurance_company: insurance_company.text,
           insurance_num: insurance_num.text,

           last_operations: last_operations.text,
           national_number: national_number.text,
           pregnant: pregnant.text,
           present_medicines: present_medicines.text,
           smoker: smoker.text,
           social_status: social_status.text
         
      );
      var replyText = first_name.text;
      showSnackBar("تم إرسال الرد بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الرد");
    }
    isloading = false;
    update();
  }

}
