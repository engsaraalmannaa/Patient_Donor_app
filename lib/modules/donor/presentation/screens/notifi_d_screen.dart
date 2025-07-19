import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/notifi_card.dart';

class NotifiDScreen extends StatelessWidget {
  const NotifiDScreen({super.key});

  static const name = '/notifidscreen';
  static final page = GetPage(
    name: name,
    page: () =>  NotifiDScreen(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("اشعاراتي",
          style:
          TextStyle(
              fontSize: 14.spa,
              fontWeight: FontWeight.w600
          ),),
        centerTitle: true,
      ),
body: ListView.builder(
    itemCount: 5,
    itemBuilder:(context , i) =>
    NotificationCard(),
)
    );
  }
}
