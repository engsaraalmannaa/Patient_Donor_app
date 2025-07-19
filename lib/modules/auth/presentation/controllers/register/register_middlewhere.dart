// import 'package:Pationt_Donor/core/const/app_key.dart';
// import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
// import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/routes/route_middleware.dart';

// class RegisterMiddlewhere extends GetMiddleware {
//   String? role;

//   @override
//   RouteSettings? redirect(String? route) {
//     final token = CacheHelper.get(AppKey.token);
//     if (token != null) {
//       if (role == "patient") {
//         return const RouteSettings(name: LoginScreen5.name, arguments: ['role'] == ['patient']);
//       }
//         return const RouteSettings(name: LoginScreen5.name, arguments: ['role'] == ['donor']);

//     }

//     return null;
//   }
// }
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class RegisterMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final role = CacheHelper.get('userRole'); // أو بأي طريقة تستدعي القيمة

    if (role == 'patient') {
      return const RouteSettings(name:LoginScreen5.name, arguments: ['role'] == ['patient'] );
    } else if (role == 'donor') {
      return const RouteSettings(name: LoginScreen5.name, arguments: ['role'] == ['donor']);
    }

    return null; // ما تغير التوجيه
  }
}
