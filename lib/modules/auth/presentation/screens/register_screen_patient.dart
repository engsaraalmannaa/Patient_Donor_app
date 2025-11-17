import 'package:Pationt_Donor/modules/auth/presentation/controllers/login/login_middleware.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_middlewhere.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_appointments.dart.dart';

import '../../../../core/const/const_colors.dart';
import '../../../../core/core_components/app_text_form_field.dart';
import '../controllers/register/register_binding.dart';
import '../controllers/register/register_patient_controller.dart';

class RegisterScreenPatient extends GetView<RegisterpatientController> {
  RegisterScreenPatient({super.key});
  final role = Get.arguments?['role'] ?? 'patient';
  final controller = Get.put(RegisterpatientController());

  static const name = '/rp';
  static final page = GetPage(
    name: name,
    page: () => RegisterScreenPatient(),
    binding: RegisterBinding(),
  );
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.userRole = role!;

    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("تسجيل حساب",
                style:
                    TextStyle(fontSize: 14.spa, fontWeight: FontWeight.bold)),
          ),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.5.vmin),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.9,
                      child: CircleAvatar(
                          backgroundColor: Colors.white12,
                          foregroundColor: Colors.transparent,
                          radius: 21.vmin,
                          backgroundImage: ExtendedAssetImageProvider(
                              "assets/images/logoo.png")),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    const Divider(color: ConstColors.darkBlue),
                    Text(
                      "ادخل بياناتك",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.spa),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    AppTextFormField(
                      hint: ' الاسم الأول',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.first_nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الاسم الاول مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' اسم الأب',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.father_nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'اسم الأب مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' الكنية',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.last_nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الكنية مطلوبة';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: 'البريد الالكتروني',
                      icon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'البريد الالكتروني مطلوب';
                        }
                        if (!value.isEmail) {
                          return 'البريد الالكتروني غير صحيح';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: 'كلمة المرور',
                      icon: const Icon(Icons.lock_outlined),
                      isPass: true,
                      controller: controller.passwordController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'كلمة المرور مطلوبة !';
                        }
                        if (value.length < 8) {
                          return 'كلمة المرور يجب ان تكون 8 خانات';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: 'تاكيد كلمة المرور',
                      icon: const Icon(Icons.check),
                      isPass: true,
                      controller: controller.password_confirmationController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'تاكيد كلمة المرور مطلوب';
                        }
                        if (value != controller.passwordController.text) {
                          return "كلمة المرور غير صحيحة";
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: 'الجنس',
                        prefixIcon: const Icon(Icons.perm_identity_outlined),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        fillColor: Colors.blue.shade50,
                        filled: true,
                      ),
                      value: controller.genderController.text.isNotEmpty
                          ? controller.genderController.text
                          : null,
                      items: const [
                        DropdownMenuItem(
                          value: "male",
                          child: Text('ذكر'),
                        ),
                        DropdownMenuItem(
                          value: "female",
                          child: Text('أنثى'),
                        ),
                      ],
                      onChanged: (value) {
                        controller.genderController.text = value!;
                        controller.isError.value = false;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرجاء اختيار الجنس';
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      hint: ' تاريخ الميلاد ',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.birth_dataController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'تاريخ الميلاد مطلوب';
                        }

                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: 'الرقم الوطني',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.national_numberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرقم الوطني مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: 'العنوان',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'العنوان مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' رقم الموبايل',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرقم مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: "الحالة الاجتماعية",
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.social_statusController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الحالة  مطلوبة';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' رقم للطوارئ',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.emergency_numController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الرقم  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: "شركة التأمين",
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.insurance_companyController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' رقم التأمين',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.insurance_numController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      padding: EdgeInsets.symmetric(vertical: 2.vmin),
                      isDense: true,
                      decoration: InputDecoration(
                        labelText: 'هل أنت مدخن؟',
                        prefixIcon: const Icon(Icons.perm_identity_outlined),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        fillColor: Colors.blue.shade50,
                        filled: true,
                      ),
                      value: controller.smokerController.text.isNotEmpty
                          ? controller.smokerController.text
                          : null,
                      items: ['true', 'false'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value == 'true' ? 'نعم' : 'لا'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.smokerController.text = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      padding: EdgeInsets.symmetric(vertical: 2.vmin),
                      isDense: true,
                      decoration: InputDecoration(
                        labelText: 'هل انتِ حامل؟',
                        prefixIcon: const Icon(Icons.perm_identity_outlined),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                        ),
                        fillColor: Colors.blue.shade50,
                        filled: true,
                      ),
                      value: controller.pregnantController.text.isNotEmpty
                          ? controller.pregnantController.text
                          : null,
                      items: ['true', 'false'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value == 'true' ? 'نعم' : 'لا'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.pregnantController.text = value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' زمرة الدم',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.blood_typeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' أمراض وراثية ',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.genetic_diseasesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' أمراض مزمنة',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.chronic_diseasesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' أدوية تسبب لك تحسس',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.drug_allergyController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' اَخر عملية ',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.last_operationsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    AppTextFormField(
                      hint: ' أدوية حالية',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.text,
                      controller: controller.present_medicinesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل  مطلوب';
                        }
                        onChanged:
                        (_) => controller.isError.value = false;
                      },
                    ),
                    Obx(
                      () {
                        return Padding(
                          padding: EdgeInsets.all(2.vmin),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: controller.isError.value
                                  ? BorderSide(color: Colors.red, width: 1.5)
                                  : BorderSide.none,
                            ),
                            onPressed: () async {
                              print("after valid");
                              if (formKey.currentState!.validate()) {
                                var success =
                                    await controller.registerfunction();
                                if (success == true) {
                                  Get.offAllNamed(LoginScreen5.name);
                                }
                              }
                              controller.isError.value = true;
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.vmin, vertical: 3.vmin),
                              child: Text("تسجيل حساب",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.spa,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 4.vmin,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
