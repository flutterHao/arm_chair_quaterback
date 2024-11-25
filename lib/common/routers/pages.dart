/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:33:28
 * @LastEditTime: 2024-11-24 12:18:45
 */
// import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_detail_page.dart';
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
    ),
    GetPage(
        name: RouteNames.teamBeautyDetail,
        opaque: false,
        page: () => const BeautyDetailPage(),
        transition: Transition.fadeIn),
    GetPage(
      name: RouteNames.league,
      page: () => const LeaguePage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.picksPersonalCenter,
      page: () => const PersonalCenterPage(),
      // binding: PersonalCenterBinding()
    ),
    GetPage(
        opaque: false,
        name: RouteNames.mineMineInfo,
        page: () => const MineInfoPage(),
        binding: MineInfoBinding()),
    GetPage(
      opaque: false,
      // customTransition: HalfSlideRightToLeftTransition(),
      page: () => NewsDetailPage(newsDetail: Get.arguments),
      name: RouteNames.newsDetail,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.leagueLeagueDetail,
      page: () => LeagueDetailPage(),
    ),
    // GetPage(
    //   opaque: false,
    //   name: RouteNames.newsDetail,
    //   page: () {
    //     return NewsListItem(
    //       newsDetail: NewsListDetail(),
    //     );
    //   },
    // ),
  ];
}
