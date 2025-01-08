/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2025-01-08 15:38:09
 */

import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/beauty_and_box.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/match_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamIndexPage extends StatefulWidget {
  const TeamIndexPage({super.key});

  @override
  State<TeamIndexPage> createState() => _TeamIndexPageState();
}

class _TeamIndexPageState extends State<TeamIndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _TeamView();
    // return Navigator(
    //   key: GlobalNestedKey.TeamTabGlobalKey,
    //   initialRoute: RouteNames.teamTeamIndex,
    //   onGenerateRoute: (settings) {
    //     switch (settings.name) {
    //       case RouteNames.teamTeamIndex:
    //         return GetPageRoute(
    //           settings: settings,
    //           customTransition: HalfSlideRightToLeftTransition(),
    //           page: () => const _TeamView(),
    //         );
    //       case RouteNames.teamBeautyPage:
    //         return GetPageRoute(
    //           opaque: false,
    //           settings: settings,
    //           customTransition: HalfSlideRightToLeftTransition(),
    //           page: () => const BeautyPage(),
    //         );
    //       case RouteNames.mineMineInfo:
    //         return GetPageRoute(
    //             opaque: false,
    //             settings: settings,
    //             customTransition: HalfSlideRightToLeftTransition(),
    //             page: () => const MineInfoPage(),
    //             binding: MineInfoBinding());
    //       case RouteNames.mineMineSetting:
    //         return GetPageRoute(
    //             opaque: false,
    //             settings: settings,
    //             page: () => const MineSettingPage(),
    //             binding: MineSettingBinding());
    //       case RouteNames.mineMineAccount:
    //         return GetPageRoute(
    //             opaque: false,
    //             settings: settings,
    //             customTransition: HalfSlideRightToLeftTransition(),
    //             page: () => const MineAccountPage(),
    //             binding: MineAccountBinding());
    //       // case RouteNames.teamMemberPage:
    //       //   return GetPageRoute(
    //       //     opaque: false,
    //       //     settings: settings,
    //       //     customTransition: HalfSlideRightToLeftTransition(),
    //       //     page: () => const TeamMenberView(),
    //       //   );
    //     }
    //     return null;
    //   },
    // );
  }
}

class _TeamView extends GetView<TeamIndexController> {
  const _TeamView();

  @override
  Widget build(BuildContext context) {
    Get.put(BeautyController());
    Get.put(TeamController());
    Get.put(TrainingController());
    return GetBuilder<TeamIndexController>(
      init: TeamIndexController(),
      id: "team_index",
      builder: (ctrl) {
        return SizedBox(
          // onRefresh: () => ctrl.onRefresh(),
          // controller: ctrl.refreshController,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: ctrl.scrollController,
            child: const Column(
              children: [
                BeautyAndBoxView(),
                MatchCard(),
                TrainingPage(),
                MyTeamWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
