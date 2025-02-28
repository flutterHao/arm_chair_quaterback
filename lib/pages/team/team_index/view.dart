/*
 * @Description: TrainingNewWidget
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2025-02-28 11:06:40
 */

import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/nba_player/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/match_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
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
  }
}

class _TeamView extends GetView<TeamIndexController> {
  const _TeamView();

  @override
  Widget build(BuildContext context) {
    // 确保控制器只初始化一次，并且设置 permanent: true
    // if (!Get.isRegistered<TeamController>()) {
    //   Get.put(TeamController(), permanent: true);
    // }
    // if (!Get.isRegistered<BeautyController>()) {
    //   Get.put(BeautyController(), permanent: true);
    // }
    // if (!Get.isRegistered<TrainingController>()) {
    //   Get.put(TrainingController(), permanent: true);
    // }
    // Get.lazyPut(() => BeautyController());
    // Get.lazyPut(() => TeamController());
    // Get.lazyPut(() => TrainingController());
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
            child: Column(
              children: [
                TrainingNewWidget(),
                BattleBoxWidget(),
                MatchCard(),
                // TrainingPage(),
                NbaPlayerPage(),
                MyTeamWidget(),
                80.vGap,
              ],
            ),
          ),
        );
      },
    );
  }
}
