// import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
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
    // GetPage(
    //   name: RouteNames.newDetail,
    //   page: () => const NewsDetailPage(),
    // ),
    // GetPage(
    //   name: RouteNames.newList,
    //   page: () => const NewsListPage(),
    // ),
    // GetPage(
    //     name: RouteNames.statsRank,
    //     page: () => const StatsRankPage(),
    //     binding: NewDetailBinding()),
    // GetPage(
    //     name: RouteNames.teamRank,
    //     page: () => const TeamRankPage(),
    //     binding: RankBinding()),
    // GetPage(
    //   name: RouteNames.picksPlayerDetail,
    //   page: () => const PlayerDetailPage(),
    // ),
  ];
}
