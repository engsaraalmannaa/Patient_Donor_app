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
  const DHomeScreen({super.key,});

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
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController id = TextEditingController();
  late String userName;
  late String userEmail;
  final controller = Get.put((HomeControllerd()));
  //get email => null;

  @override
  void initState() {
    super.initState();
    
    userName = CacheHelper.get("user_name") ?? "";
    userEmail = CacheHelper.get("user_email") ?? "";

    name.text = userName;
    email.text = userEmail;
    phone.text = CacheHelper.get("user_phone") ?? "";
    id.text = CacheHelper.get("user_id") ?? "";

    print("ID: ${id.text}");
    print("Email: ${userEmail}");
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
//     String? name = CacheHelper.get<String>('user_name');
// String? email = CacheHelper.get<String>('user_email');
    // عدّل هذا الرقم لاحقاً ليأتي من مزوّد بيانات الإشعارات عندك
    int notificationCount = 4;

    return Stack(children: [
      Wallpaper(image: "assets/images/pattern.png", num: 0.3),
      Scaffold(
          drawer: Drawer(
            backgroundColor: Colors.white,
            clipBehavior: Clip.antiAlias,
            width: 380.vmin,
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
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                           "",

                          ///name ?? 'الاسم',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "",
                          //DHomeScreen.email ?? 'الاسم',
                          style: TextStyle(
                            color: Colors.red,
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
                    String? role =
                        CacheHelper.get("user_role"); // احفظيها مؤقتاً
                    await CacheHelper.clear();
                    if (role != null)
                      await CacheHelper.set(key: "user_role", value: role);

                    //   await CacheHelper.clear();
                    // Get.toNamed(
                    //   LoginScreen5.name,
                    //   arguments: ["role"] == ["donor"],
                    // ); // يغلق الدراور

                    Get.to(() => LoginScreen5(role: 'donor'));
                  },
                ),
                ListTile(
                    leading:
                        Icon(Icons.emoji_emotions, color: ConstColors.darkBlue),
                    title: Text(
                      'قيَم التطبيق',
                      style: TextStyle(color: ConstColors.darkBlue),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('تقييم التطبيق'),
                          content: Text('هل ترغب في تقييم التطبيق الآن؟'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('لاحقاً'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                final url = Uri.parse(
                                    'https://play.google.com/store/apps/details?id=com.example.yourapp'); // غيّر الرابط لرابط تطبيقك
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('تعذر فتح رابط المتجر')),
                                  );
                                }
                              },
                              child: const Text('نعم'),
                            ),
                          ],
                        ),
                      );
                    }),
                // يغلق الدراور
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
                    IconButton(
                      icon: Icon(Icons.ac_unit, size: 25),
                      onPressed: () {
                        showLocalNotification(
                          title: "إشعار جديد",
                          body: "مرحبا! هذا إشعار بدون فايربيس",
                        );
                        // افتح صفحة الإشعارات مثلاً
                        //Get.to(() => NotifiDScreen());
                      },
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.notifications, size: 25),
                          onPressed: () {
                            // افتح صفحة الإشعارات مثلاً
                            Get.to(() => NotifiDScreen());
                          },
                        ),
                        if (notificationCount > 0)
                          Positioned(
                            right: 9,
                            top: 2,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                              ),
                              child: Text(
                                '$notificationCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Builder(builder: (context) {
                      return IconButton(
                        icon: Icon(Icons.menu, size: 25),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          body: GetBuilder<HomeControllerd>(
            initState: (state) async {
              await controller.Diseases();
            },
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
