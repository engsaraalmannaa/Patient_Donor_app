import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/patient/data/model/show_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_disease.dart';

import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class ShowConsultations extends StatefulWidget {
  final int consultationId;

  ShowConsultations({super.key, required this.consultationId});
  static const name = '/showconsultations';
  static final page = GetPage(
    name: name,
    page: () => ShowConsultations(
      consultationId: Get.arguments,
    ),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );

  @override
  State<ShowConsultations> createState() => _ShowConsultationsState();
}

class _ShowConsultationsState extends State<ShowConsultations> {
  ConsultationData? data1;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.idConsltation = widget.consultationId;
    
    });
    return GetBuilder<HomeController>(
        
        builder: (controller) {
      return Stack(
        children: [
          Wallpaper(
            num: 0.3,
            image: "assets/images/pattern.png",
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pop(
                          context,
                        ),
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 10.vmin,
                    )),
              ],
              
              leading: Padding(
                padding: EdgeInsets.only(right: 4.vmin),
                child: Image.asset("assets/images/logoo.png", width: 25.vmin),
              ),
              title: Text("المعلومات الشخصية",
                  style:
                      TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
            ),
            body: SafeArea(
                child: controller.isloadingConsultations
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(3.vmin),
                          child: Column(
                            children: [
                              Card(
                                elevation: 4,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ConstColors.darkBlue,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5.vmin)),
          borderOnForeground: true,
          color: Colors.white54,
                                child: ListTile(
                                  title: Text(
                                    "التخصص: ${controller.data1?.specialty?.name ?? "غير محدد"}\n"
                                    "بتاريخ: ${controller.data1?.createdAt?.split('T').first ?? "غير معروف"}\n"
                                    "اسم المريض: ${controller?.data1?.patient?.firstName ?? ""} "
                                        "${controller?.data1?.patient?.fatherName ?? ""} "
                                        "${controller?.data1?.patient?.lastName ?? ""}\n"
                                        "الجنس: ${controller?.data1?.patient?.gender ?? "غير محدد"}\n"
                                        "الحالة الاجتماعية: ${controller?.data1?.patient?.socialStatus ?? "غير محددة"}\n"
                                        "نوع الدم: ${controller?.data1?.patient?.bloodType ?? "غير معروف"}\n"
                                        "الأمراض المزمنة: ${controller?.data1?.patient?.chronicDiseases ?? "لا يوجد"}\n"
                                        "الأدوية الحالية: ${controller?.data1?.patient?.presentMedicines ?? "لا يوجد"}",
                                    style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,),),
                                  subtitle: Column(
                                    children: [
                                      // Text(
                                      //     ),
                                      Text( "السؤال: ${controller.data1?.question ?? "لا يوجد"}",
                                        style: TextStyle(color: ConstColors.darkBlue),)
                                    ],
                                  ),
                                ),
                              ),
                               SizedBox(height: 1.vmin),
                              if (controller.data1!.answers != null &&
                        controller.data1!.answers!.isNotEmpty)
                      ...controller.data1!.answers!.map((answer) {
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5.vmin),
                          ),
                          color: Colors.white54,
                          child: ListTile(
                            title: Text(
                             " الدكتور: ${answer.doctor?.firstName ?? ""} "
                                        "${answer.doctor?.fatherName ?? ""} "
                                        "${answer.doctor?.lastName ?? ""}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17.sp,
                              ),
                            ),
                            subtitle: Text(
                              "${answer.answer ?? ''}",
                              style: TextStyle(
                                color: Colors.blueGrey.shade700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList()
                    else
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: ConstColors.darkBlue,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        color: Colors.white54,
                        child: ListTile(
                          title: Text(
                            "لا يوجد إجابة",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),

                            ],
                          ),
                        ),
                      )),
          ),
        ],
      );
    });
  }
}
