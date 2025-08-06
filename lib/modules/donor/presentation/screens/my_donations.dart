import 'package:Pationt_Donor/core/core_components/container2.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/my_donations_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyDonations extends StatelessWidget {
  MyDonations({super.key});
  static const name = '/my_donations';
  static final page = GetPage(
    name: name,
    page: () => MyDonations(),
  );
  final controller = Get.put((MyDonationsController()));
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white30, Colors.black26],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        GetBuilder<MyDonationsController>(
            init: MyDonationsController(),
            builder: (controller) {
              return controller.isloading
                  ? Center(child: CircularProgressIndicator())
                  : Scaffold(
                      key: scaffoldKey,
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
                    body: Form( key: key,
                    
                    
                    child: SingleChildScrollView(
                      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Expanded(
              child: GetBuilder<MyDonationsController>(
                initState: (state) {
                  controller.Donations();
                },
                builder: (controller) {
                  if (controller.isloading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return RefreshIndicator(
                    onRefresh: () async => controller.Donations(),
                    child: ListView.builder(
                        itemCount: controller.data?.length,
                        itemBuilder: (context, i) {
                          return Container2(
                            ontap: () => {},
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
                    ), ),
                    );
            }),
      ],
    );
  }
}
