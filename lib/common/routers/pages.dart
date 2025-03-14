/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:33:28
 * @LastEditTime: 2025-03-13 12:08:42
 */
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/pages/home/home_page.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/binding.dart';
import 'package:arm_chair_quaterback/pages/inbox/inbox_email/view.dart';
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
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/beauty_info_widget.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/chat_detail_page.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/view.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/widgets/illustraction_detail.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/widgets/ovr_standing_detail.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/widgets/player_trend.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/binding.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/view.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/pass_player.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/select_team.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_game/star_upgrade_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/star_upgrade_new/star_upgrade_new.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/start_upgrade/start_upgrade_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const main = RouteNames.main;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static Route generateRoute(RouteSettings settings) {
    pageRouteBuilder(Widget page) {
      return PageRouteBuilder(
        opaque: false,
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
        // 进入动画时间
        reverseTransitionDuration:
            const Duration(milliseconds: Constant.transitionDuration), // 退出动画时间
      );
    }

    Widget widget() {
      Get.routing.args = settings.arguments;
      switch (settings.name) {
        case RouteNames.main:
          return const HomePage();
        case RouteNames.teamTeamBattle:
          return const TeamBattlePage();
        case RouteNames.picksPlayerDetail:
          return PlayerDetailPage(
            arguments: Get.arguments,
          );
        case RouteNames.league:
          return const LeaguePage();
        case RouteNames.picksPersonalCenter:
          return const PersonalCenterPage();
        case RouteNames.mineMineInfo:
          MineInfoBinding().dependencies();
          return const MineInfoPage();
        case RouteNames.newsDetail:
          return NewsDetailPage();
        case RouteNames.newsDetail2:
          return NewsDetailPage2(newsDetail: Get.arguments);
        case RouteNames.teamMemberPage:
          return const TeamMenberView();
        case RouteNames.teamTeamUpgrade:
          return TeamUpgradePage(playerUuid: Get.arguments['playerUuid']);
        // case RouteNames.openBoxPage:
        //   return const OpenBoxPage();
        case RouteNames.teamStartUpGrade:
          return StartUpgradeWidget(player: Get.arguments['player']);
        case RouteNames.picksPicksHistory:
          PicksHistoryBinding().dependencies();
          return PicksHistoryPage(tab: (Get.arguments ?? {})['tab']);
        case RouteNames.teamDetailPage:
          return const TeamDetailPage();
        case RouteNames.nbaRank:
          RankBinding().dependencies();
          return const NBARankPage();
        case RouteNames.leagueLeagueDetail:
          return LeagueDetailV2Page(Get.arguments["item"],
              gameId: Get.arguments["gameId"]);
        case RouteNames.inboxDetail:
          return const InboxDetailPage();
        case RouteNames.picksPickRank:
          PickRankBinding().dependencies();
          return const PickRankPage();
        case RouteNames.mineMineSetting:
          MineSettingBinding().dependencies();
          return const MineSettingPage();
        case RouteNames.mineMineAccount:
          MineAccountBinding().dependencies();
          return const MineAccountPage();
        case RouteNames.picksReciveRward:
          ReciveRwardBinding().dependencies();
          return const ReceiveRewardPage();
        case RouteNames.teamBeautyPage:
          return const BeautyPage();
        case RouteNames.mineDailyTask:
          DailyTaskBinding().dependencies();
          return const DailyTaskPage();
        case RouteNames.illustrationPage:
          return const IllustratiionsPage();
        case RouteNames.illustrationDetail:
          return const IllustratiionsDetail();
        case RouteNames.seaonRankPage:
          SeaonRankBinding().dependencies();
          return const SeaonRankPage();
        case RouteNames.teamHistory:
          TeamHistortyBinding().dependencies();
          return const TeamHistortyPage();
        case RouteNames.inboxEmail:
          InBoxEmailBinding().dependencies();
          return const InboxEmailPage();
        case RouteNames.ovrStandingDetailPage:
          return OvrStandingDetailPage();
        case RouteNames.playerTrendPage:
          return PlayerTrendPage();
        case RouteNames.teamStarUpNew:
          return StarUpgradeNew(Get.arguments["playerUuid"]);
        case RouteNames.teamStarUpGame:
          return StarUpgradeGame(Get.arguments["playerUuid"]);
        case RouteNames.beautyChatDtl:
          return ChatDetailPage();
        case RouteNames.beautyInfo:
          return BeautyInfoWidget();
        case RouteNames.message:
          return MessagePage(
            ///type: 1 赛程和球员 2 赛季ovr排行榜
            type: Get.arguments["type"],
            playerId: Get.arguments["playerId"],
            gameId: Get.arguments["gameId"],
          );
        case RouteNames.battlePassReward:
          return BattlePassPage();
        case RouteNames.battlePassPlayer:
          return PassPlayerPage();
        case RouteNames.selectTeam:
          return SelectTeamPage();
        default:
          return const SizedBox.shrink();
      }
    }

    return pageRouteBuilder(widget());
  }
}
