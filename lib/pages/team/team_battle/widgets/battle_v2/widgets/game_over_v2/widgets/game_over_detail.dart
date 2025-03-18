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
    return Container(
      height: 700.h,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          DialogTopBtn(),
          9.vGap,
          Expanded(
            child: Container(
              color: AppColors.cF2F2F2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: AppColors.cFFFFFF,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        children: [
                          24.vGap,
                          Text(
                            "${teamBattleV2Controller.pkResultUpdatedEntity?.newsTitle}",
                            style: 21.w5(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                          ),
                          15.vGap,
                          Text(
                            "${teamBattleV2Controller.pkResultUpdatedEntity?.newsContent}",
                            style: 14.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular,
                            ),
                          ),
                          15.vGap,
                        ],
                      ),
                    ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
