import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';

class DonationState extends StatefulWidget {
  const DonationState({super.key});
  static const name = '/donationstate';

  static final page = GetPage(
    name: name,
    page: () => const DonationState(),
  );

  @override
  State<DonationState> createState() => _DonationStateState();
}

class _DonationStateState extends State<DonationState> {
  final globalController = Get.find<GlobalTextController>();

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
          body: Padding(
            padding:  EdgeInsets.all(5.vmin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppTextFormField1(
                    minlines: 4,
                      hint: "الحالة المرضية",
                      controller:globalController.controller),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField1(hint: "المبلغ المطلوب",
                      controller: globalController.controller,
                      minlines: 1),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField1(
                      hint: "درجة خطورة المرض",
                      controller: globalController.controller,
                      minlines: 1),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField1(
                      hint: "الوقت الازم لاجراء العملية ",
                      controller: globalController.controller,
                      minlines: 1),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppButton(
                      text:"تم",
                      ontap:() {
                        globalController.submitAndClear(
                            context," تم تقديم طلب التبرع ,سيتم الرد في اقرب وقت") ;
                      } )

                ],
              ),
            ),
          ),
        )
      ],
    );

  }
}
