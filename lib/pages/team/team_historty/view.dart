import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_court.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/game_over_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/player_status_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_quarter.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/widgets/history_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamHistortyPage extends GetView<TeamHistortyController> {
  const TeamHistortyPage({super.key});

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // const GameCourtWidget(),
          //底部
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
            child: Column(
              children: [
                // const HistoryQuarterWidget(),
                const HistoryStatusWidget()

                // GetBuilder<TeamBattleV2Controller>(
                //     id: TeamBattleV2Controller.idQuarterScore,
                //     builder: (_) {
                //       return QuarterScoreWidget(
                //         hasTopMargin: false,
                //       );
                //     }),
                // PlayerStatusWidget(teamBattleV2Controller),
                // GameLeaderWidget(
                //   controller: teamBattleV2Controller.gameLeaderController,
                //   title: "KEY PLAYERS",
                // ),
                // WinRateWidget(teamBattleV2Controller.winRateController),
                // TeamStatsWidget(
                //   controller: teamBattleV2Controller.teamStatsController,
                // ),
                // 9.vGap,
                // const LiveTextWidget(
                //   isGameOverStatus: true,
                // ),
                ,
                9.vGap,
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(const TeamHistortyPage());
    return GetBuilder<TeamHistortyController>(
      init: TeamHistortyController(),
      id: "team_historty",
      builder: (_) {
        return BlackAppWidget(
          // backgroundColor: AppColors.c002B5C,
          backgroundColor: AppColors.cF2F2F2,
          const UserInfoBar(showPop: true),
          bodyWidget: Expanded(child: Obx(
            () {
              if (controller.loadingStatus.value != LoadDataStatus.success) {
                return Center(
                    child: LoadStatusWidget(
                        loadDataStatus: controller.loadingStatus.value));
              }
              return _buildView();
            },
          )),
        );
      },
    );
  }
}
