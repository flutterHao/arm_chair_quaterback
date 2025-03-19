import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/team_stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/3/18/16:54

class GameOverDetail extends StatelessWidget {
  GameOverDetail({super.key});

  late TeamBattleController teamBattleController;

  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    teamBattleController = Get.find();
    return Column(
      children: [
        GameLeaderWidget(
          controller: teamBattleV2Controller.gameLeaderController,
          title: LangKey.gameTabGameLeader.tr,
        ),
        TeamStatsWidget(
          controller: teamBattleV2Controller.teamStatsController,
        ),
        9.vGap,
        Container(
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(9.w)),
          child: Column(
            children: [
              25.vGap,
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PLAY BY PLAY",
                      style: 30.w7(
                          color: AppColors.c000000,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                  ],
                ),
              ),
              const LiveTextWidget(
                isGameOverStatus: true,
              ),
            ],
          ),
        ),
        9.vGap,
      ],
    );
  }
}
