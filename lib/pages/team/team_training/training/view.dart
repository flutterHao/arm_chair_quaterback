/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-11-25 16:09:26
 */

import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_peparation.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_tactics.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        init: TrainingController(),
        builder: (_) {
          return Column(
            children: [
              const TrainingPeparation(),
              const TrainingTactics(),
              9.vGap,
              const TrainingWidget(),
            ],
          );
        });
  }
}
