import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_donor_controller.dart';
import 'package:get/get.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_patient_controller.dart';

class RegisterBinding extends Bindings {
 
  

  @override
  void dependencies() async {
   
    final role = CacheHelper.get('userRole');
   

    if (role == "patient") {
      Get.put(RegisterpatientController());
    } 
     else if ( role == " donor") {
    Get.put(RegisterdonorController());

    }
  }
}
