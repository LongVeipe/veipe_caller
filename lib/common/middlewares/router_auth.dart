import 'package:flutter/material.dart';
import 'package:lv_caller/common/routes/routes.dart';
import 'package:lv_caller/common/store/store.dart';

import 'package:get/get.dart';


class RouteAuthMiddleware extends GetMiddleware {

  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL || route == AppRoutes.Message) {
      return null;
    } else {
      Future.delayed(
          const Duration(seconds: 2), () => Get.snackbar("Tips", "Login expired, please login again!"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
