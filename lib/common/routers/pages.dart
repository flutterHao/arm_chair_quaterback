/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:33:28
 * @LastEditTime: 2024-10-08 12:22:56
 */
// import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/team_training.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home/home_page.dart';
import 'routes.dart';

class AppPages {
  static const main = RouteNames.main;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: main,
      page: () => const HomePage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamTeamBattle,
      binding: BindingsBuilder(() {
        Get.lazyPut<TeamBattleController>(() => TeamBattleController());
      }),
      page: () => const TeamBattlePage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.picksPlayerDetail,
      page: () => const PlayerDetailPage(),
      binding: PlayerDetailBinding(),
    ),
  ];
}
