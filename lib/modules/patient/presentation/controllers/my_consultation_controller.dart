import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/network/api_helper/api_enum.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/my_consultations_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/my_disease_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/write_consultation_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_disease_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyConsultationController extends GetxController {
  List<Consultation>? data;
  SpecialtiesModel? specialtiesModel;
  var specialties = <String>[].obs;

  bool isloading = false;
  Future<void> myconsultations() async {
    isloading = true;
    update();
    data = (await MyConsultationsDataSource.getAllMyConsultations());
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isLoadingDel = false;
  Future<bool> deletemyconsultation(int id) async {
    print('>> بدء حذف الاستشارة id: $id');
    isLoadingDel = true;
    update();
    final result = await MyConsultationsDataSource.deletemyconsultation(id: id);
    print(' نتيجة الحذف: $result');
    isLoadingDel = false;
    update();

    if (result) {
      Get.back();
      Get.back();
      await myconsultations();
    } else {
      print(' فشل الحذف!');
    }
    update();
    return result;
  }

  bool isloadingupdate = false;

  Future<void> updatemyconsultation(
      int id, int specialtyId, String question) async {
    TextEditingController question = TextEditingController();

    isloadingupdate = true;
    update();

    try {
      await MyConsultationsDataSource.editmyconsultation(
        id,
        specialtyId,
        question.text,
      );
      var replyText = question.text;

      showSnackBar("تم تعديل الاستشارة بنجاح");
    } catch (e) {
      showSnackBar("فشل في تعديل الاستشارة");
    }
    isloadingupdate = false;
    update();
  }

  bool isloadingconsultation = true;

  Future<void> getspecialety() async {
    try {
      isloadingconsultation = true;
      update();
      specialtiesModel = await WriteConsultationDataSource.getAllSpecialety();
      specialties.value = specialtiesModel?.data
              ?.map((e) => e.name ?? "")
              .where((name) => name.isNotEmpty)
              .toList() ??
          [];
    } catch (e) {
      Get.snackbar("خطأ", "حدث خطأ أثناء تحميل التخصصات");
    }
    isloadingconsultation = false;
    update();
  }
}
