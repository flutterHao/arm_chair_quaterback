import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/store/store.dart';

import 'package:get/get.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == RouteNames.signIn ||
        route == RouteNames.signUp) {
      return null;
    } else {
      Future.delayed(
          const Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return const RouteSettings(name: RouteNames.signIn);
    }
  }
}
