import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/about.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/profile_screen.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/setting.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/share.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/cases_card.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/my_donations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/core_components/notifi_card.dart';
import '../../../../core/core_components/wallpaper.dart';
import '../../../../main.dart';
import '../../../auth/presentation/controllers/login/login_binding.dart';
import 'notifi_d_screen.dart';

class DHomeScreen extends StatefulWidget {
  const DHomeScreen({
    super.key,
  });

  static const name = '/dhome';
  static final page = GetPage(
    name: name,
    page: () => DHomeScreen(),
    binding: LoginBinding(),
    // middlewares: [
    //   LoginMiddleware(),
    // ]
  );

  @override
  State<DHomeScreen> createState() => DHomeScreenState();
}

class DHomeScreenState extends State<DHomeScreen> {

  final controller = Get.put((HomeControllerd()));
  
  @override
  void initState() {
    super.initState();

    }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final String? email1 = CacheHelper.get("email");

    final String? email = CacheHelper.get("email");
    final String? first_name = CacheHelper.get("first_name");
    final String? last_name = CacheHelper.get("last_name");
    final String? father_name = CacheHelper.get("father_name");
String fullName = "${ first_name?? ''} ${father_name ?? ''} ${last_name ?? ''}";

    int notificationCount = 4;

    return Stack(children: [
      Wallpaper(image: "assets/images/pattern.png", num: 0.3),
      Scaffold(
          endDrawer: Drawer(
            backgroundColor: Colors.white,
            clipBehavior: Clip.antiAlias,
            width: 90.w,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: ConstColors.darkBlue),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10.vmin,
                        ),
                        CircleAvatar(
                          radius: 7.vmin,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: ConstColors.darkBlue,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          fullName.trim().isEmpty ? 'الاسم غير متوفر' : fullName,

                      
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                           email ?? 'البريد غير متوفر',
                        
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: ConstColors.darkBlue,
                  ),
                  title: Text(
                    'الصفحة الشخصية',
                    style: TextStyle(color: ConstColors.darkBlue),
                  ),
                  onTap: () {
                    Get.to(() => ProfileScreen()); // يغلق الدراور
                  },
                ),
                ListTile(
                  leading:
                      Icon(Icons.attach_money, color: ConstColors.darkBlue),
                  title: Text(
                    'تبرعاتي',
                    style: TextStyle(color: ConstColors.darkBlue),
                  ),
                  onTap: () {
                    Get.toNamed(MyDonations.name); // يغلق الدراور
                  },
                ),

                ListTile(
                  leading: Icon(Icons.info, color: ConstColors.darkBlue),
                  title: Text('حول التطبيق',
                      style: TextStyle(color: ConstColors.darkBlue)),
                  onTap: () {
                    Get.to(() => AboutAppPage()); // يغلق الدراور
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: ConstColors.darkBlue),
                  title: Text('تسجيل الخروج ',
                      style: TextStyle(color: ConstColors.darkBlue)),
                  onTap: () async {
                  await CacheHelper.clear();
                    Get.offAllNamed(LoginScreen5.name,arguments: {'role': 'donor'},);


                  
                    Get.to(() => LoginScreen5(role: 'donor'));
                  },
                ),
              ],
            ),
          ),
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: EdgeInsets.only(right: 4.vmin),
              child: Image.asset("assets/images/logoo.png", width: 25.vmin),
            ),
            title: Text(
              "أهلاً بك",
              style: TextStyle(fontSize: 14.spa, fontWeight: FontWeight.w600),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 3.vmin, right: 1.vmin),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu, size: 25),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          body: GetBuilder<HomeControllerd>(
           
            builder: (controller) => controller.isloading
                ? Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: () async => controller.Diseases(),
                    child: controller.data == null || controller.data!.isEmpty
                        ? Center(child: Text("  لا يوجد حالات للتبرع حالياً"))
                        : ListView.builder(
                            itemCount: controller.data?.length ?? 0,
                            itemBuilder: (context, i) => CasesCard(
                                  ontap: () {},
                                  model: controller.data![i],
                                  index: i,
                                )),
                  ),
          ))
    ]);
  }
}
