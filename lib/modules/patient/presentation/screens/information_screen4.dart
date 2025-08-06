// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
// import 'package:Pationt_Donor/modules/patient/presentation/screens/home_screen.dart';

// import '../../../../core/core_components/app_button.dart';
// import '../../../../core/core_components/app_text_form_field.dart';

// class InformationScreen4 extends StatelessWidget {
//   const InformationScreen4({super.key});
//   static const name = '/information4';
//   static final page = GetPage(
//     name: name,
//     page: () => const InformationScreen4(),
//     //binding: LoginBinding(),
//     // middlewares: [
//     //   LoginMiddleware(),
//     // ]
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Wallpaper(
//           num: 0.3,
//           image: "assets/images/pattern.png",
//         ),
//     Scaffold(
//     backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         shape: Border.all(),
//         leading:  Padding(
//           padding:  EdgeInsets.only(right:4.vmin),
//           child: Image.asset("assets/images/logoo.png",
//               width:25.vmin
//           ),
//         ),
//         title:  Text("المعلومات الشخصية",
//             style: TextStyle(
//                 fontSize: 14.spa,
//                 fontWeight: FontWeight.w600)
//         ),
//         actions: [
//           IconButton(
//               onPressed:()=> Navigator.pop(context,),
//               icon: Icon(Icons.arrow_forward,size: 10.vmin,)),

//         ],
//       ),
//     body: SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding:  EdgeInsets.all(5.vmin),
//           child: Column(
//     children: [
//                   AppTextFormField(
//                     hint: "شركة التأمين",
//                     // controller: ,
//                     // validator: ,
//                   ),
//                   SizedBox(
//                     height: 5.vmin,
//                   ),
//                   AppTextFormField(
//                     hint: "رقم بطاقة التأمين",
//                     // controller: ,
//                     // validator: ,
//                   ),
//                   SizedBox(
//                         height: 5.vmin,
//                   ),
//                   AppTextFormField(
//                         hint: "هل أنت مدخن",
//                         // controller: ,
//                         // validator: ,
//                   ),
//       SizedBox(
//         height: 10.vmin,
//       ),
//       AppButton(
//           text: "التالي",
//           ontap: (){
//             Get.toNamed(HomeScreen.name);
//           }),
//       SizedBox(
//         height: 10.vmin,
//       )

//                     ],
//           ),
//         ),
//       ),
//     ),
//     )
//       ],
//     )
//       ;
//   }
// }
