/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-06 16:22:41
 * @LastEditTime: 2024-09-27 21:39:01
 */
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/message/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/trade/trade_index/controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class AllControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NewListController(), fenix: true);
    Get.lazyPut(() => TeamIndexController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);

    //数据加载太慢，启动提前加载
    Get.put(TradeIndexController());
    Get.put(PicksIndexController()..preLoadData());
    Get.put(LeagueController()..preLoadData());
  }
}
