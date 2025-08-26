import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  static const name = '/about-app';
  static final page = GetPage(
    name: name,
    page: () => const AboutAppPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Wallpaper(image: "assets/images/pattern.png", num: 0.3),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'حول التطبيق',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
        
                Text(
                  'عن التطبيق',
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                SizedBox(height: 1.h),
        
                Text(
                  'هذا التطبيق مخصص للمتبرعين حيث يمكنهم الاطّلاع على الحالات المرضية القادمة من تطبيق المرضى '
  'واختيار الحالة التي يرغبون بدعمها.\n يتيح التطبيق للمتبرع إرفاق وصل التبرع وتحديد قيمة المبلغ، '
  'كما يمكنه متابعة جميع تبرعاته السابقة وتعديلها في حال كانت حالة التبرع ما زالت قيد الانتظار أو لم تُقبل بعد من قبل الآدمن.',
   style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.4,
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 3.h),
        
                Divider(thickness: 1, color: Colors.grey.shade300),
        
                ListTile(
                  leading: Icon(Icons.verified, color: ConstColors.darkBlue),
                  title: Text(
                    'الإصدار',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('1.0.0'),
                ),
                ListTile(
                  leading: Icon(Icons.copyright, color: ConstColors.darkBlue),
                  title: Text(
                    'حقوق النشر',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('© 2025 جميع الحقوق محفوظة'),
                ),
                ListTile(
                  leading: Icon(Icons.email, color: ConstColors.darkBlue),
                  title: Text(
                    'تواصل معنا',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('support@hospitalapp.com'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
