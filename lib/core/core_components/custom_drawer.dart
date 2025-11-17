import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:Pationt_Donor/modules/patient/data/data_source/profile_data_source.dart';
import 'package:Pationt_Donor/modules/patient/data/model/consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/data/model/profile_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/profile_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/about_hospital.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment_in_hold.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_appointments.dart.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_disease.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/about_app.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/profile_screen.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
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
    final String? email = CacheHelper.get("email");
    final String? first_name = CacheHelper.get("first_name");
    final String? last_name = CacheHelper.get("last_name");
    final String? father_name = CacheHelper.get("father_name");

    String fullName =
        "${first_name ?? ''} ${father_name ?? ''} ${last_name ?? ''}";

    return Drawer(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      width: 90.w,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstColors.darkBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    color: Colors.white,
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
              Icons.event,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'مواعيدي',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(MyAppointments.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pending,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'مواعيد قيد الإنتظار',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(AppointmentInHold.name);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.volunteer_activism,
              color: ConstColors.darkBlue,
            ),
            title: Text(
              'طلباتي للتبرع',
              style: TextStyle(
                  color: ConstColors.darkBlue, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              Get.toNamed(MyDisease.name);
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
              Get.toNamed(AboutAppScreen.name);
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
              Get.toNamed(AboutHospitalScreen.name);
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
             
            },
          ),
        ],
      ),
    );
  }
}
