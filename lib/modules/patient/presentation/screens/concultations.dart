import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import '../../../../core/core_components/custom_dropdown.dart';


 class Consultations extends StatefulWidget {
  const Consultations ({super.key});

  static const name = '/consultations';

  static final page = GetPage(
    name: name,
    page: () =>  const Consultations(),
  );

  @override
  State<Consultations> createState() => ConsultationsState();
}
class ConsultationsState extends State<Consultations> {
  String? selectedValue;
  final Map<String, List<String>> data = {
    'عينية': ['علي', 'حازم', 'همام'],
    'هضمية': ['تميم', 'عاصم', 'زهير'],
    'قلبية': ['ايمن', 'تمام', 'كاظم'],
  };
  final globalController = Get.find<GlobalTextController>();
  @override
  Widget build(BuildContext context,) {
    return Stack(
      children: [
       Wallpaper(
         num: 0.3,
         image: "assets/images/pattern.png",
       ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:  EdgeInsets.all(10.vmin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDropdown(
                      items: data.keys.toList(),
                      hint1: "التخصص",
                  onChanged: (val){},
                  showSecondDropdown: false,
                  )
                  ,SizedBox(
                    height: 10.vmin,
                  ),
                 AppTextFormField1( hint: "اكتب استشارتك",
                   controller: globalController.controller,
                   minlines: 4,
                 ),
                  SizedBox(
                    height: 10.vmin,
                  ),
                  AppButton(
                      text: "تم",
                      ontap:(){
                    globalController.submitAndClear(
                      context," تم كتابة الاستشارة,سيتم الرد في اقرب وقت") ;
                  } )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
