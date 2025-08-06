import 'package:Pationt_Donor/modules/auth/presentation/controllers/login/login_middleware.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/switch_screen.dart';
import '../../../../core/const/const_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const name = "/";

  static final page = GetPage(
      name: name, page: () => SplashScreen(), middlewares: [LoginMiddleware()]);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: double.infinity,
      nextScreen: SwitchScreen(),
      splash: Stack(
        children: [
          Wallpaper(num: 0.7, image: "assets/images/care.jpg"),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("معاً لمجتمع ينبض بالصحة",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: ConstColors.darkBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.spa)),
                  SizedBox(height: 4.h),
                  SizedBox(
                    height: 6.h,
                    width: 6.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: ConstColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
 //TODO :: change icon , page Transition , change Font