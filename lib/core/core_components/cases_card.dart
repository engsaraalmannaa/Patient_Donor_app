import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/details.dart';

import '../const/const_colors.dart';

class CasesCard extends StatefulWidget {
  // النص الكامل
  //final VoidCallback onViewDetails; // ما يحدث عند الضغط على الزر

  const CasesCard(
      {super.key, required this.ontap, required this.model, required this.index

      //required this.fullText,
      //required this.onViewDetails
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
      child: InkWell(
        onTap: () {
          // final controller = Get.find<HomeControllerd>();
          // controller.idConsltation = controller.data![index].id.toString();
          // Get.to(() => Consultation(model: model));
        },
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
                     "حالة تبرع :",
                    //caseData?.patient?.firstName ?? "بدون اسم",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  subtitle: Text(
                    caseData == null ? '-' : buildCaseSubtitle(caseData),
                    // 'الحالة: ${caseData?.patientStatus ?? "-"}\n'
                    // 'المطلوب: ${caseData?.neededAmount ?? 0}',
                    //maxLines: 5,
                    //overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  isThreeLine: true,
                  // trailing: CircleAvatar(
                  //   backgroundColor: Colors.white54,
                  //   radius: 5.5.vmin,
                  //   child: Icon(
                  //     Icons.person,
                  //     color: Colors.indigo,
                  //   ),
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 String buildCaseSubtitle(Data d) {
  final lines = <String>[
    'حالة المريض: ${d.patientStatus ?? '-'} ',
    'حالة التبرع: ${d.donationStatus ?? '-'} ',
    'درجة الخطورة: ${d.urgencyLevel ?? '-'} ',
    'مرئية للمتبرعين : ${d.isShown == 1 ? 'نعم' : 'لا'}',
    'المطلوب: ${d.neededAmount ?? 0}   |   المجمع: ${d.collectedAmount ?? 0}   |   المتاح: ${d.availableMoney ?? 0}',
    'الحد النهائي: ${d.finalTime ?? '-'}',
    'أُنشئ في: ${d.createdAt ?? '-'}   |   عُدّل في: ${d.updatedAt ?? '-'}',
    if (d.doctor != null)
      'الطبيب: ${d.doctor?.firstName ?? ''} ${d.doctor?.lastName ?? ''} (ID: ${d.doctor?.id ?? '-'})',
    if (d.patient != null)
      'معلومات إضافية للمريض: ${d.patient?.status ?? '-'} | فصيلة الدم: ${d.patient?.bloodType ?? '-'}',
  ];

  return lines.join('\n');
}
