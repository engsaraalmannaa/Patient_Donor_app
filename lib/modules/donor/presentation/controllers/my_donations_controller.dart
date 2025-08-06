import 'package:Pationt_Donor/modules/donor/data/data_source/my_donations_data_sourse.dart';
import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyDonationsController extends GetxController {
  List<DonationModel>? data = [];

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
      
      final alldonations = await MyDonationsDataSourse.getAllDonations();
      // data = allAppointments.where((appointment) =>
      //         appointment.meetStatus == "accepted" ||
      //         appointment.meetStatus == "done")
      //     .toList();
    } catch (e) {
      print("Error loading appointments: $e");
      data = await MyDonationsDataSourse .getAllDonations();
    }
    isloading = false;
    update();
  }
}
