import 'package:Pationt_Donor/core/core_components/appointment_card.dart';
import 'package:Pationt_Donor/core/core_components/appointment_in_hold_card.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/appointment_in_hold_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen2.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class AppointmentInHold extends StatefulWidget {
   AppointmentInHold({super.key});

  static const name = '/myappointmentsinhold';
  
  static final page = GetPage(
    name: name,
    page: () =>  AppointmentInHold(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );
  @override
  State<AppointmentInHold> createState() => AppointmentInHoldState();
}

class AppointmentInHoldState extends State<AppointmentInHold> {
     AppointmentInHoldController controller = Get.put<AppointmentInHoldController>(AppointmentInHoldController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: Border.all(),
            leading: Padding(
              padding: EdgeInsets.only(right: 4.vmin),
              child: Image.asset("assets/images/logoo.png", width: 25.vmin),
            ),
            title: Text("مواعيد قيد المعالجة",
                style:
                    TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5.vmin),
              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                        GetBuilder<AppointmentInHoldController>(
                          initState: (state) {
                            controller.myAppointmentsinhold();
                          },
                          builder: (controller) {
                            if (controller.isloading) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return SizedBox
                            
                            (
                              child: RefreshIndicator(
                                
                                onRefresh: () async => controller.myAppointmentsinhold(),
                                child: ListView.builder(
                                  
                                   shrinkWrap: true,
                                    itemCount: controller.data?.length,
                                    itemBuilder: (context, i) {
                                      return AppointmentInHoldCard(
                                        
                                        model: controller.data![i],
                                        index: i,
                                      );
                                    }),
                              ),
                            );
                          },
                        ),
                
                ],
              ),
            ),
          )),
        ),
      ],
    );
  }
}
