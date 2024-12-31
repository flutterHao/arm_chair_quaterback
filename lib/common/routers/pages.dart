/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:33:28
 * @LastEditTime: 2024-12-31 15:13:49
 */
// import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/view.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/view.dart';
import 'package:arm_chair_quaterback/pages/message/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_detail2.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_detail_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/open_box_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/start_upgrade_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/view.dart';
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
      // customTransition: HalfSlideRightToLeftTransition(),
      page: () => NewsDetailPage2(newsDetail: Get.arguments),
      name: RouteNames.newsDetail2,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.leagueLeagueDetail,
      page: () => const LeagueDetailPage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamMemberPage,
      page: () => const TeamMenberView(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamTeamUpgrade,
      page: () => TeamUpgradePage(player: Get.arguments['player']),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.openBoxPage,
      page: () => OpenBoxPage(item: Get.arguments),
      transition: Transition.fadeIn,
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamStartUpGrade,
      page: () => StartUpgradeWidget(player: Get.arguments['player']),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.message,
      page: () => const MessagePage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.picksPicksHistory,
      page: () => const PicksHistoryPage(),
      binding: PicksHistoryBinding(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamDetailPage,
      page: () {
        return TeamDetailPage();
      },
    ),
  ];
}
