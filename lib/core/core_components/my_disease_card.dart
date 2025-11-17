import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_disease_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/appointment_in_hold_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_disease_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDiseaseCard extends StatefulWidget {
  const MyDiseaseCard({
    super.key,
    required this.model,
    required this.index,
  });

  final Data model;
  final int index;

  @override
  State<MyDiseaseCard> createState() => MyDiseaseCardState();
}

class MyDiseaseCardState extends State<MyDiseaseCard> {
  final controller = Get.find<MyDiseaseController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            right: 1.vmin, left: 5.vmin, top: 1.vmin, bottom: 1.vmin),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ConstColors.darkBlue,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5.vmin)),
          borderOnForeground: true,
          color: Colors.white54,
          child: Padding(
            padding: EdgeInsets.only(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    "${widget.model.patient?.firstName ?? '-'} ${widget.model.patient?.lastName ?? '-'}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  subtitle: Text(
                    "اسم الطبيب: ${widget.model.doctor?.firstName ?? '-'} ${widget.model.doctor?.lastName ?? '-'}\n"
                    "الحالة المرضية:  ${widget.model.patientStatus ?? '-'} \n"
                    "درجة الخطورة:  ${widget.model.urgencyLevel ?? '-'} \n"
                    "حالة الطلب: ${widget.model.donationStatus == 'pending' ? 'في الانتظار' : '-'}\n"
                    "المبلغ المتاح:  ${widget.model.availableMoney ?? '-'} \n"
                    "المبلغ المطلوب:  ${widget.model.neededAmount ?? '-'} \n"
                    "المبلغ المجمع:  ${widget.model.collectedAmount ?? '-'} \n"
                    "الوقت النهائي:  ${widget.model.finalTime ?? '-'}\n"
                    "تاريخ الإضافة: ${widget.model.createdAt?.split("T").first}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
