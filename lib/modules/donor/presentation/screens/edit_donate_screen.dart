import 'dart:io';

import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/my_donations_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditDonateScreen extends StatefulWidget {
  final int donationid;
  //final Data? model1;

  const EditDonateScreen({
    super.key,
    required this.donationid, //this.model1,
  });

  static const name = '/EditDonateScreen';
  static final page = GetPage(
      name: name,
      page: () => EditDonateScreen(
            donationid: Get.arguments,
          ));

  @override
  State<EditDonateScreen> createState() => EditDonateScreenState();
}

class EditDonateScreenState extends State<EditDonateScreen> {
  // String? replyText;
  // @override
  // void initState() {
  //   super.initState();
  //   // String? savedReply =
  //   //     CacheHelper.get<String>('amount_reply${controller.amount}');
  //   // if (savedReply != null) {
  //   //   replyText = savedReply;
  //   // }
  // }

//Data1? data;
  //bool loading = true;
  // File? selectedImage;
  // final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> key = GlobalKey();

  final MyDonationsController controller = Get.put(MyDonationsController());

  //final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print('${widget.donationid}');
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        GetBuilder<MyDonationsController>(
            //init: MyDonationsController(),
            builder: (controller) {
          return controller.isloading
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    shape: Border.all(),
                    leading: Padding(
                      padding: EdgeInsets.only(right: 4.vmin),
                      child: Image.asset(
                        "assets/images/logoo.png",
                        width: 25.vmin,
                      ),
                    ),
                    title: Text(
                      "تعديل التبرع  ",
                      style: TextStyle(
                        fontSize: 12.5.spa,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 9.vmin,
                        ),
                      ),
                    ],
                  ),
                  body: Form(
                    key: key,
                    child: SafeArea(
                      child: controller.isloading
                          ? Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(3.vmin),
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.vmin),
                                      if (controller.image != null)
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.file(
                                            controller.image!,
                                            height: 30.vmin,
                                            width: 30.vmin,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                     
                                      SizedBox(height: 2.vmin),
                                      AppButton(
                                        width: 50.vmin,
                                        text: "إضافة وصل التبرع",
                                        ontap: ()=> pickImage(),
                                      ),
                                      SizedBox(height: 7.h),
                                      controller.isloadingeditdonation
                                          ? CircularProgressIndicator()
                                          : AppButton(
                                              text: "تم",
                                              ontap: () async {
                                                if (key.currentState!
                                                    .validate()) {
                                                  await controller.editdonation(widget.donationid);
                                                
                                                }
                                              },
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                );
        }),
      ],
    );
  }

  Future<void> pickImage() async {
  final XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (picked != null) {
    controller.image = File(picked.path);
    controller.update();
  }
}

}
