import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDonations extends StatelessWidget {
  const MyDonations({super.key});
  static const name = '/my_donations';
  static final page = GetPage(
    name: name,
    page: () =>  MyDonations(),
    //binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("معلومات التبرع",
        style:
        TextStyle(
        fontSize: 14.spa,
        fontWeight: FontWeight.w600
    ),),
    centerTitle: true,
    actions: [
    IconButton(
    onPressed: (){
    Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_forward))
    ],
    ),
    );
  }
}

