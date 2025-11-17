import 'dart:developer';

import 'package:Pationt_Donor/modules/donor/presentation/screens/d_home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../core/const/app_key.dart';
import '../../../../../core/storage/shared_preferences.dart';
import '../../../../patient/presentation/screens/home_screen.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = CacheHelper.get(AppKey.token);
    final role = CacheHelper.get(AppKey.role);
    log(token.toString());
    if (token != null && role == "patient") {
      return const RouteSettings(name: HomeScreen.name);
    } else if(token != null && role == "donor"){
      return const RouteSettings(name: DHomeScreen.name);
    }

    return null;
  }
}
