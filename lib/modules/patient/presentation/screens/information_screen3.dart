import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen4.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class InformationScreen3 extends StatelessWidget {
  const InformationScreen3({super.key});
  static const name = '/information3';
  static final page = GetPage(
    name: name,
    page: () => const InformationScreen3(),
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
           actions: [
             IconButton(
           onPressed:()=> Navigator.pop(context,),
    icon: Icon(Icons.arrow_forward,size: 10.vmin,)),

           ],
         ),
         /* appBar: AppBar(
            shape: Border.all(),
            leading: IconButton(
                onPressed:()=> Navigator.pop(context,),
                icon: Icon(Icons.arrow_back,size: 10.vmin,)),
            actions: [
              Text("المعلومات الشخصية",style: TextStyle(
                  fontSize: 14.spa,
                  fontWeight: FontWeight.w600)
              ),
              SizedBox(
                  width: 1.vmin
              ),
              Image.asset("assets/images/logoo.png",
                width: 11.vmin,),
              SizedBox(
                  width: 3.vmin
              ),
            ],
          ),*/
          body: SafeArea(
              child:
              SingleChildScrollView(
                child:
                Padding(
                  padding: EdgeInsets.all(5.vmin),
                  child:Column(
                    children: [
                      AppTextFormField(
                        hint: "هل أنت حامل",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "زمرة الدم",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "أمراض وراثية",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "أمراض مزمنة",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "أدوية تحسسية",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "عمليات سابقة",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: "أدوية حالية",
                        // controller: ,
                        // validator: ,
                      ),
                      SizedBox(
                        height: 10.vmin,
                      ),
                      AppButton(
                          text: "التالي",
                          ontap: (){
                            Get.toNamed(InformationScreen4.name);
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
