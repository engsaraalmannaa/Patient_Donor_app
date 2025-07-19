import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const name = '/setting';
  static final page = GetPage(
    name: name,
    page: () => const SettingsPage(),
  );

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'العربية';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات'),
      ),
      body:
      Stack(
        children: [
          Positioned.fill(
      child:
           DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
          /// محتوى الصفحة
          ListView(
            children: [
              ListTile(
                leading:  Icon(Icons.language),
                title:  Text('اللغة'),
                trailing: DropdownButton<String>(
                  value: selectedLanguage,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() => selectedLanguage = newValue);
                    }
                  },
                  items: ['العربية', 'English']
                      .map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(height: 2.h),
              SwitchListTile(
                secondary:  Icon(Icons.dark_mode),
                title:  Text('الوضع الليلي'),
                value: isDarkMode,
                onChanged: (value) {
                  setState(() => isDarkMode = value);
                  // فعّل/عطّل الثيم هنا إن وجد
                },
              ),
              ListTile(
                leading:  Icon(Icons.logout),
                title:  Text('تسجيل الخروج'),
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('تأكيد'),
                    content:
                    const Text('هل أنت متأكد أنك تريد تسجيل الخروج؟'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('إلغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // نفّذ عملية تسجيل الخروج هنا
                        },
                        child: const Text('خروج'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
