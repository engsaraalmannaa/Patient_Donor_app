import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  static const name = '/about_app';
  static final page = GetPage(
    name: name,
    page: () => const AboutAppScreen(),
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
            backgroundColor: ConstColors.darkBlue,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
            title: Text(
              'حول التطبيق',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 10.vmin),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تطبيق المريض الصحي",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ConstColors.darkBlue,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "هذا التطبيق مخصص لإدارة إستشارات ومواعيد المرضى. "
                  "يمكن للمرضى تسجيل المواعيد،تسجيل حالة تبرع، متابعة الاستشارات، والحصول على أوقات مواعيدهم لقبولها او رفضها . ",
                  style: TextStyle(
                    fontSize: 17.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "للتواصل مع الدعم الفني: ",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "support@hospitalapp.com",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(height: 2.h),
                Text(
                  "النسخة الحالية: 1.0.0",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
