
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login_screen_patient.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/register.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/register_screen_donor.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/about.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/setting.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/share.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/d_home_screen.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/details.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/donation_information.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/my_donations.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/notifi_d_screen.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/donation_state.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/home_screen.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen2.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen3.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/information_screen4.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/notofication.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/switch_screen.dart';
import 'core/const/const_colors.dart';
import 'core/core_components/pop_up.dart';
import 'modules/auth/presentation/controllers/login/login_binding.dart';
import 'modules/auth/presentation/screens/login_screen_donor.dart';
import 'modules/auth/presentation/screens/register_screen_patient.dart';
import 'modules/auth/presentation/screens/splash_screen.dart';
import 'modules/patient/presentation/screens/appointment.dart';
import 'modules/patient/presentation/screens/concultations.dart';
import 'modules/patient/presentation/screens/information_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  Get.put(GlobalTextController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (_, __, ___) => GetMaterialApp(
        locale: Locale('ar'),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        getPages: [
          //LoginScreenDonor.page,
          //LoginScreenPatient.page,
          SplashScreen.page,
          RegisterScreenDonor.page,
          RegisterScreenPatient.page,
          InformationScreen.page,
          InformationScreen2.page,
          InformationScreen3.page,
          InformationScreen4.page,
          HomeScreen.page,
          Appointment.page,
          NotificationP.page,
          Consultations.page,
          DonationState.page,
          SwitchScreen.page,
          DHomeScreen.page,
          DetailsScreen.page,
          DonationInformation.page,
          NotifiDScreen.page,
          MyDonations.page,
          SettingsPage.page,
          AboutAppPage.page,
          ShareAppPage.page,
          LoginScreen5.page,
          //RegisterScreen.page
        ],
        initialBinding: LoginBinding(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: ConstColors.darkBlue,
            foregroundColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
          primaryColor: ConstColors.darkBlue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.grey,
              elevation: 3.5,
              foregroundColor: ConstColors.skyBlue,
              backgroundColor: ConstColors.darkBlue,
            ),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            circularTrackColor: ConstColors.skyBlue,
          ),
        ),
      ),
    );
  }
}

Future<void> showLocalNotification({
  required String title,
  required String body,
}) async {
  final BigTextStyleInformation bigTextStyleInformation =
      BigTextStyleInformation('\u202B$body', htmlFormatBigText: true);
  String rtlMark = '\u200F';
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel_id',
    'إشعارات التطبيق',
    channelDescription: 'إشعارات محلية تظهر من داخل النظام',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    styleInformation: BigTextStyleInformation(
      '$rtlMark$body',
    ),
  );

  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    '$rtlMark$title',
    '$rtlMark$body',
    platformChannelSpecifics,
  );
}
