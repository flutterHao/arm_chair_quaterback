/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-12-04 14:54:47
 */

import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
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
        init: TrainingController(),
        builder: (_) {
          return Column(
            children: [
              const TrainingPeparation(),
              9.vGap,
              SizedBox(
                width: 375.w,
                height: 480.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: TrainingTactics(),
                    ),

                    Positioned(
                        top: 124.w,
                        left: 0,
                        right: 0,
                        child: const TrainingWidget()),
                    // if (controller.showBuff.value)
                    // Positioned(
                    //   top: 170.w,
                    //   left: 27.w,
                    //   right: 27.w,
                    //   child: Obx(() {
                    //     return AnimatedOpacity(
                    //       duration: const Duration(milliseconds: 300),
                    //       opacity: controller.showBuff.value ? 1 : 1,
                    //       child: Wrap(
                    //         spacing: 6.w,
                    //         runSpacing: 6.w,
                    //         alignment: WrapAlignment.center,
                    //         children: controller.chooseTacticList.map((e) {
                    //           return AnimatedScale(
                    //             duration: const Duration(milliseconds: 300),
                    //             scale: controller.showBuff.value ? 1 : 0,
                    //             child: FlipCard(
                    //               isFlipped: e.isOpen.value,
                    //               onFlip: () {
                    //                 e.isSelect.value = true;
                    //                 controller.tacticId = e.id;
                    //                 controller.changeTacticId = 0;
                    //                 controller.chooseTactic();
                    //               },
                    //               buff: e,
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
