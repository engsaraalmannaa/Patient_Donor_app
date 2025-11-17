import 'package:Pationt_Donor/modules/patient/data/data_source/appointment_in_hold_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/appointment_in_hold_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment_in_hold.dart';
import 'package:get/get.dart';

class AppointmentInHoldController extends GetxController {
  List<Data>? data;

  bool isloading = false;
  Future<void> myAppointmentsinhold() async {
    isloading = true;
    update();

    data = (await AppointmentInHoldDataSource.getAllAppointmentInHold());
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isLoadingDel = false;
  Future<void> deleteappointmentrequist(int id) async {
    print('>> بدء حذف الموعد id: $id');
    isLoadingDel = true;
    update();
    final result =
        await AppointmentInHoldDataSource.deletrappointrequist(id: id);
    print(' نتيجة الحذف: $result');
    isLoadingDel = false;
    update();
    if (result) {
      Get.back();
      await myAppointmentsinhold();
    } else {
      print(' فشل الحذف!');
    }
    update();
  }
}
