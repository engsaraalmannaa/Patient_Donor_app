import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';

import '../../modules/patient/presentation/screens/appointment.dart';
import '../../modules/patient/presentation/screens/concultations.dart';
import '../../modules/patient/presentation/screens/about_app.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: ConstColors.darkBlue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap:onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.quickreply_sharp),
          label: 'استشارة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'موعد',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 35,
            color: Colors.lightBlue, 
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_add),
          label: 'تبرع',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_answer),
          label: 'استشاراتي',
        ),
      ],
    );
  }
}
