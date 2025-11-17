import 'package:Pationt_Donor/modules/patient/presentation/screens/my_disease.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/custom_buttom_appbar.dart';
import 'package:Pationt_Donor/core/core_components/custom_drawer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/concultations.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/add_disease_state.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/about_app.dart';

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
    return _HomeScreenState();
  }
}

class _HomeScreenState extends StatefulWidget {
  @override
  State<_HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<_HomeScreenState> {
  int currentIndex = 2;

  final List<Widget> screens = [
    Consultations(),
    Appointment(),
    Center(child: Text("الصفحة الرئيسية")),
    DonationState(),
    ShowMyConsultation(),
  ];
  final List<PreferredSizeWidget?> appBars = [
    AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.vmin),
        ),
      ),
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("كتابة استشارة",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.vmin),
        ),
      ),
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("حجز موعد",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.vmin),
        ),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.vmin),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("طلب تبرع",
          style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600)),
    ),
    AppBar(
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.vmin),
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(right: 4.vmin),
        child: Image.asset("assets/images/logoo.png", width: 25.vmin),
      ),
      title: Text("استشاراتي",
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
        padding: EdgeInsets.all(1.vmin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.5.h),
            Expanded(
              child: GetBuilder<HomeController>(
                initState: (state) {
                  controller.indexConsultations();
                },
                builder: (controller) {
                  if (controller.isloading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return RefreshIndicator(
                    onRefresh: () async => controller.indexConsultations(),
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
