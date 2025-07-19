import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../../core/const/app_key.dart';
import '../../../../../core/storage/shared_preferences.dart';
import '../../../../../core/storage/storage_helper.dart';
import '../../../../patient/presentation/screens/home_screen.dart';

class LoginMiddleware extends GetMiddleware {


  @override
  RouteSettings? redirect(String? route) {
    final token = CacheHelper.get(AppKey.token);
      if(token != null  ){
      return const RouteSettings(
          name: HomeScreen.name
      );
        }


          return null;
      }
  }


