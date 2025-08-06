import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/add_disease_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';

class DonationState extends StatefulWidget {
  DonationState({super.key});
  static const name = '/donationstate';

  static final page = GetPage(
    name: name,
    page: () => DonationState(),
  );

  @override
  State<DonationState> createState() => _DonationStateState();
}

class _DonationStateState extends State<DonationState> {
  final formKey = GlobalKey<FormState>();
  String? patient_statusreplytext;
  String? available_money_replytext ;
  String? urgency_levelreplyText ;
  String? final_timereplyText;
    final AddDiseaseController controller = Get.put(AddDiseaseController());
    final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    String? savedReply =
        CacheHelper.get<String>('available_mony_${controller.available_money}');
    if (savedReply != null) {
      available_money_replytext = savedReply;
    }
    String? savedReply1 =
        CacheHelper.get<String>('patient_status_${controller.patient_status}');
    if (savedReply != null) {
      patient_statusreplytext = savedReply;
    }
    String? savedReply2 =
        CacheHelper.get<String>('urgency_level_${controller.urgency_level}');
    if (savedReply != null) {
       urgency_levelreplyText = savedReply;
    }String? savedReply3 =
        CacheHelper.get<String>('final_time_${controller.final_time}');
    if (savedReply != null) {
      final_timereplyText = savedReply;
    }
  }
  Widget build(BuildContext context) {
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

            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(2.5.vmin),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: GetBuilder<AddDiseaseController>(
                    builder: (controller) {
                      return controller.isloading
                      ? SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Center(child: CircularProgressIndicator()))
                      : Column(
                        children: [
                          AppTextFormField1(
                              minlines: 4,
                              hint: "الحالة المرضية",
                              controller: controller.patient_status),
                          SizedBox(
                            height: 5.vmin,
                          ),
                          AppTextFormField1(
                              hint: "المبلغ المطلوب",
                              controller:controller.available_money,
                              minlines: 1),
                          SizedBox(
                            height: 5.vmin,
                          ),
                          AppTextFormField1(
                              hint: "درجة خطورة المرض",
                              controller:controller.urgency_level,
                              minlines: 1),
                          SizedBox(
                            height: 5.vmin,
                          ),
                          AppTextFormField1(
                              hint: "الوقت الازم لاجراء العملية ",
                              controller: controller.final_time,
                              minlines: 1),
                          SizedBox(
                            height: 5.vmin,
                          ),
                          controller.isloading
                                  ? CircularProgressIndicator()
                                  :AppButton(
                              text: "تم",
                              ontap: () async {
                                if (key.currentState!.validate()) {
                                          await controller.add_disease();
                                          await CacheHelper.set(
                                            key:
                                                'patient_status_${controller.patient_status}',
                                            value: controller.patient_status.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'urgency_level${controller.urgency_level}',
                                            value: controller.urgency_level.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'available_money${controller.available_money}',
                                            value: controller.available_money.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'final_time${controller.final_time}',
                                            value: controller.final_time.text,
                                          );
                                          setState(() {
                                            patient_statusreplytext = controller.patient_status.text;
                                            urgency_levelreplyText = controller.urgency_level.text;
                                            available_money_replytext = controller.available_money.text;
                                            final_timereplyText = controller.final_time.text;
                                            controller.patient_status.clear();
                                            controller.urgency_level.clear();
                                            controller.available_money.clear();
                                            controller.final_time.clear();
                                          });
                                        }
                               })
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
          ),
          //
          //
          // Padding(
          //   padding:  EdgeInsets.all(5.vmin),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         AppTextFormField1(
          //           minlines: 4,
          //             hint: "الحالة المرضية",
          //             controller:globalController.controller),
          //         SizedBox(
          //           height: 5.vmin,
          //         ),
          //         AppTextFormField1(hint: "المبلغ المطلوب",
          //             controller: globalController.controller,
          //             minlines: 1),
          //         SizedBox(
          //           height: 5.vmin,
          //         ),
          //         AppTextFormField1(
          //             hint: "درجة خطورة المرض",
          //             controller: globalController.controller,
          //             minlines: 1),
          //         SizedBox(
          //           height: 5.vmin,
          //         ),
          //         AppTextFormField1(
          //             hint: "الوقت الازم لاجراء العملية ",
          //             controller: globalController.controller,
          //             minlines: 1),
          //         SizedBox(
          //           height: 5.vmin,
          //         ),
          //         AppButton(
          //             text:"تم",
          //             ontap:() {
          //               globalController.submitAndClear(
          //                   context," تم تقديم طلب التبرع ,سيتم الرد في اقرب وقت") ;
          //             } )

          //       ],
          //     ),
          //   ),
          // ),
        )
      ],
    );
  }
}
