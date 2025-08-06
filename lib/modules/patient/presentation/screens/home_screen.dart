import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/custom_buttom_appbar.dart';
import 'package:Pationt_Donor/core/core_components/custom_drawer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/concultations.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/add_disease_state.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/notofication.dart';

import '../../../../core/core_components/container1.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  static const name = '/homescreen';

  static final page = GetPage(
      name: name,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }));

  @override
  Widget build(BuildContext context) {
    return _HomeScreenState(); // استدعاء كلاس داخلي فيه StatefulWidget
  }
}

class _HomeScreenState extends StatefulWidget {
  @override
  State<_HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<_HomeScreenState> {
  int currentIndex = 2; // لازم يكون عندك currentIndex لإدارة الضغط

  final List<Widget> screens = [
    Consultations(),
    Appointment(),
    //HomeScreen(),
    Center(child: Text("الصفحة الرئيسية")),
    DonationState(),
    NotificationP(),
  ];
  final List<PreferredSizeWidget?> appBars = [
    AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("كتابة استشارة",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("حجز موعد",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text(" الاستشارات",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("طلب تبرع",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("الإشعارات",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
  ];

  HomeController controller = Get.put<HomeController>(
    HomeController(),
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
            appBar: appBars[currentIndex],
            endDrawer: CustomDrawer(),
            body: _buildBody(controler: controller),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                /* if (index == 2)
                   //HomeScreen();
                  // الرئيسية، ما نغير
                   Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        */ /*Text(
                          'الاستشارات الخاصة بك:',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),*/ /*
                        SizedBox(height: 2.h),
                        Expanded(
                          child: GetBuilder<HomeController>(
                            initState: (state) async {
                              await controller.Consultation();
                            },
                            builder: (controller) {
                              return controller.isloading ?
                              Center(child: CircularProgressIndicator()) :
                              RefreshIndicator(
                                  onRefresh: () async => controller.Consultations(),
                              child:  ListView.builder(
                                itemCount: controller.data!.length, // ← بدك تجيب عدد الاستشارات من API أو Controller
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text('عنوان الاستشارة ${index + 1}'),
                                      subtitle: Text('محتوى الاستشارة هنا بشكل مختصر...'),
                                      trailing: Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        // فتح التفاصيل مثلاً
                                      },
                                    ),
                                  );
                                },
                              )
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  );*/

                setState(() {
                  currentIndex = index;
                });
              },
            )),
      ],
    );
  }

  Widget _buildBody({required HomeController controler}) {
    if (currentIndex == 2) {
      return Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Expanded(
              child: GetBuilder<HomeController>(
                initState: (state) {
                  controller.Consultations();
                },
                builder: (controller) {
                  if (controller.isloading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return RefreshIndicator(
                    onRefresh: () async => controller.Consultations(),
                    child: ListView.builder(
                        itemCount: controller.data?.length,
                        itemBuilder: (context, i) {
                          return Container1(
                            
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
      );
    } else {
      return screens[currentIndex];
    }
  }
}
