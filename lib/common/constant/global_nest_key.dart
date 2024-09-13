import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/10/20:33

class GlobalNestedKey {
  static const NEWS = 1;
  static const PICKS = 2;
  static var NewsTabGlobalKey = Get.nestedKey(GlobalNestedKey.NEWS);
  static var PicksTabGlobalKey = Get.nestedKey(GlobalNestedKey.PICKS);
}
