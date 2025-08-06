import 'dart:convert';

import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/write_consultation_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/specialties_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/data_source/consultation_data_source.dart';
import '../../data/model/consultation_model.dart';

class WriteConsultationController extends GetxController {
  String? specialty_id;
  List<SpecialtiesModel>? data = [];
  String replyText = "";
  String? selectedSpecialtyName;
  String? selectedSpecialtyId;
  SpecialtiesModel? specialtiesModel;
  var specialties = <String>[].obs;
  final TextEditingController question = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getspecialety();
  }

  var isloading = false;
  Future<void> getspecialety() async {
    try {
      isloading = true;
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
    isloading = false;
    update();
  }

  bool isloading_write_Consltation = false;
  Future<void> Writeconsultations() async {
    isloading_write_Consltation = true;
    update();
    try {
      await WriteConsultationDataSource.writeConsultations(
        question: question.text,
        specialty_id: specialty_id!,
      );
      replyText = question.text;
      question.clear();
      showSnackBar("تم إرسال الاستشارة بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الاستشارة");
    }
    isloading_write_Consltation = false;
    update();
  }
}
