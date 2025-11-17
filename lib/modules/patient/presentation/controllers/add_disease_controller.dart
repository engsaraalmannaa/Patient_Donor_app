import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/disease_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/doctorbyspecialety_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddDiseaseController extends GetxController {
  final isLoadingSpecialty = false.obs;
  final isLoadingDoctors = false.obs;
  bool isSubmitting = false;

  final specialties = <String>[].obs;
  DoctorBySpecialetyModel? doctorsOfSelected;

  final Map<String, String> specialtyNameToId = {};
  final Map<String, String> doctorNameToId = {};

  String? specialty_id;
  String? doctorId;
  final selectedSpecialty = RxnString(); 
  final selectedDoctor = RxnString(); 
  @override
  void onInit() {
    super.onInit();
   
  }

  Future<void> getSpecialties() async {
    try {
      isLoadingSpecialty.value = true;

      final res = await DiseaseDataSource.getAllSpecialety();
      specialties
        ..clear()
        ..addAll(res.data?.map((e) {
              specialtyNameToId[e.name ?? ''] = e.id.toString();
              return e.name ?? '';
            }).where((e) => e.isNotEmpty) ??
            []);
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل التخصصات");
    } finally {
      isLoadingSpecialty.value = false;
    }
  }

  Future<void> getDoctorsBySpecialty(String specialtyName) async {
    final id = specialtyNameToId[specialtyName];
    if (id == null) {
      Get.snackbar("خطأ", "لم يتم العثور على معرف التخصص");
      return;
    }
    specialty_id = id;

    isLoadingDoctors.value = true;
    try {
      final res = await DiseaseDataSource.getAlldoctorsbyspecialety(id: id);
     
      if ((res.data?.isEmpty ?? true)) {
        doctorsOfSelected = null; 
        showSnackBar("لا يوجد أطباء لهذا التخصص");
      } else {
        doctorsOfSelected = res;
      }
      selectedDoctor.value = null;
      doctorId = null;
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل الأطباء");
    } finally {
      isLoadingDoctors.value = false;
    }
  }

  void onDoctorSelected(String doctorIdSelected) {
  
    doctorId = doctorIdSelected;
    print("✅ تم اختيار الطبيب id = $doctorId");
   
  }

  final TextEditingController patient_status = TextEditingController();
  final TextEditingController available_money = TextEditingController();
  final TextEditingController urgency_level = TextEditingController();
  final TextEditingController final_time = TextEditingController();
  
  String patient_statusreplytext = "";
  String available_money_replytext = "";
  String urgency_levelreplyText = "";
  String final_timereplyText = "";
  bool isloading = false;

  Future<void> add_disease() async {
    isloading = true;
    update();
    try {
      if ( patient_status== null) {
      showSnackBar("الرجاء ادخال الحالة المرضية");
      return;
    }
    if (available_money == null) {
      showSnackBar("الرجاء ادخال المبلغ المتاح  ");
      return;
    }
    if (urgency_level == null) {
      showSnackBar("الرجاء اختيار درجة خطورة المرض ");
      return;
    }
    if (final_time == null) {
      showSnackBar("الرجاء ادخال الوقت النهائي  ");
      return;
    }
    if ( doctorId== null) {
      showSnackBar("الرجاء اختيار الطبيب ");
      return;
    }
  
      await DiseaseDataSource.adddisease(
          specialty_id: specialty_id!,
          doctor_id: doctorId!,
          patient_status: patient_status.text,
         
          available_money: int.tryParse(available_money.text) ?? 0,
          urgency_level: urgency_level.text,
          final_time: final_time.text);
      patient_statusreplytext = patient_status.text;
      available_money_replytext = available_money.text;
      final_timereplyText = final_time.text;
      urgency_levelreplyText = urgency_level.text;

      patient_status.clear();
      available_money.clear();
      final_time.clear();
      urgency_level.clear();
      showSnackBar("تم إرسال الطلب بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الطلب");
    }
    isloading = false;
    update();
  }
}
