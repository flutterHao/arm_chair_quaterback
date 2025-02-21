import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/10/20:15

class JumpUtils {
  //示例：JumpUtils.goto("/?tab=2&scroll=1")
  static void goto(String url) {
    Uri uri = Uri.parse(url);
    if (uri.path == RouteNames.main) {
      /// 注意：queryParameters 的value都是字符串类型，注意类型转换
      Map<String, dynamic> queryParameters = uri.queryParameters;
      Navigator.popUntil(
          Get.context!, (route) => route.settings.name == RouteNames.main);
      if (queryParameters["tab"] != null) {
        Get.find<HomeController>().goto(int.parse(queryParameters["tab"]));
      }
      if (queryParameters["scroll"] != null) {
        if (queryParameters["scroll"] == "1") {
          Get.find<TeamIndexController>().scroToMatch();
        } else if (queryParameters["scroll"] == "2") {
          Get.find<TeamIndexController>().scrollToSlot();
        }
      }
    } else {
      Get.toNamed(uri.path, arguments: uri.queryParameters);
    }
  }
}
