import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/10/20:33

class GlobalNestedKey {
  static const NEWS = 1;
  static const PICKS = 2;
  static const TEAM = 3;
  static const TRADE = 4;
  static const LEAGUES = 5;
  static var NewsTabGlobalKey = Get.nestedKey(GlobalNestedKey.NEWS);
  static var PicksTabGlobalKey = Get.nestedKey(GlobalNestedKey.PICKS);
  static var TeamTabGlobalKey = Get.nestedKey(GlobalNestedKey.TEAM);
  static var TRADETabGlobalKey = Get.nestedKey(GlobalNestedKey.TRADE);
  static var LEAGUESTabGlobalKey = Get.nestedKey(GlobalNestedKey.LEAGUES);
}
