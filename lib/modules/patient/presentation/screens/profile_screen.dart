import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/profile_controller.dart';
import 'package:Pationt_Donor/modules/patient/data/model/profile_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePatientScreen extends StatefulWidget {
  ProfilePatientScreen({super.key});
  static const name = "/profilepatient";
  static final page = GetPage(
    name: name,
    page: () => ProfilePatientScreen(),
  );
  @override
  State<ProfilePatientScreen> createState() => _ProfilePatientScreenState();
}

//CacheHelper.set
class _ProfilePatientScreenState extends State<ProfilePatientScreen> {
  final GlobalKey<FormState> key = GlobalKey();
  final ProfilePatientController controller =
      Get.put(ProfilePatientController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    controller.Profileinfo();
    CacheHelper.set(key: "name", value: controller.first_name.text);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white30, Colors.black26],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        GetBuilder<ProfilePatientController>(
            init: ProfilePatientController(),
            builder: (controller) {
              return controller.isloading
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      key: scaffoldKey,
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
                        leading: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 9.vmin,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        actions: [
                          IconButton(
                            icon: Icon(
                              isEditing ? Icons.save : Icons.edit,
                              color: Colors.white,
                              size: 8.vmin,
                            ),
                            onPressed: () {
                              setState(() {
                                isEditing = !isEditing;
                                if (!isEditing) {
                                  // Save changes here
                                  // You can add your save logic
                                }
                              });
                            },
                          ),
                        ],
                        backgroundColor: ConstColors.darkBlue,
                      ),
                      body: Form(
                        key: key,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 1.vmin,
                                left: 5.vmin,
                                top: 1.vmin,
                                bottom: 1.vmin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 1.h),
                                AppTextFormField(
                                  hint: " الاسم الاول", 
                                  keyboardType: TextInputType.text,
                                  controller: controller.first_name,
                                   fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " اسم الاب",
                                  keyboardType: TextInputType.text,
                                  controller: controller.father_name,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: "  الاسم الاخير",
                                  keyboardType: TextInputType.text,
                                  controller: controller.last_name,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: "الايميل",
                                  isEditing: isEditing,
                                  controller: controller.email,
                                  keyboardType: TextInputType.emailAddress,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: "الهاتف",
                                  isEditing: isEditing,
                                  controller: controller.phone,
                                  keyboardType: TextInputType.phone,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " الجنس",
                                  keyboardType: TextInputType.text,
                                  controller: TextEditingController(
                                    text: controller.gender.text
                                                .toLowerCase() ==
                                            "female"
                                        ? "أنثى"
                                        : controller.gender.text
                                                    .toLowerCase() ==
                                                "male"
                                            ? "ذكر"
                                            : controller.gender
                                                .text, // لو فيه أي نص آخر يظل كما هو
                                  ),
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " تاريخ الميلاد",
                                  keyboardType: TextInputType.text,
                                  controller: controller.birth_data,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " الرقم الوطني",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.national_number,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " العنوان",
                                  keyboardType: TextInputType.text,
                                  controller: controller.address,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " الحالة الاجتماعية ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.social_status,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " شركة التأمين  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.insurance_company,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " رقم التأمين  ",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.insurance_num,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " رقم الطوارئ  ",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.emergency_num,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " مدخن  ",
                                  keyboardType: TextInputType.text,
                                  controller: TextEditingController(
                                    text: controller.smoker.text
                                                .toLowerCase() ==
                                            "1"
                                        ? "نعم"
                                        : controller.smoker.text
                                                    .toLowerCase() ==
                                                "0"
                                            ? "لا"
                                            : controller.smoker
                                                .text, // لو فيه أي نص آخر يظل كما هو
                                  ),
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " حامل  ",
                                  keyboardType: TextInputType.text,
                                  controller:  TextEditingController(
                                    text: controller.pregnant.text
                                                .toLowerCase() ==
                                            "1"
                                        ? "نعم"
                                        : controller.pregnant.text
                                                    .toLowerCase() ==
                                                "0"
                                            ? "لا"
                                            : controller.pregnant
                                                .text, // لو فيه أي نص آخر يظل كما هو
                                  ),
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " زمرة الدم  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.blood_type,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " امراض وراثية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.genetic_diseases,
                                  fillColor: isEditing
                                        ? Colors.grey.shade400
                                        : Colors.blue.shade50,
                                         readOnly: true,
                                ),
                                AppTextFormField(
                                  hint: " امراض مزمنة  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.chronic_diseases,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " ادوية تسبب التحسس  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.drug_allergy,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " آخر عملية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.last_operations,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                AppTextFormField(
                                  hint: " الأدوية الحالية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.present_medicines,
                                   fillColor:  Colors.blue.shade50,
                                         readOnly: !isEditing,
                                ),
                                if (isEditing)
                                  controller.isloading
                                      ? CircularProgressIndicator()
                                      : AppButton(
                                          text: "حفظ التعديلات",
                                          ontap: () async {
                                            if (isEditing) {
                                              // حفظ البيانات
                                              if (key.currentState!
                                                  .validate()) {
                                                await controller
                                                    .updatepatientprofile();
                                                showSnackBar(
                                                    "تم حفظ التعديلات");
                                              }
                                            }

                                            setState(() {
                                              isEditing = !isEditing;
                                            });
                                          },
                                          // if (key.currentState!.validate()) {
                                          //   await controller.updateprofile();
                                          //   await CacheHelper.set(
                                          //     key:
                                          //         '${controller.updateprofile()}',
                                          //     value: controller.updateprofile(),
                                          //   );
                                          //   setState(() {
                                          //     var replyText = controller.first_name.text;
                                          //     controller.first_name.clear();
                                          //   });
                                          // }
                                        )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            })
      ],
    );
  }
}
