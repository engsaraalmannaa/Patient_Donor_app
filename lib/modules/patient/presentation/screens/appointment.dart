import 'dart:math';

import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import '../../../../core/core_components/custom_dropdown.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  static const name = '/appointment';

  static final page = GetPage(
    name: name,
    page: () => const Appointment(),
  );

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  final GlobalKey<FormState> key = GlobalKey();
  String? selectedValue;
  final AppointmentController controller = Get.put(AppointmentController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSpecialties();
    });
    String? savedReply =
        CacheHelper.get<String>('appointmant_is${controller.doctorId}');
    if (savedReply != null) {}
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
            child: GetBuilder<AppointmentController>(builder: (controller) {
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(
                    () {
                      if (controller.isLoadingSpecialty.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          DropdownButtonFormField<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                              labelText: "التخصص",
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade700),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade900, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade500, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            icon: const Icon(Icons.arrow_drop_down),
                            value: controller.specialties.contains(
                                    controller.selectedSpecialty.value)
                                ? controller.selectedSpecialty.value
                                : null,
                            items: controller.specialties
                                .map((s) =>
                                    DropdownMenuItem(value: s, child: Text(s)))
                                .toList(),
                            onChanged: (val) async {
                              if (val != null) {
                                controller.selectedSpecialty.value = val;
                                await controller.getDoctorsBySpecialty(val);
                                if (controller.doctorsOfSelected != null) {
                                  controller.selectedDoctor.value = null;
                                }
                              }
                            },
                          ),
                          SizedBox(height: 5.vmin),
                          if (controller.isLoadingDoctors.value)
                            const Center(child: CircularProgressIndicator())
                          else if (controller
                                  .doctorsOfSelected?.data?.isNotEmpty ??
                              false)
                            DropdownButtonFormField<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "الطبيب",
                                labelStyle:
                                    TextStyle(color: Colors.grey.shade700),
                                filled: true,
                                fillColor: Colors.blue.shade50,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade900, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade500, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              value: controller.selectedDoctor.value,
                              items: (controller.doctorsOfSelected?.data ?? [])
                                      .map((d) => DropdownMenuItem<String>(
                                            value: d.id?.toString(),
                                            child: Text(
                                                "${d.firstName ?? ''} ${d.lastName ?? ''}"),
                                          ))
                                      .toList() ??
                                  [],
                              onChanged: (val) {
                                if (val != null) {
                                  print("${val}");
                                  controller.selectedDoctor.value = val;
                                  controller.onDoctorSelected(val);
                                  print(
                                      "the value :${controller.selectedDoctor.value}");
                                  controller.onDoctorSelected(val);
                                }
                              },
                            ),
                          SizedBox(
                            height: 20.vmin,
                          ),
                          controller.isSubmitting
                              ? CircularProgressIndicator()
                              : AppButton(
                                  ontap: () async {
                                    print("🟡 تم الضغط على زر الإرسال");

                                    await controller.appointmentRequest();
                                  },
                                  text: 'تم',
                                ),
                          SizedBox(
                            height: 15.vmin,
                          ),
                        ],
                      );
                    },
                  ));
            }),
          ),
        ),
      ],
    );
  }
}
