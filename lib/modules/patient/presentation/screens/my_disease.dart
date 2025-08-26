import 'package:Pationt_Donor/core/core_components/my_disease_card.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_disease_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/consultation_detail_screen.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';

class MyDisease extends StatefulWidget {
  const MyDisease({super.key});
  static const name = '/MyDisease';
  static final page = GetPage(
    name: name,
    page: () => const MyDisease(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );

  @override
  State<MyDisease> createState() => _MyDiseaseState();
}

class _MyDiseaseState extends State<MyDisease> {
  MyDiseaseController controller = Get.put<MyDiseaseController>(MyDiseaseController());
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
           leading:  Padding(
             padding:  EdgeInsets.only(right:4.vmin),
             child: Image.asset("assets/images/logoo.png",
                 width:25.vmin
             ),
           ),
           title:  Text(" طلباتي للتبرع",
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
         
          body: SafeArea(
              child:controller.isloading
                    ? SizedBox(height: 700,child: Center(child: CircularProgressIndicator()))
                    :
              SingleChildScrollView(
                child:
                Padding(
                  padding: EdgeInsets.all(1.vmin),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GetBuilder<MyDiseaseController>(
                    initState: (state) {
                      controller.mydisease();
                    },
                    builder: (controller) {
                     
                      if (controller.isloading) {
                        return Column(
                          children: [
                            SizedBox(height: 20.h,),
                            Center(child: CircularProgressIndicator()),
                          ],
                        );
                      }
                      return SizedBox(
                        child: RefreshIndicator(
                          onRefresh: () async =>
                              controller.mydisease(),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.data?.length ??0,
                              itemBuilder: (context, i) {
                                return MyDiseaseCard(
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
              ) ),
        ),

      ],
    );
  }
}
