import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_donor_controller.dart';
import 'package:get/get.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_patient_controller.dart';

class RegisterBinding extends Bindings {
  //late final UserRole = "patient"; // أو من Get.arguments['role']

  @override
  void dependencies() async {
    //await CacheHelper.set(key: 'userRole', value: UserRole); // تخزين role

    //Get.put(RegisterController());
        //final role = Get.arguments?['role'] ?? 'patient';
    final role = CacheHelper.get('userRole');


    if (role == "patient") {
      Get.put(RegisterpatientController());
    } 
     else {
    Get.put(RegisterdonorController());

    }
  }
}
