import 'package:Pationt_Donor/modules/auth/presentation/screens/register_screen_donor.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/register_screen_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/home_screen.dart';
import '../../../../core/const/const_colors.dart';
import '../../../../core/core_components/app_button.dart';
import '../../../../core/core_components/app_text_form_field.dart';
import '../../../donor/presentation/screens/d_home_screen.dart';
import '../controllers/login/login_binding.dart';
import '../controllers/login/login_controller.dart';
import '../controllers/login/login_middleware.dart';

class LoginScreen5 extends GetView<LoginController> {
  String? role;
  LoginScreen5({super.key, this.role});

  static const name = '/login';
  static final page = GetPage(
      name: name,
      page: () => LoginScreen5(),
      binding: LoginBinding(),
      middlewares: [
        LoginMiddleware(),
      ]);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controller.userRole = role!;
    print("controller is: ${controller.emailController}"); // فحص
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: Border.all(),
            leading: Padding(
              padding: EdgeInsets.only(right: 4.vmin),
              child: Image.asset("assets/images/logoo.png", width: 25.vmin),
            ),
            title: Text("تسجيل الدخول",
                style:
                    TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(2.5.vmin),
              physics: BouncingScrollPhysics(),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.vmin,
                      ),
                      AppTextFormField(
                        hint: 'البريد الإلكتروني',
                        icon: const Icon(Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'البريد الإلكنروني مطلوب !';
                          }
                          if (!value.isEmail) {
                            return 'البريد الإلكنروني غير صالح';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5.vmin,
                      ),
                      AppTextFormField(
                        hint: 'كلمة السر',
                        icon: const Icon(Icons.lock_outlined),
                        isPass: true,
                        controller: controller.passwordController,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'كلمة السر مطلوبة !';
                          }
                          if (value.length < 6) {
                            return 'كلمة السر يجب أن تكون على الأقل مكونة من 6 حروف';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8.5.vmin,
                      ),
                      GetBuilder<LoginController>(builder: (controller) {
                        return controller.isloading
                            ? const CircularProgressIndicator(
                                color: ConstColors.darkBlue,
                              )
                            : AppButton(
                                text: "تسجيل الدخول",
                                ontap: () async {
                                  print("after valid");
                                  if (formKey.currentState!.validate()) {
                                    var success =
                                        await controller.loginfunction();
                                    if (success == true) {
                                      if (controller.userRole == 'patient') {
                                        Get.offAllNamed(HomeScreen.name);
                                      } else {
                                        Get.offAllNamed(DHomeScreen.name);
                                      }
                                    }
                                    {
                                      print("test");
                                    }
                                  }
                                });
                      }),
                      SizedBox(
                        height: 8.5.vmin,
                      ),
                      GetBuilder<LoginController>(builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.userRole == 'patient') {
                              Get.offAllNamed(RegisterScreenPatient.name, arguments: {'role': 'patient'});
                            } else {
                              Get.offAllNamed(RegisterScreenDonor.name, arguments: {'role': 'donor'});
                            }
                            //Get.offAllNamed(RegisterScreen.name);
                          },
                          child: Text.rich(
                            TextSpan(text: "ليس لديك حساب،", children: [
                              TextSpan(
                                text: " سجل الآن",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ConstColors.darkBlue),
                              )
                            ]),
                            style: TextStyle(fontSize: 14.spa),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
