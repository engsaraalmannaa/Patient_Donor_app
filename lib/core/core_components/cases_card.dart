import 'dart:math';

import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
import 'package:Pationt_Donor/modules/donor/data/model/show_disease_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/this_disease_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/details.dart';

import '../const/const_colors.dart';

class CasesCard extends StatefulWidget {
  const CasesCard({
    super.key,
    required this.ontap,
    required this.model,
    required this.index,
  });
  final VoidCallback ontap;
  final Data model;
  final int index;

  @override
  State<CasesCard> createState() => _CasesCardState();
}

class _CasesCardState extends State<CasesCard> {
  HomeControllerd controller = Get.find<HomeControllerd>();

  @override
  Widget build(BuildContext context) {
    final caseData = widget.model;
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
                  "حالة تبرع : ${widget.index+1}",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.indigo),
                ),
                
                subtitle:
                 FutureBuilder<int>(
                  future: controller.gePersistentRandomNumber(caseData.patientId!),
                   builder: (context,snapshot) {
                     if (!snapshot.hasData) return CircularProgressIndicator();
                     return Text(
                      caseData == null ? '-' : buildCaseSubtitle(caseData,  snapshot.data!),
                      textAlign: TextAlign.right, maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                                     );
                   }
                 ),
                isThreeLine: true,
                trailing: SizedBox(
                  
                  width: 25.vmin,
                  child: Center(
                    child: InkWell(
                        child: CircleAvatar(
                            backgroundColor: ConstColors.darkBlue,
                            child: IconButton(
                                onPressed: () {
                                  final controller = Get.find<HomeControllerd>();
                                  controller.idConsltation = widget.model.id!;
                                  controller.showDiseases();
                                  Get.toNamed(
                                    ThisDiseaseDetails.name,
                                    arguments: {
     "diseaseId": controller.idConsltation,
    "model": widget.model,
  },
                                  );
                                },
                                icon: Icon(Icons.remove_red_eye,
                                    color: Colors.white)))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String buildCaseSubtitle(Data d,int patientNumber) {
  
  final lines = <String>[
    ' المريض: ${ patientNumber?? '-'} ',
    'حالة المريض: ${d.patientStatus != null ? "جديد  " : "" '-'} ',
    'حالة التبرع: ${d.donationStatus != null ? "في الانتظار " : "" '-'} ',

    'درجة الخطورة: ${d.urgencyLevel ?? '-'} ',
    
   ];

  return lines.join('\n');
}
