import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);
  static const name = '/a';
  static final page = GetPage(
    name: name,
    page: () =>  AboutAppPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حول التطبيق')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'عن التطبيق',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'تطبيق يهدف إلى تسهيل عمليات التبرع ومساعدة المرضى في الوصول إلى الدعم اللازم بسرعة وفعالية.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text('الإصدار: 1.0.0'),
            Text('الحقوق محفوظة © 2025'),
          ],
        ),
      ),
    );
  }
}
