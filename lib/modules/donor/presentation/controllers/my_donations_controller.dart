import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/modules/donor/data/data_source/my_donations_data_sourse.dart';
import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:Pationt_Donor/modules/donor/data/model/show_my_donation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class MyDonationsController extends GetxController {
  List<Data>? data = [];
  int? donationid;

  @override
  void onInit() {
    super.onInit();
    Donations();
  }

  bool isloading = false;
  Future<void> Donations() async {
    isloading = true;
    update();
    try {
      final result = await MyDonationsDataSourse.getAllDonations();
      data = result;
    } catch (e) {
      print("Error fetching diseases: $e");
    }
    //data = (await MyDonationsDataSourse.getAllDonations());
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isloadingd = false;
  Show_My_Donation_Model? data1;
  Future<void> showdonation() async {
    isloadingd = true;
    update();
    //   Data? data1;
    try {
      data1 = await MyDonationsDataSourse.getthisdonation(donationid!);
    } catch (e) {
      print("Error fetching diseases: $e");
    }

    print("hloo");
    isloadingd = false;
    update();
  }

  File? image;

  String replyText1 = "";

  bool isloadingeditdonation = false;
  Future<void> editdonation(int id) async {
    if (image == null) {
      showSnackBar("الرجاء اختيار صورة للتبرع");
      return;
    }
    isloadingeditdonation = true;
    update();
    try {
      final formData = dio.FormData.fromMap({
        "image": await dio.MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
          // contentType: MediaType('image', 'jpeg'), // اختياري
        ),
        "_method": "PUT",
      });
      final result = await MyDonationsDataSourse.updateDonorCase(id, formData);

      replyText1 = image?.path ?? "";

      return;
    } catch (e) {
      showSnackBar("فشل في إرسال الوصل");
      return;
    } finally {
      isloadingeditdonation = false;
      update();
    }
    //return result;
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      image = File(picked.path);
      update();
    }
  }
}
