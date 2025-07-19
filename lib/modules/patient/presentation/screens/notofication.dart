import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/notifi_card.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';

class NotificationP extends StatelessWidget {
  const NotificationP({super.key});
  static const name = '/notification';

  static final page = GetPage(
    name: name,
    page: () => const NotificationP(),
  );

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
          body: SingleChildScrollView(
            child: Column(
              children: [
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
                NotificationCard(),
            
              ],
            ),
          )
        )
      ],
    );
  }
}
