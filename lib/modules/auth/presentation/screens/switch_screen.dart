import 'package:Pationt_Donor/modules/auth/presentation/controllers/login/login_controller.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login_screen_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login_screen_donor.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/d_home_screen.dart';
import '../../../../core/const/const_colors.dart';
import 'login.dart';

class SwitchScreen extends StatelessWidget {
  late final String userRole;

  SwitchScreen({super.key});

  static const name = "/1";

  static final page = GetPage(name: name, page: () => SwitchScreen());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(num: 0.5, image: "assets/images/care.jpg"),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text("يرجى اختيار طريقة تسجيل ",
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: ConstColors.darkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.57.spa)),
                SizedBox(
                  height: 1.h,
                ),
                Text("الدخول المناسبة: ",
                    //textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: ConstColors.darkBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.57.spa)),
                SizedBox(
                  height: 15.vmin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppButton(
                      width: 40.vmin,
                      ontap: () {
                        Get.to(() => LoginScreen5(
                              role: "patient",
                            ));
                        //Get.to( ()=>LoginScreen.name,arguments: {'role':'patient'});
                      },
                      text: 'مريض',
                    ),
                    AppButton(
                      width: 40.vmin,
                      ontap: () {
                        Get.to(() => LoginScreen5(role: 'donor'));
                      },
                      //Get.to(()=>LoginScreen.name, arguments: {'role':'donor'}),
                      text: "متبرع",
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
