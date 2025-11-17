import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';

class DonationInformation extends StatelessWidget {
  const DonationInformation({super.key});
  static const name = '/donation info';
  static final page = GetPage(
    name: name,
    page: () =>  DonationInformation(),
    
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("معلومات التبرع",
          style:
          TextStyle(
              fontSize: 14.spa,
              fontWeight: FontWeight.w600
          ),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: Stack(
        children: [
          Wallpaper(image:"assets/images/pattern.png", num: 0.3),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(3.vmin),
                child: AppTextFormField1(
                    hint: "المبلغ المراد دفعه",
                    controller: TextEditingController(),
                    minlines: 1),
              ),
              Divider(
                color: ConstColors.darkBlue,
                endIndent: 5.vmin,
                indent: 5.vmin,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 40.0.vmin),
                child: Text("ارفق صورة الوصل من فضلك:",
                style: TextStyle(color:ConstColors.darkBlue,),),
              ),
              SizedBox(
                height: 3.vmin,
              ),
              InkWell(
                child:
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: ConstColors.darkBlue,
                      size: 15.vmin,
                    )
                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
