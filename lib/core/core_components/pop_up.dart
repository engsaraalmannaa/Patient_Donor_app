import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoader() => showDialog(
    context: Get.context!,
    builder: (_) => Center(
      child: CircularProgressIndicator(),
    )
);

void showSnackBar(String text)=>
    ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text(text),
       backgroundColor: Colors.grey.shade700,
       duration: Duration(seconds: 3),)
    );

class GlobalTextController extends GetxController {
  final TextEditingController controller = TextEditingController();

  void clearTextField() {
    controller.clear();
  }

  void submitAndClear(
      BuildContext context,
      final String phrase)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade700,
        content: Text(phrase),
        //Text("تم ارسال الاستشارة .. سيتم الرد بأقرب وقت"),
        duration: Duration(seconds: 3),
      ),
    );
    controller.clear();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}




