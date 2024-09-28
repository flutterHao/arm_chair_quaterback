import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/data_battle_before_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/match_success.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/matching.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamBattlePage extends GetView<TeamBattleController> {
  const TeamBattlePage({super.key});

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("TeamBattlePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleController>(
      id: "team_battle",
      builder: (_) {
        return Container(
          color: AppColors.c000000.withOpacity(.8),
          child: Obx(() {
            return Stack(
              alignment: Alignment.center,
              children: [
                if (controller.step.value == 1)
                  const Matching()
                else if (controller.step.value == 2)
                  MatchSuccess(onCompleted: (){
                    Future.delayed(const Duration(seconds: 1),(){
                      controller.nextStep();
                    });
                  })
                else if (controller.step.value == 3)
                    const DataBattleBeforeGame()
                else
                  const SizedBox.shrink()
              ],
            );
          }),
        );
      },
    );
  }
}
