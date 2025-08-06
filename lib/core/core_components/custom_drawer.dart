import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/profile_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/profile_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/profile_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment_in_hold.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_appointments.dart.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userName = CacheHelper.get('user_name');
    final String? userEmail = CacheHelper.get('user_email');

    //final controller =Get.put (HomeController());
    //final ConsultationModel consultation = Get.put( ConsultationModel());

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstColors.darkBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12.vmin,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 14.vmin,
                    color: ConstColors.darkBlue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  userName ?? 'الاسم غير متوفر',
                  style: TextStyle(
                    //color: Colors.red,
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  userEmail ?? 'البريد غير متوفر',
                  style: TextStyle(
                    color: Colors.red,
                    // color: Colors.white70,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'مواعيد محجوزة',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(MyAppointments.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'ملف شخصي',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () async {
              Get.toNamed(ProfilePatientScreen.name);

            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'اعدادات',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              //Get.toNamed(SettingsScreen.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'حول التطبيق',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              // Handle logout
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pending,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'مواعيد قيد الانتظار ',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              // Handle logout
              Get.toNamed(AppointmentInHold.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.apartment,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'حول المشفى',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              // Handle logout
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'تسجيل خروج',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () async {
              await CacheHelper.clear();
              Get.offAllNamed(LoginScreen5.name);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
