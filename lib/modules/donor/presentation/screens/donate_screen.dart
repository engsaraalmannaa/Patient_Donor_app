import 'dart:io';

import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DonateScreen extends StatefulWidget {
  final int diseaseId;
 

  const DonateScreen({
    super.key,
    required this.diseaseId, 
  });

  static const name = '/donatescreen';
  static final page = GetPage(
      name: name,
      page: () => DonateScreen(
            diseaseId: Get.arguments,
          ));

  @override
  State<DonateScreen> createState() => DonateScreenState();
}

class DonateScreenState extends State<DonateScreen> {
  String? replyText;
  @override
  void initState() {
    super.initState();
    String? savedReply =
        CacheHelper.get<String>('amount_reply${controller.amount}');
    if (savedReply != null) {
      replyText = savedReply;
    }
  }


  File? selectedImage;
  final ImagePicker picker = ImagePicker();
  final GlobalKey<FormState> key = GlobalKey();

  final HomeControllerd controller = Get.put(HomeControllerd());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        GetBuilder<HomeControllerd>(
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
                      "تبرع  ",
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
                                child: Column(
                                  children: [
                                    SizedBox(height: 10.vmin),
                                    AppTextFormField(
                                      hint: "ادخل المبلغ المراد التبرع به ",
                                      controller: controller.amount,
                                     
                                    ),
                                    SizedBox(
                                      height: 10.vmin,
                                    ),
                                    SizedBox(height: 2.vmin),
                                    if (selectedImage != null)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          selectedImage!,
                                          height: 20.vmin,
                                          width: 20.vmin,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    if (controller.image != null)
                                      Image.file(
                                        controller.image!,
                                        height: 30.vmin,
                                        width: 30.vmin,
                                        fit: BoxFit.cover,
                                      ),
                                    SizedBox(height: 2.vmin),
                                    AppButton(
                                      width: 50.vmin,
                                      text: "إضافة وصل التبرع",
                                      ontap: controller.pickImage,
                                    ),
                                    SizedBox(height: 7.h),
                                    controller.isloadingpostdonation
                                        ? CircularProgressIndicator()
                                        : AppButton(
                                            text: "تم",
                                            ontap: () async {
                                              if (key.currentState!
                                                  .validate()) {
                                                await controller.postdonation();
                                                await CacheHelper.set(
                                                  key:
                                                      'amount_reply${controller.amount}',
                                                  value: controller.amount.text,
                                                );
                                                await Future.delayed(
                                                    Duration(seconds: 1));
                                                final homeController =
                                                    Get.find<HomeControllerd>();
                                                await homeController
                                                    .showDiseases(); 
                                                Get.offAllNamed('/dhome');
                                                if (mounted) {
                                                  setState(() {
                                                    replyText =
                                                        controller.amount.text;
                                                    controller.amount.clear();
                                                  });
                                                }
                                              }
                                            },
                                          ),
                                  ],
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
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
      controller.image = selectedImage; 
      controller.update();
    }
  }
}
