/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-19 22:04:25
 * @LastEditTime: 2025-02-07 18:34:19
 */
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/match_success.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/matching.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamBattlePage extends GetView<TeamBattleController> {
  const TeamBattlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamBattleController>(
      init: TeamBattleController(context),
      id: "team_battle",
      builder: (_) {
        return Obx(() {
          return Stack(
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
          );
        });
      },
    );
  }
}
