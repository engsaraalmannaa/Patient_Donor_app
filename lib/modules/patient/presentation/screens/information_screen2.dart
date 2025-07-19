import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen3.dart';

import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class InformationScreen2 extends StatelessWidget {
  const InformationScreen2({super.key});
  static const name = '/information2';
  static final page = GetPage(
    name: name,
    page: () => const InformationScreen2(),
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
        actions: [
          IconButton(
              onPressed:()=> Navigator.pop(context,),
              icon: Icon(Icons.arrow_forward,size: 10.vmin,)),
        ],
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
          child:
          SingleChildScrollView(
            child: 
            Padding(
                padding: EdgeInsets.all(5.vmin),
              child:Column(
                children: [
                  AppTextFormField(
                    hint: "العنوان",
                    // controller: ,
                    // validator: ,
                  ),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField(
                    hint: "رقم الموبايل",
                    // controller: ,
                    // validator: ,
                  ),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField(
                    hint: "الحالة الاجتماعية",
                    // controller: ,
                    // validator: ,
                  ),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField(
                    hint: "رقم موبايل للطوارئ",
                    // controller: ,
                    // validator: ,
                  ),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField(
                    hint: "الرقم الوطني",
                    // controller: ,
                    // validator: ,
                  ),
                  SizedBox(
                    height: 5.vmin,
                  ),
                  AppTextFormField(
                    hint: "البريد الإلكتروني",
                    // controller: ,
                    // validator: ,
                  ),

                  SizedBox(
                    height: 10.vmin,
                  ),
                  AppButton(
                      text: "التالي",
                      ontap: (){
                        Get.toNamed(InformationScreen3.name);
                      }),
                  SizedBox(
                    height: 10.vmin,
                  )
                ],
              ),
            ),
          ) ),
    ),
      
      ],
    );
  }
}
