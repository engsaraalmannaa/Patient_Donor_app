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
    page: () => ProfilePatientScreen(
      
    ),
    
  );

  @override
  State<ProfilePatientScreen> createState() => _ProfilePatientScreenState();
}

class _ProfilePatientScreenState extends State<ProfilePatientScreen> {
  final GlobalKey<FormState> key = GlobalKey();
  final ProfilePatientController controller = Get.put(ProfilePatientController());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();

    controller.Profileinfo();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
              return  controller.isloading
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      key: scaffoldKey,
                      backgroundColor: Colors.transparent,
                      appBar: PreferredSize(
                        preferredSize: Size(double.infinity, 10.h),
                        child: AppBar(
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 10.vmin,
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
                                size: 10.vmin,
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
                                  isEditing: isEditing,
                                 
                                ),
                                AppTextFormField(
                                  hint: " اسم الاب",
                                  keyboardType: TextInputType.text,
                                  controller: controller.father_name,
                                 
                                ),
                                AppTextFormField(
                                  hint: "  الاسم الاخير",
                                  keyboardType: TextInputType.text,
                                  controller: controller.last_name,
                                  
                                ),
                                AppTextFormField(
                                  hint: "الايميل",
                                  isEditing: isEditing,
                                  controller: controller.email,
                                 
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                AppTextFormField(
                                  hint: "الهاتف",
                                  isEditing: isEditing,
                                  controller: controller.phone,
                                 
                                  keyboardType: TextInputType.phone,
                                ),
                                AppTextFormField(
                                  hint: " الجنس",
                                  keyboardType: TextInputType.text,
                                  controller: controller.gender,
                                
                                ),
                                AppTextFormField(
                                  hint: " تاريخ الميلاد",
                                  keyboardType: TextInputType.text,
                                  controller: controller.birth_data,
                                 
                                ),
                                AppTextFormField(
                                  hint: " الرقم الوطني",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.national_number,
                                 
                                ),
                                AppTextFormField(
                                  hint: " العنوان",
                                  keyboardType: TextInputType.text,
                                  controller: controller.address,
                                 
                                ),
                                AppTextFormField(
                                  hint: " الحالة الاجتماعية ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.social_status,
                                  
                                ),
                                AppTextFormField(
                                  hint: " شركة التأمين  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.insurance_company,
                                 
                                ),
                                AppTextFormField(
                                  hint: " رقم التأمين  ",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.insurance_num,
                                
                                ),
                                AppTextFormField(
                                  hint: " رقم الطوارئ  ",
                                  keyboardType: TextInputType.phone,
                                  controller: controller.emergency_num,

                                ),AppTextFormField(
                                  hint: " مدخن  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.smoker,
                                 
                                ),AppTextFormField(
                                  hint: " حامل  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.pregnant,
                                 
                                ),AppTextFormField(
                                  hint: " زمرة الدم  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.blood_type,
                                 
                                ),AppTextFormField(
                                  hint: " امراض وراثية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.genetic_diseases,
                                  
                                ),AppTextFormField(
                                  hint: " امراض مزمنة  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.chronic_diseases,
                                 
                                ),AppTextFormField(
                                  hint: " ادوية تسبب التحسس  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.drug_allergy,
                                  ),
                                AppTextFormField(
                                  hint: " آخر عملية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.last_operations,
                                  
                                ),
                                AppTextFormField(
                                  hint: " الأدوية الحالية  ",
                                  keyboardType: TextInputType.text,
                                  controller: controller.present_medicines,
                                 
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
  })],
          );
        }
  }

