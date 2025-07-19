import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import '../../../../core/core_components/custom_dropdown.dart';


class Appointment extends StatefulWidget {
  const Appointment({super.key});

  static const name = '/appointment';

  static final page = GetPage(
    name: name,
    page: () => const Appointment(),
  );

  @override
  State<Appointment> createState() => _AppointmentState();
}




class _AppointmentState extends State<Appointment> {
  //String? selectedValue;
  String? selectedCountry;
  final Map<String, List<String>> data = {
    'عينية': ['علي', 'حازم', 'همام'],
    'هضمية': ['تميم', 'عاصم', 'زهير'],
    'قلبية': ['ايمن', 'تمام', 'كاظم'],
  };

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25.vmin,
                ),
                CustomDropdown(
                  hint1: 'اختر التخصص المناسب',
                  hint2:"اختر الطبيب",
                  items:data.keys.toList(),
                  onChanged: (value) {
                    setState(() {
                      var selectedDoctor = value;
                    });
                    print('تم اختيار التخصص: $value');
                  },
                  data: data,
                ),
                // SizedBox(height: 20),
                SizedBox(
                  height: 15.vmin,
                ),
                AppButton(text: "تم", ontap:(){
                  showSnackBar("تم حجز موعد .. سيتم ابلاغك بالوقت");

                } )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
