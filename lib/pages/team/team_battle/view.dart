import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_main.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/match_success.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/matching.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamBattlePage extends GetView<TeamBattleController> {
  const TeamBattlePage({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleController>(
      init: TeamBattleController(context),
      id: "team_battle",
      builder: (_) {
        return HorizontalDragBackWidget(
          // canPop: TeamBattleController.canPop,
          child: Obx(() {
            return AnimatedContainer(
              color: AppColors.c000000
                  .withOpacity(controller.step.value >= 3 ? 1 : .6),
              duration: const Duration(milliseconds: 1000),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (controller.step.value == 1)
                    const Matching()
                  else if (controller.step.value == 2)
                    MatchSuccess(onCompleted: () {
                      controller.nextStep();
                    })
                  else
                    // const BattleMain()
                    TeamBattleV2Page()

                ],
              ),
            );
          }),
        );
      },
    );
  }
}
