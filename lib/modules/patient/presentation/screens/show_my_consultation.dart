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
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(1.vmin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GetBuilder<MyConsultationController>(
                    initState: (state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        controller.myconsultations();
                      });
                    },
                    builder: (controller) {
                      if (controller.isloading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (controller.data == null || controller.data!.isEmpty) {
                        return SizedBox(
                          height: 70.h,
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
                          onRefresh: () async => controller.myconsultations(),
                          child: ListView.builder(
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
