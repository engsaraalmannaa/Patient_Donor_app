// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
// import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen.dart';
// import '../../../../core/const/const_colors.dart';
// import '../../../../core/core_components/app_text_form_field.dart';
// import '../../../donor/presentation/screens/d_home_screen.dart';
// import '../../../patient/presentation/screens/home_screen.dart';
// import '../controllers/register/register_binding.dart';
// import '../controllers/register/register_patient_controller.dart';
// import 'login_screen_donor.dart';

// class RegisterScreen extends GetView<RegisterController> {
//   final String role;

//   RegisterScreen({super.key,required this.role});

//   static const name = '/r';
//   static final page = GetPage(
//     name: name,
//     page: () =>  RegisterScreen(role:"kk"),
//     binding: RegisterBinding(),
//     // middlewares: [
//     //   LoginMiddleware(),
//     // ]
//   );
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Wallpaper(
//           num: 0.3,
//           image: "assets/images/pattern.png",
//         ),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: AppBar(
//             title:
//             Text("تسجيل حساب",
//                 style: TextStyle(
//                     fontSize: 14.spa,
//                     fontWeight: FontWeight.bold
//                 )),
//           ),
//           body: SizedBox(
//             width: double.infinity,
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(2.5.vmin),
//               physics: const BouncingScrollPhysics(),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     Opacity(
//                       opacity: 0.9,
//                       child: CircleAvatar(
//                           backgroundColor: Colors.white12,
//                           foregroundColor: Colors.transparent,
//                           radius: 21.vmin,
//                           backgroundImage:
//                           ExtendedAssetImageProvider("assets/images/logoo.png")
//                         // child: Icon(
//                         //   Icons.person,
//                         //   size: 37.vmin,
//                         // ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.5.vmin,
//                     ),
//                     const Divider(
//                         color: ConstColors.darkBlue
//                     ),
//                     Text(
//                       "ادخل بياناتك",
//                       style: TextStyle(
//                         //color: ConstColors.darkBlue,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14.spa
//                       ),
//                     ),
//                     SizedBox(
//                       height: 2.5.vmin,
//                     ),
//                     AppTextFormField(
//                       hint: 'الاسم',
//                       icon: const Icon(Icons.perm_identity_outlined),
//                       keyboardType: TextInputType.name,
//                       controller: controller.nameController,
//                       validator: (value){
//                         if(value == null || value.isEmpty){
//                           return 'الاسم مطلوب';
//                         }
//                         return null;
//                       },
//                     ),
//                     AppTextFormField(
//                       hint: 'البريد الالكتروني',
//                       icon: const Icon(Icons.email_outlined),
//                       keyboardType: TextInputType.emailAddress,
//                       controller: controller.emailController,
//                       validator: (value){
//                         if(value == null || value.isEmpty){
//                           return 'البريد الالكتروني مطلوب';
//                         }
//                         if(! value.isEmail ){
//                           return 'البريد الالكتروني غير صحيح';
//                         }
//                         return null;
//                       },
//                     ),
//                     AppTextFormField(
//                       hint: 'كلمة المرور',
//                       icon: const Icon(Icons.lock_outlined),
//                       isPass: true,
//                       controller: controller.passwordController,
//                       validator: (String? value){
//                         if(value == null || value.isEmpty){
//                           return 'كلمة المرور مطلوبة !';
//                         }
//                         if(value.length < 6){
//                           return 'كلمة المرور يجب ان تكون 6 خانات';
//                         }
//                         return null;
//                       },
//                     ), AppTextFormField(
//                       hint: 'تاكيد كلمة المرور',
//                       icon: const Icon(Icons.check),
//                       isPass: true,
//                       controller: controller.confirmPassController,
//                       validator: (String? value){
//                         if(value == null || value.isEmpty){
//                           return 'تاكيد كلمة المرور مطلوب';
//                         }
//                         if(value != controller.passwordController.text){
//                           return "كلمة المرور غير صحيحة";
//                         }
//                         return null;
//                       },
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(2.vmin),
//                       child:
//                       GetBuilder<RegisterController>(
//                         builder: (controller) {
//                           return  controller.isloading ? const CircularProgressIndicator(
//                             color: ConstColors.darkBlue,
//                           ):ElevatedButton(
//                             onPressed:() async {
//                             print("after valid");
//                             if (formKey.currentState!.validate()) {
//                               print("test");
//                               await controller.registerfunction();
//                               if (
//                               role == 'patient')
//                               {

//                                 Get.offAllNamed(HomeScreen.name);
//                               }
//                               else if (role == 'donor'){
//                                 Get.offAllNamed(DHomeScreen.name);
//                               };
//                               //Get.offAllNamed(DHomeScreen.name);
//                             }


//                           },
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 12.vmin,
//                                   vertical: 3.vmin
//                               ),
//                               child: Text(
//                                   "تسجيل حساب",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14.spa,
//                                       fontWeight: FontWeight.bold
//                                   )),
//                             ),
//                           );
//                         }
//                       ),
//                     ),
//                     SizedBox(
//                       height: 4.vmin,
//                     ),
//                     InkWell(
//                       onTap: (){
//                         Get.offAllNamed(InformationScreen.name);
//                       },
//                       child: Text.rich(
//                         TextSpan(
//                             text: "لديك حساب ",
//                             children: [
//                               TextSpan(
//                                 text: "سجل دخول الان",
//                                 style: TextStyle(
//                                     color: context.theme.primaryColor,
//                                     fontWeight: FontWeight.bold
//                                 ),
//                               )
//                             ]
//                         ),
//                         style: TextStyle(
//                             fontSize: 13.spa
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
