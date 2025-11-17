import 'package:Pationt_Donor/core/core_components/container2.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/my_donations_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDonations extends StatefulWidget {
  MyDonations({super.key});
  static const name = '/my_donations';
  static final page = GetPage(
    name: name,
    page: () => MyDonations(),
  );

  @override
  State<MyDonations> createState() => _MyDonationsState();
}

class _MyDonationsState extends State<MyDonations> {
    MyDonationsController controller = Get.put<MyDonationsController>(MyDonationsController());


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
                        automaticallyImplyLeading: false,
                        title: Text(
                          " تبرعاتي",
                          style: TextStyle(
                              fontSize: 14.spa, fontWeight: FontWeight.w600),
                        ),
                        centerTitle: true,
                        actions: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_forward))
                        ],
                      ),
                    body: Padding(
                            padding: EdgeInsets.all(0.5.vmin),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GetBuilder<MyDonationsController>(
                          
                                    builder: (controller) {
                                      if (controller.isloading) {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      return RefreshIndicator(
                                        onRefresh: () async => controller.Donations(),
                                        child:controller.data == null || controller.data!.isEmpty
                        ? Center(child: Text(" لا يوجد حالات تم التبرع بها "))
                        : ListView.builder(
                      itemCount: controller.data?.length,
                      itemBuilder: (context, i) {
                        return Container2(
                         
                          model: controller.data![i],
                          index: i,
                        );
                      }),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                    )
            
      ],
    );
  }
}
