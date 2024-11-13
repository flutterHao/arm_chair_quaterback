/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-11-12 20:10:11
 */
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/beauty_and_box.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_box_widget.dart';
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

    return Navigator(
      key: GlobalNestedKey.TeamTabGlobalKey,
      initialRoute: RouteNames.teamTeamIndex,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouteNames.teamTeamIndex:
            return GetPageRoute(
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const _TeamView(),
            );
          case RouteNames.teamTrainingPage:
            return GetPageRoute(
              opaque: false,
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const TrainingPage(),
              // binding: NewDetailBinding(), /*  */
            );
          case RouteNames.teamBeautyPage:
            return GetPageRoute(
              opaque: false,
              settings: settings,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const BeautyPage(),
            );
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: settings,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
        }
        return null;
      },
    );
  }
}

class _TeamView extends GetView<TeamIndexController> {
  const _TeamView();

  @override
  Widget build(BuildContext context) {
    Get.put(BeautyController());
    return GetBuilder<TeamIndexController>(
      init: TeamIndexController(),
      id: "team_index",
      builder: (ctrl) {
        return const BlackAppWidget(
          UserInfoBar(
            title: "TEAM",
            routeId: GlobalNestedKey.TEAM,
          ),
          bodyWidget: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BeautyAndBoxView(),
                  TrainingPage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
