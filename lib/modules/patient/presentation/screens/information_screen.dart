import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen2.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  static const name = '/information';
  static final page = GetPage(
    name: name,
    page: () => const InformationScreen(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );

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
            leading:  Padding(
              padding:  EdgeInsets.only(right:4.vmin),
              child: Image.asset("assets/images/logoo.png",
                  width:25.vmin
              ),
            ),
            title:  Text("المعلومات الشخصية",
                style: TextStyle(
                    fontSize: 14.spa,
                    fontWeight: FontWeight.w600)
            ),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(5.vmin),
                  child: Column(
                    children: [
                      AppTextFormField(
                        hint: "الاسم",
                       // controller: ,
                      // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "اسم الأب",
                       // controller: ,
                      // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "الكنية",
                       // controller: ,
                      // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "الجنس",
                       // controller: ,
                      // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "تاريخ الميلاد",
                       // controller: ,
                      // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      SizedBox(
                        height: 10.vmin,
                      ),
                      AppButton(
                          text: "التالي",
                          ontap: (){
                            Get.toNamed(InformationScreen2.name);
                          }),
                      SizedBox(
                        height: 10.vmin,
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
//TODO :: قائمة منسدلة و validator controlller