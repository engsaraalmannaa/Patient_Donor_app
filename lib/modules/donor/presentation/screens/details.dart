import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import '../../../../core/const/const_colors.dart';
import 'donation_information.dart';

class DetailsScreen extends StatelessWidget {
final String text;
  const DetailsScreen({super.key, required this.text});
  static const name = '/detail';
  static final page = GetPage(
    name: name,
    page: () =>  DetailsScreen(text: "55",),
   
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward))
        ],
        title:  Text("تفاصيل الحالة",
          style:
          TextStyle(
              fontSize: 14.spa,
              fontWeight: FontWeight.w600
          ),),
        backgroundColor: ConstColors.darkBlue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Wallpaper(
              image: "assets/images/pattern.png",
              num: 0.3),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: SingleChildScrollView(
                    child: Text( text,
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Divider(
                  endIndent: 5.vmin,
                  indent: 5.vmin,
                ),
              Text("هل تريد التبرع؟",
              style: TextStyle(
                color: ConstColors.darkBlue,
                fontWeight: FontWeight.w600,
                fontSize: 18.spa
              ),),
                SizedBox(height: 3.vmin,),
                AppButton(text: "نعم",
                    width: 25.vmin,
                    ontap:(){
                      Get.to(() => DonationInformation());
                 
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
