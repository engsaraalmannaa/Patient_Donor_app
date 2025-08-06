import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/disease_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddDiseaseController extends GetxController {
  String? specialty_id;
  String? doctor_id;
  final TextEditingController patient_status = TextEditingController();
  final TextEditingController available_money = TextEditingController();
  final TextEditingController urgency_level = TextEditingController();
  final TextEditingController final_time = TextEditingController();
  //String? idConsltation;
    String patient_statusreplytext = "";
  String available_money_replytext = "";
  String urgency_levelreplyText = "";
  String final_timereplyText = "";



  bool isloading = false;
  Future<void> add_disease() async {
    isloading = true;
    update();
 try {

   await DiseaseDataSource.adddisease(
    specialty_id:specialty_id! ,
     doctor_id: doctor_id!,
      patient_status: patient_status.text,
       //available_money: available_money.text,
       available_money: int.tryParse(available_money.text) ?? 0,
        urgency_level: '',
         final_time: ''
       
      );
      patient_statusreplytext = patient_status.text;
      available_money_replytext = available_money.text;
      final_timereplyText = final_time.text;
      urgency_levelreplyText = urgency_level.text;

      patient_status.clear();
      available_money.clear();
      final_time.clear();
      urgency_level.clear();
      showSnackBar("تم إرسال الحالة بنجاح");
    } catch (e) {
      showSnackBar("فشل في إرسال الحالة");
    }
    isloading = false;
    update();
      // final int specialtyId = int.tryParse(specialety_idController.text) ?? 0;
      // final int doctorId = int.tryParse(doctor_idController.text) ?? 0;
       //final int availableMoney = int.tryParse(available_moneyController.text) ?? 0;

      // if (specialtyId == 0 || doctorId == 0 || availableMoney == 0) {
      //   showSnackBar("تحققي من القيم الرقمية"); // توجهي رسالة للمستخدم
      //   return;
      // }

    // final result = await DiseaseDataSource.adddisease(
    //     specialty_id: specialtyId,
    //     doctor_id: doctorId,
    //     urgency_level:urgency_levelController.text,
    //     available_money: availableMoney,
    //     final_time: final_timeController.text,
    //     patient_status: patient_statusController.text,
    //     ),
    // data = await DiseaseDataSource.adddisease();
    // print(data?.length.toString());
    // isloading = false;
    // update();
    // showSnackBar("تم الإرسال بنجاح ✅");
    // } catch (e) {
    //   showSnackBar("فشل في الإرسال: $e");
    // }
  }
}
