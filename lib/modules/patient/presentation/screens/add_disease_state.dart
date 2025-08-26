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
  String? available_money_replytext;
  String? urgency_levelreplyText;
  String? final_timereplyText;
  final AddDiseaseController controller = Get.put(AddDiseaseController());
  final GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSpecialties();
    });
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
    }
    String? savedReply3 =
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
            child:  GetBuilder<AddDiseaseController>(builder: (controller) {
                                return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () {
                  if (controller.isLoadingSpecialty.value) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  return controller.isloading
                      ? Center(
                          child: CircularProgressIndicator())
                      : SingleChildScrollView(
                        child: Column(
                            children: [
                              SizedBox(
                                height: 5.vmin,
                              ),
                              DropdownButtonFormField<String>(
                                isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "التخصص",
                                labelStyle: TextStyle(color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.blue.shade50,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade900, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                        
                                value: controller.specialties.contains(
                                        controller
                                            .selectedSpecialty.value)
                                    ? controller.selectedSpecialty.value
                                    : null,
                                items: controller.specialties
                                    .map((s) => DropdownMenuItem(
                                        value: s, child: Text(s)))
                                    .toList(),
                                onChanged: (val) async {
                                  if (val != null) {
                                    controller.selectedSpecialty.value =
                                        val;
                                    await controller
                                        .getDoctorsBySpecialty(val);
                                    if (controller.doctorsOfSelected !=
                                        null) {
                                      controller.selectedDoctor.value =
                                          null;
                                    }
                                  }
                                },
                              ),
                              SizedBox(height: 5.vmin),
                              if (controller.isLoadingDoctors.value)
                                const Center(
                                    child: CircularProgressIndicator())
                              else if (controller.doctorsOfSelected
                                      ?.data?.isNotEmpty ??
                                  false)
                                DropdownButtonFormField<String>(
                                  isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "الطبيب",
                                labelStyle: TextStyle(color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.blue.shade50,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade900, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                        
                                  value:
                                      controller.selectedDoctor.value,
                                  items: (controller.doctorsOfSelected
                                                  ?.data ??
                                              [])
                                          .map((d) =>
                                              DropdownMenuItem<String>(
                                                value: d.id
                                                    ?.toString(), // <-- القيمة هي الـ id
                                                child: Text(
                                                    "${d.firstName ?? ''} ${d.lastName ?? ''}"),
                                              ))
                                          .toList() ??
                                      [],
                                  onChanged: (val) {
                                    if (val != null) {
                                      print("${val}");
                                      controller.selectedDoctor.value =
                                          val;
                                      controller.onDoctorSelected(val);
                                      print(
                                          "the value :${controller.selectedDoctor.value}");
                                      controller.onDoctorSelected(val);
                                    }
                                  },
                                ),
                              SizedBox(
                                height: 5.vmin,
                              ),
                              AppTextFormField1(
                                  minlines: 4,
                                  hint: "الحالة المرضية",
                                  controller:
                                      controller.patient_status),
                              SizedBox(
                                height: 5.vmin,
                              ),
                              AppTextFormField1(
                                  hint: " المبلغ المتاح لديك (ل.س)",
                                  controller:
                                      controller.available_money,
                                  keyboardType: TextInputType.phone,
                                  minlines: 1),
                              SizedBox(
                                height: 5.vmin,
                              ),
                              // AppTextFormField1(
                              //     hint: "درجة خطورة المرض",
                              //     controller: controller.urgency_level,
                              //     minlines: 1),
                              DropdownButtonFormField<String>(
                              
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "درجة خطورة المرض",
                                labelStyle: TextStyle(color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.blue.shade50,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade900, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade500, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                        
                              value: controller.urgency_level.text.isNotEmpty 
                                  ? controller.urgency_level.text 
                                  : null, // القيمة المختارة حالياً
                              items: const [
                                DropdownMenuItem(
                                  value: "عالية",
                                  child: Text("عالية"),
                                ),
                                DropdownMenuItem(
                                  value: "متوسطة",
                                  child: Text("متوسطة"),
                                ),
                                DropdownMenuItem(
                                  value: "دنيا",
                                  child: Text("دنيا"),
                                ),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  controller.urgency_level.text = val; // نخزن القيمة المختارة لنبعتها للباك
                                }
                              },
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "الرجاء اختيار درجة الخطورة";
                                }
                                return null;
                              },
                        ),
                        
                              SizedBox(
                                height: 5.vmin,
                              ),
                              AppTextFormField1(
                                  hint: "التاريخ النهائي للإجراء\n1999-5-5",
                                  controller: controller.final_time,
                                  minlines: 1),
                              SizedBox(
                                height: 5.vmin,
                              ),
                              controller.isloading
                                  ? CircularProgressIndicator()
                                  : AppButton(
                                      text: "تم",
                                      ontap: () async {
                                        if (key.currentState!
                                            .validate()) {
                                          await controller
                                              .add_disease();
                                          await CacheHelper.set(
                                            key:
                                                'patient_status_${controller.patient_status}',
                                            value: controller
                                                .patient_status.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'urgency_level${controller.urgency_level}',
                                            value: controller
                                                .urgency_level.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'available_money${controller.available_money}',
                                            value: controller
                                                .available_money.text,
                                          );
                                          await CacheHelper.set(
                                            key:
                                                'final_time${controller.final_time}',
                                            value: controller
                                                .final_time.text,
                                          );
                                          setState(() {
                                            patient_statusreplytext =
                                                controller
                                                    .patient_status
                                                    .text;
                                            urgency_levelreplyText =
                                                controller
                                                    .urgency_level.text;
                                            available_money_replytext =
                                                controller
                                                    .available_money
                                                    .text;
                                            final_timereplyText =
                                                controller
                                                    .final_time.text;
                                            
                                            controller.patient_status
                                                .clear();
                                            controller.urgency_level
                                                .clear();
                                            controller.available_money
                                                .clear();
                                            controller.final_time
                                                .clear();
                                          });
                                        }
                                      })
                            ],
                          ),
                      );
                },
              ),
                                );
                              })
          
          ),
        )
      ],
    );
  }
}
