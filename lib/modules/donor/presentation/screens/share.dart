import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppPage extends StatelessWidget {
  const ShareAppPage({Key? key}) : super(key: key);

  final String appUrl = 'https://play.google.com/store/apps/details?id=com.example.yourapp';
  static const name = '/s';
  static final page = GetPage(
    name: name,
    page: () =>  ShareAppPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مشاركة التطبيق')),
      body: Center(
        child: ElevatedButton.icon(
          icon:  Icon(Icons.share),
          label:  Text('مشاركة التطبيق'),
          onPressed: () {
            Share.share('جرب هذا التطبيق الرائع: $appUrl');
          },
        ),
      ),
    );
  }
}
