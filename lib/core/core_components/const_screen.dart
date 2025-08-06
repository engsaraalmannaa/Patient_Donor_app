import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstScreen extends StatelessWidget {
  const ConstScreen({super.key});

  // static const name = '/homescreen';

  // static final page = GetPage(
  //     name: name,
  //     page: () => HomeScreen(),
  //     binding: BindingsBuilder(() {
  //       Get.put(HomeController());
  //     }));


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
            appBar:  AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("الإشعارات",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
            //endDrawer: CustomDrawer(),
            body: Padding(
        padding: EdgeInsets.all(3.w),
              child: Column(
children: [
  
],
              ), 
            ))]);
              
            
      
    
  }
}