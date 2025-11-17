import 'dart:developer';

import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/patient/data/model/consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/write_consultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import '../../../../core/core_components/custom_dropdown.dart';

class Consultations extends StatefulWidget {
  const Consultations({super.key});

  static const name = '/consultations';

  static final page = GetPage(
    name: name,
    page: () => const Consultations(),
  );

  @override
  State<Consultations> createState() => ConsultationsState();
}

class ConsultationsState extends State<Consultations> {
  String? replyText;

  final GlobalKey<FormState> key = GlobalKey();

  String? selectedValue;
  final WriteConsultationController controller =
      Get.put(WriteConsultationController());
  String? selectedSpecialtyName;

  @override
  void initState() {
    super.initState();
    String? savedReply =
        CacheHelper.get<String>('consultation_reply_${controller.question}');
    if (savedReply != null) {
      replyText = savedReply;
    }
  }

  Widget build(
    BuildContext context,
  ) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: key,
            child: Padding(
              padding: EdgeInsets.all(8.vmin),
              child: SingleChildScrollView(
                child: GetBuilder<WriteConsultationController>(
                  init: WriteConsultationController(),
                  initState: (state) {
                    controller.getspecialety();
                  },
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.isloading
                          ? SizedBox(
                              height: 500,
                              child: Center(child: CircularProgressIndicator()))
                          : Column(
                              children: [
                                CustomDropdown(
                                  items: controller.specialties,
                                  hint1: "اختر التخصص",
                                  onChanged: (val) {
                                    log("$val");
                                    final matchedSpecialty = controller
                                        .specialtiesModel?.data
                                        ?.firstWhereOrNull(
                                            (e) => e.name == val);

                                    if (matchedSpecialty != null) {
                                      controller.selectedSpecialtyId =
                                          matchedSpecialty.id.toString();
                                      controller.specialty_id =
                                          matchedSpecialty.id.toString();
                                      log(controller.specialty_id.toString());
                                    } else {
                                      controller.selectedSpecialtyId = null;
                                      controller.specialty_id = null;
                                      showSnackBar(
                                          "لم يتم العثور على التخصص المحدد");
                                    }
                                  },
                                  showSecondDropdown: false,
                                ),
                                SizedBox(
                                  height: 10.vmin,
                                ),
                                AppTextFormField1(
                                  hint: "اكتب استشارتك",
                                  controller: controller.question,
                                  minlines: 4,
                                ),
                                SizedBox(
                                  height: 10.vmin,
                                ),
                                controller.isloading_write_Consltation
                                    ? CircularProgressIndicator()
                                    : AppButton(
                                        text: "تم",
                                        ontap: () async {
                                          if (key.currentState!.validate()) {
                                            await controller
                                                .Writeconsultations();
                                            await CacheHelper.set(
                                              key:
                                                  'consultation_reply_${controller.question}',
                                              value: controller.question.text,
                                            );
                                            setState(() {
                                              replyText =
                                                  controller.question.text;
                                              controller.question.clear();
                                            });
                                          }
                                        },
                                      )
                              ],
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
