import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class AppToast {
  static void showToast({required String message, Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      fontSize: 16.0,
      //textColor: AppColor.toastColor,
      //backgroundColor: color ?? AppColor.primary,
      textColor: Colors.indigo,
        backgroundColor: Colors.white,
    );
  }
}
