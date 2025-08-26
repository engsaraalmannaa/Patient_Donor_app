import 'package:Pationt_Donor/core/core_components/appointment_card.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_consultations.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class MyAppointments extends StatefulWidget {
   MyAppointments({super.key});

  static const name = '/myappointments';
  static final page = GetPage(
    name: name,
    page: () =>  MyAppointments(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );
  @override
  State<MyAppointments> createState() => MyAppointmentsState();
}

class MyAppointmentsState extends State<MyAppointments> {
    MyAppointmentController controller = Get.put<MyAppointmentController>(MyAppointmentController());

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(right: 4.vmin),
              child: Image.asset("assets/images/logoo.png", width: 25.vmin),
            ),
            title: Text(" مواعيدي",
                style:
                    TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.vmin),
              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                        GetBuilder<MyAppointmentController>(
                    
                          builder: (controller) {
                            final filtered = controller.data!
                                      .where((item) => item.meetStatus != "rejected")
                                      .toList();
                            if (controller.isloading) {
                              return SizedBox(height:500,child:  Center(child: CircularProgressIndicator()));
                            }
                            if (filtered.isEmpty) {
        return SizedBox(
          height: 500,
          child: Center(
            child: Text(
              "لا يوجد مواعيد",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        );
      }
                            
                            return ListView.builder(
                              
                               shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.data!.where((item) => item.meetStatus != "rejected")
                                    .length,
                                itemBuilder: (context, i) {
                                   
                                      
                            
                                  return MyAppointmentCard(
                                    
                                    model: filtered[i],
                                    index: i,
                                  );
                                });
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
