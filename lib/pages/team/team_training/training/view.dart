/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-12-16 16:05:39
 */

import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_status.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_peparation.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/training_tactics.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (_) {
          return Stack(
            children: [
              Column(
                children: [
                  const TrainingPeparation(),
                  9.vGap,
                  // SizedBox(
                  //   width: 375.w,
                  //   height: 480.w,
                  //   child: Stack(
                  //     alignment: Alignment.center,
                  //     children: [
                  //       const Positioned(
                  //         top: 0,
                  //         left: 0,
                  //         right: 0,
                  //         child: TrainingTactics(),
                  //       ),
                  //       Positioned(
                  //           top: 124.w,
                  //           left: 0,
                  //           right: 0,
                  //           child: const TrainingWidget()),
                  //     ],
                  //   ),
                  // )
                  const TrainingTactics(),
                  9.vGap,
                  const PlayerStatus(),
                  9.vGap,
                  const TrainingWidget(),
                ],
              ),
              for (int index = 0;
                  index < controller.chooseTacticList.length;
                  index++)
                Obx(() {
                  var e = controller.chooseTacticList[index];
                  return Visibility(
                    visible:
                        controller.showBuff.value && !controller.isChange.value,
                    child: AnimatedPositioned(
                      left: e.offset.value.dx,
                      top: e.offset.value.dy,
                      // left: 153.w,

                      duration: 300.milliseconds,
                      child: AnimatedScale(
                        alignment: Alignment.topLeft,
                        duration: const Duration(milliseconds: 300),
                        scale: !controller.tacticFly.value ? 1 : 0.5,
                        // scale: controller.showBuff.value &&
                        //         !controller.isChange.value
                        //     ? 1
                        //     : 0.5,
                        child: FlipCard(
                          useSmallTacticCard: controller.tacticFly.value,
                          isFlipped: e.isOpen.value,
                          onFlip: () async {
                            //卡牌飞行动画
                            // controller.tacticFly.value = true;
                            e.isSelect.value = true;
                            controller.selectTacticId = e.id;
                            controller.changeTacticId = 0;
                            controller.chooseTactic(context);
                          },
                          buff: e,
                        ),
                      ),
                    ),
                  );
                })
            ],
          );
        });
  }
}
