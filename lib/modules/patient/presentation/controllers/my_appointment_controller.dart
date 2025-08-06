import 'package:Pationt_Donor/modules/patient/data/data_source/my_appointment_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_appointment_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyAppointmentController extends GetxController {
  List<Data>? data = [];
  @override
  void onInit() {
    super.onInit();
     myAppointments();
  }
  bool isloading = false;
  Future<void> myAppointments() async {
    isloading = true;
    update();
    
     final result = await MyAppointmentDataSource.getAllMyAppointment();
  //data = result.where((item) => item.meetStatus == " scheduled" || item.meetStatus == " accepted" ).toList();

    data = (await MyAppointmentDataSource.getAllMyAppointment());
    print(data?.length.toString());
    isloading = false;
    update();
  }

  bool isAccepting = false;
  Future<void> accept(int id) async {
    // final data = {
    //   "amount" : amountCont.text
    // };
    isAccepting = true;
    update();
    await MyAppointmentDataSource.acceptappointment(id);
    isAccepting = false;
    update();
    //myAppointments();
  }

  Future<void> reject(int id) async {
    isAccepting = true;
    update();
    await MyAppointmentDataSource.rejectappointment(id);
    isAccepting = false;
    update();
    //myAppointments();
  }
}
