/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:33:28
 * @LastEditTime: 2025-01-18 19:50:55
 */
// import 'package:arm_chair_quaterback/pages/news/new_detail/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
// import 'package:arm_chair_quaterback/pages/news/new_list/view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
// import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/inbox/widgets/inbox_detail.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/view.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/view.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/view.dart';
import 'package:arm_chair_quaterback/pages/message/view.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/daily_task/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/view.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/news_detail2.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/view.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/view.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/view.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/view.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/view.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/illustraction_detail.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/binding.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/view.dart';
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
      page: () => PlayerDetailPage(
        arguments: Get.arguments,
      ),
    ),
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
      name: RouteNames.picksPicksHistory,
      page: () => const PicksHistoryPage(),
      binding: PicksHistoryBinding(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamDetailPage,
      page: () {
        return const TeamDetailPage();
      },
    ),
    GetPage(
        opaque: false,
        name: RouteNames.nbaRank,
        page: () => const NBARankPage(),
        binding: RankBinding()),
    GetPage(
      opaque: false,
      name: RouteNames.leagueLeagueDetail,
      page: () => const LeagueDetailV2Page(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.inboxDetail,
      page: () => const InboxDetailPage(),
    ),
    GetPage(
        opaque: false,
        name: RouteNames.picksPickRank,
        page: () => const PickRankPage(),
        binding: PickRankBinding()),
    GetPage(
        opaque: false,
        name: RouteNames.mineMineSetting,
        page: () => const MineSettingPage(),
        binding: MineSettingBinding()),
    GetPage(
        opaque: false,
        name: RouteNames.mineMineAccount,
        page: () => const MineAccountPage(),
        binding: MineAccountBinding()),
    GetPage(
        opaque: false,
        name: RouteNames.picksReciveRward,
        page: () => const ReceiveRewardPage(),
        binding: ReciveRwardBinding()),
    GetPage(
      opaque: false,
      name: RouteNames.teamBeautyPage,
      page: () => const BeautyPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        opaque: false,
        name: RouteNames.mineDailyTask,
        page: () => const DailyTaskPage(),
        binding: DailyTaskBinding()),
    GetPage(
      opaque: false,
      name: RouteNames.illustrationPage,
      page: () => const IllustratiionsPage(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.illustrationDetail,
      page: () => const IllustratiionsDetail(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.seaonRankPage,
      page: () => const SeaonRankPage(),
      binding: SeaonRankBinding(),
    ),
    GetPage(
      opaque: false,
      name: RouteNames.teamHistory,
      page: () => const TeamHistortyPage(),
      // binding: TeamHistortBinding(),
    ),
  ];
}
