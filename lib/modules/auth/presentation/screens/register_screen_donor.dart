import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_donor_controller.dart';
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

class RegisterScreenDonor extends GetView<RegisterdonorController> {
  RegisterScreenDonor({super.key});
  final role = Get.arguments?['role'] ?? 'patient';
  final controller = Get.put(RegisterdonorController());

  static const name = '/rd';
  static final page = GetPage(
    name: name,
    page: () => RegisterScreenDonor(),
    binding: RegisterBinding(),
    // middlewares: [
    //   RegisterMiddleware(),
    // ]
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
                              "assets/images/logoo.png")
                          // child: Icon(
                          //   Icons.person,
                          //   size: 37.vmin,
                          // ),
                          ),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    const Divider(color: ConstColors.darkBlue),
                    Text(
                      "ادخل بياناتك",
                      style: TextStyle(
                          //color: ConstColors.darkBlue,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.spa),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    AppTextFormField(
                      hint: ' الاسم الاول',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.first_nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'الاسم مطلوب';
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
                          //borderSide:  BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                          //borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.vmin),
                          //borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
                        // حفظ القيمة في الكونترولر على شكل نص لتتوافق مع إرسال الـ API
                        controller.genderController.text = value!;
                        //controller. update();
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
                      hint: ' البلد',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.countryController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
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
