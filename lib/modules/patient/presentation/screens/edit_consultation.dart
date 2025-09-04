import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/custom_dropdown.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/my_consultations_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_consultation_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/write_consultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditConsultationScreen extends StatefulWidget {
  final Consultation consultation;
  const EditConsultationScreen({Key? key, required this.consultation})
      : super(key: key);
  static const name = '/editconsultation';
  static final page = GetPage(
    name: name,
    page: () {
      final Consultation consultation = Get.arguments as Consultation;
      return EditConsultationScreen(consultation: consultation);
    },
  );
  @override
  State<EditConsultationScreen> createState() => _EditConsultationScreenState();
}

class _EditConsultationScreenState extends State<EditConsultationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _questionController = TextEditingController();
  String? selectedSpecialtyId;
  String? selectedSpecialtyName;
  MyConsultationController controller =
      Get.put<MyConsultationController>(MyConsultationController());

  @override
  void initState() {
    super.initState();
    _questionController.text = widget.consultation.question ?? '';
    selectedSpecialtyId = widget.consultation.specialty?.id?.toString();
    selectedSpecialtyName = widget.consultation.specialty?.name;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getspecialety();
    });
  }

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
            title: Text(
              "تعديل الاستشارة",
              style: TextStyle(fontSize: 14.spa),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10.vmin),
              child: SingleChildScrollView(
                child: GetBuilder<MyConsultationController>(
                  //init: MyConsultationController(),

                  builder: (controller) => controller.isloading
                      ? SizedBox(
                          height: 500,
                          //width: double.infinity,
                          child: Center(child: CircularProgressIndicator()))
                      : Column(
                          children: [
                            CustomDropdown(
                              items: controller.specialties,
                              hint1: selectedSpecialtyName ?? "اختر التخصص",
                              onChanged: (val) {
                                final matched =
                                    Get.find<MyConsultationController>()
                                        .specialtiesModel
                                        ?.data
                                        ?.firstWhereOrNull(
                                            (e) => e.name == val);

                                if (matched != null) {
                                  selectedSpecialtyId = matched.id.toString();
                                  selectedSpecialtyName = matched.name;
                                }
                              },
                              showSecondDropdown: false,
                            ),
                            const SizedBox(height: 16),
                            AppTextFormField1(
                              minlines: 5,
                              hint: "اكتب استشارتك",
                              controller: _questionController,
                              // validator: (val) {
                              //   if (val == null || val.isEmpty) {
                              //     return "يرجى كتابة الاستشارة";
                              //   }
                              //   return null;
                              // },
                            ),
                            SizedBox(height: 24),
                            AppButton(
                              text: controller.isloadingupdate
                                  ? "جارٍ الحفظ..."
                                  : "حفظ التعديل",
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  controller.isloadingupdate = true;
                                  controller.update();
                                  await MyConsultationsDataSource
                                      .editmyconsultation(
                                    widget.consultation.id!,
                                    int.parse(selectedSpecialtyId!),
                                    _questionController.text,
                                  );
                                  controller.isloadingupdate = false;
                                  controller.update();
                                  // await controller.myconsultations();
                                  // Get.back(); // ممكن ترجع على تفاصيل الاستشارة
                                  Consultation updatedConsultation =
                                      Consultation(
                                    id: widget.consultation.id,
                                    specialtyId:
                                        int.parse(selectedSpecialtyId!),
                                    patientId: widget.consultation.patientId,
                                    question: _questionController.text,
                                    createdAt: widget.consultation.createdAt,
                                    updatedAt: DateTime.now().toIso8601String(),
                                    specialty: Specialty(
                                      id: int.parse(selectedSpecialtyId!),
                                      name: selectedSpecialtyName,
                                    ),
                                    answers: widget.consultation.answers,
                                  );

                                  // ارجع الـ Consultation المحدث:
                                  Get.back(result: {
                                    'refresh': true,
                                    'consultation': updatedConsultation
                                  });
                                  await controller.myconsultations();
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
