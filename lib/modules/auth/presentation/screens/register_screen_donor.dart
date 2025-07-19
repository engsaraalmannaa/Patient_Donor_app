
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_donor_controller.dart';
import 'package:Pationt_Donor/modules/auth/presentation/controllers/register/register_middlewhere.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen.dart';
import '../../../../core/const/const_colors.dart';
import '../../../../core/core_components/app_text_form_field.dart';
import '../controllers/register/register_binding.dart';
import '../controllers/register/register_patient_controller.dart';
import 'login_screen_donor.dart';

class RegisterScreenDonor extends GetView<RegisterdonorController> {
   RegisterScreenDonor({super.key});
    final role = Get.arguments?['role'] ?? 'patient';

  static const name = '/rd';
  static final page = GetPage(
    name: name,
    page: () =>  RegisterScreenDonor(),
    binding: RegisterBinding(),
    // middlewares: [
    //   RegisterMiddleware(),
    // ]
  );
  final formKey = GlobalKey<FormState>();

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
            title:
            Text("تسجيل حساب",
                style: TextStyle(
                  fontSize: 14.spa,
                    fontWeight: FontWeight.bold
                )),
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
                        backgroundImage:
                        ExtendedAssetImageProvider("assets/images/logoo.png")
                        // child: Icon(
                        //   Icons.person,
                        //   size: 37.vmin,
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    const Divider(
                      color: ConstColors.darkBlue
                    ),
                    Text(
                      "ادخل بياناتك",
                      style: TextStyle(
                          //color: ConstColors.darkBlue,
                        color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.spa
                      ),
                    ),
                    SizedBox(
                      height: 2.5.vmin,
                    ),
                    AppTextFormField(
                      hint: ' الاسم الاول',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.first_nameController
                      ,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'الاسم مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: ' اسم الأب',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.father_nameController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'اسم الأب مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: ' الكنية',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.last_nameController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'الكنية مطلوبة';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: 'البريد الالكتروني',
                      icon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'البريد الالكتروني مطلوب';
                        }
                        if(! value.isEmail ){
                          return 'البريد الالكتروني غير صحيح';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: 'كلمة المرور',
                      icon: const Icon(Icons.lock_outlined),
                      isPass: true,
                      controller: controller.passwordController,
                      validator: (String? value){
                        if(value == null || value.isEmpty){
                          return 'كلمة المرور مطلوبة !';
                        }
                        if(value.length < 6){
                          return 'كلمة المرور يجب ان تكون 6 خانات';
                        }
                      },
                    ), AppTextFormField(
                      hint: 'تاكيد كلمة المرور',
                      icon: const Icon(Icons.check),
                      isPass: true,
                      controller: controller.password_confirmationController,
                      validator: (String? value){
                        if(value == null || value.isEmpty){
                          return 'تاكيد كلمة المرور مطلوب';
                        }
                        if(value != controller.passwordController.text){
                          return "كلمة المرور غير صحيحة";
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: 'الجنس',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.genderController
                    ,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'الجنس مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: ' تاريخ الميلاد ',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.birth_dataController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'تاريخ الميلاد مطلوب';
                        }
                      },
                    ),
                     AppTextFormField(
                      hint: 'الرقم الوطني',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.national_numberController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'الرقم الوطني مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: 'العنوان',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.addressController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'العنوان مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: ' رقم الموبايل',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.phone,
                      controller: controller.phoneController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'الرقم مطلوب';
                        }
                      },
                    ),
                    AppTextFormField(
                      hint: ' البلد',
                      icon: const Icon(Icons.perm_identity_outlined),
                      keyboardType: TextInputType.name,
                      controller: controller.countryController,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'هذا الحقل مطلوب';
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.vmin),
                      child:
                      ElevatedButton(
                        onPressed:() async {
                          print("after valid");
                                  if (formKey.currentState!.validate()) {
                                    var success =
                                    await controller.registerfunction();
                                    if (success == true) {
                                      if (controller.userRole == 'patient') {
                                        Get.offAllNamed(LoginScreen5.name);
                                      } else {
                                        Get.offAllNamed(LoginScreen5.name);
                                      }
                                    }
                                    {
                                      print("test");
                                    }
                                  }
                        },
                        //controller.sendData,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.vmin,
                              vertical: 3.vmin
                          ),
                          child: Text(
                              "تسجيل حساب",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 14.spa,
                                  fontWeight: FontWeight.bold
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.vmin,
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     Get.offAllNamed(LoginScreen5.name);
                    //   },
                    //   child: Text.rich(
                    //     TextSpan(
                    //         text: "لديك حساب ",
                    //         children: [
                    //           TextSpan(
                    //             text: "سجل دخول الان",
                    //             style: TextStyle(
                    //                 color: context.theme.primaryColor,
                    //                 fontWeight: FontWeight.bold
                    //             ),
                    //           )
                    //         ]
                    //     ),
                    //     style: TextStyle(
                    //         fontSize: 13.spa
                    //     ),
                    //   ),
                    // )
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

