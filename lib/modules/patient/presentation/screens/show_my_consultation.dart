

import 'package:Pationt_Donor/core/core_components/my_consultations_card.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_consultation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowMyConsultation extends StatefulWidget {
  ShowMyConsultation({super.key});

  static const name = '/myconsultations';

  static final page = GetPage(
    name: name,
    page: () => ShowMyConsultation(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );
  @override
  State<ShowMyConsultation> createState() => ShowMyConsultationState();
}

class ShowMyConsultationState extends State<ShowMyConsultation> {
  MyConsultationController controller =
      Get.put<MyConsultationController>(MyConsultationController());

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
          // appBar: AppBar(
          //   shape: Border.all(),
          //   leading: Padding(
          //     padding: EdgeInsets.only(right: 4.vmin),
          //     child: Image.asset("assets/images/logoo.png", width: 25.vmin),
          //   ),
          //   title: Text("استشاراتي ",
          //       style:
          //           TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
          //            actions: [
          //     IconButton(
          //       onPressed: () => Navigator.pop(context),
          //       icon: Icon(
          //         Icons.arrow_forward,
          //         size: 10.vmin,
          //       ),
          //     ),
          //   ],
          // ),
          body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(1.vmin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: 2.h),
                    Expanded(
                      child: GetBuilder<MyConsultationController>(
                        initState: (state) {
                          controller.myconsultations();
                        },
                        builder: (controller) {
                         
                          if (controller.isloading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (controller.data == null || controller.data!.isEmpty) {
                            return SizedBox(
                              height: 70.h, // تعطي ارتفاع مناسب لتكون الرسالة في منتصف الشاشة تقريباً
                              child: Center(
                                child: Text(
                                  'لا يوجد استشارات لعرضها',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            );
                          }
                          return SizedBox(
                            child: RefreshIndicator(
                              onRefresh: () async =>
                                  controller.myconsultations(),
                              child: ListView.builder(
                                  //shrinkWrap: true,
                                  itemCount: controller.data?.length,
                                  itemBuilder: (context, i) {
                                    return MyConsultationsCard(
                                      model: controller.data![i],
                                      index: i,
                                    );
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
