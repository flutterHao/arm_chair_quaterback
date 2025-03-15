/*
 * @Description: TrainingNewWidget
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2025-03-15 17:49:03
 */

import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/battle_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/player_chest.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
        return SmartRefresher(
          onRefresh: () => ctrl.initData(),
          controller: ctrl.refreshController,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: ctrl.scrollController,
            child: Column(
              children: [
                // TrainingNewWidget(),
                // BattleBoxWidget(),
                // // MatchCard(),
                // Container(
                //   margin: EdgeInsets.only(top: 9.w),
                //   padding: EdgeInsets.symmetric(vertical: 26.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(9.w),
                //     color: AppColors.cFFFFFF,
                //   ),
                //   child: SeasonPassWidget(),
                // ),
                // TrainingPage(),
                MyTeamWidget(),
                PlayerChestWidget(),
                // NbaPlayerPage(),
                80.vGap,
              ],
            ),
          ),
        );
      },
    );
  }
}
