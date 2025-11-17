import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';

class AboutHospitalScreen extends StatelessWidget {
  const AboutHospitalScreen({super.key});

  static const name = '/about_hospital';
  static final page = GetPage(
    name: name,
    page: () => const AboutHospitalScreen(),
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
              'حول المشفى',
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
                  "مشفى الحكمة التخصصي",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ConstColors.darkBlue,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "مشفى الحكمة التخصصي هو مركز طبي متكامل يهدف إلى تقديم خدمات صحية "
                  "عالية الجودة للمرضى من مختلف التخصصات. "
                  "يضم المشفى كوادر طبية متميزة وأحدث التقنيات الطبية لتشخيص "
                  "ومعالجة المرضى بكفاءة وفعالية.",
                  style: TextStyle(
                    fontSize: 17.sp,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "خدماتنا: ",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: ConstColors.darkBlue,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "- العيادات الخارجية التخصصية\n"
                  "- قسم الطوارئ على مدار الساعة\n"
                  "- خدمات المختبر والتصوير الطبي\n"
                  "- العمليات الجراحية المتقدمة\n"
                  "- وحدات العناية المركزة",
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "العنوان: دمشق - المزة - جانب ساحة المشفى",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "هاتف: 011-1234567",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "البريد الإلكتروني: info@alhikma-hospital.com",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 5.h),
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
