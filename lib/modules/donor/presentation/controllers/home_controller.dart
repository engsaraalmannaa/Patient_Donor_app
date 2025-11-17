import 'dart:io';
import 'dart:math';

import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/data_source/home_data_sourse.dart';
import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
import 'package:Pationt_Donor/modules/donor/data/model/show_disease_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class HomeControllerd extends GetxController {
  List<Data>? data = [];
  int? idConsltation;
  @override
  void onInit() {
    super.onInit();
    Diseases();
  }

  bool isloading = false;

  Future<void> Diseases() async {
    isloading = true;
    update();
    try {
      final result = await HomeDataSourse.getAllDisease();
      data = result;
    } catch (e) {
      print("Error fetching diseases: $e");
    }
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isloadingd = false;
  ShowDiseaseModel? data1;
  Future<void> showDiseases() async {
    isloadingd = true;
    update();
    try {
      data1 = await HomeDataSourse.getthisdiseas(idConsltation!);
    } catch (e) {
      print("Error fetching diseases: $e");
    }

    print("hloo");
    isloadingd = false;
    update();
  }

  final TextEditingController amount = TextEditingController();

  File? image;
  String? disease_id;
  String replyText = "";
  String replyText1 = "";

  bool isloadingpostdonation = false;
  Future<void> postdonation() async {
    if (amount == null) {
      showSnackBar("الرجاء اختيار صورة للتبرع");
      return;
    }
    if (image == null) {
      showSnackBar("الرجاء اختيار صورة للتبرع");
      return;
    }
    isloadingpostdonation = true;
    update();
    try {
      final formData = dio.FormData.fromMap({
        "disease_id":data1!.data!.id ,
        "amount": amount.text,
        if (image != null)
          "image": await dio.MultipartFile.fromFile(
            image!.path,
            filename: image!.path.split('/').last,
          ),
        
      });
      final result = await HomeDataSourse.postdonation(formData);

      replyText1 = image?.path ?? "";
      replyText = amount.toString() ?? "";
      return;
    } catch (e) {
      showSnackBar("فشل في إرسال الاستشارة");
      return;
    } finally {
      isloadingpostdonation = false;
      update();
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      update(); 
       }
  }

  Map<int, int> patientRandomNumbers = {};

  Future<int> gePersistentRandomNumber(int patientId) async {
    int? storedNumber = await CacheHelper.get<int>('patient_$patientId');

    if (storedNumber != null) {
      patientRandomNumbers[patientId] = storedNumber;
      return storedNumber;
    }
    int randomNumber = 1000 + Random().nextInt(9000);
    patientRandomNumbers[patientId] = randomNumber;

    await CacheHelper.set(key: 'patient_$patientId', value: randomNumber);

    return randomNumber;
  }
}
