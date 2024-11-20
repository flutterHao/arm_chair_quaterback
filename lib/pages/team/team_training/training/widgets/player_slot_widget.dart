/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-20 17:17:10
 */
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerSrollerView extends StatefulWidget {
  const PlayerSrollerView({super.key});

  @override
  State<PlayerSrollerView> createState() => _PlayerSrollerViewState();
}

class _PlayerSrollerViewState extends State<PlayerSrollerView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.startAutoScroll(0);
        },
        child: SizedBox(
          width: 500.w,
          height: 61.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller.playerScollCtrl,
            itemExtent: 50.w,
            physics: const NeverScrollableScrollPhysics(), // 禁止手动滚动
            itemCount: controller.playerList.length * 2000,
            itemBuilder: (context, index) {
              int current = index % controller.playerList.length;
              var item = controller.playerList[current];
              var select = controller.trainingInfo.statusReplyPlayers
                  .contains(item.playerId);
              return TrainingAvater(
                player: item,
                isCurrent: false,
              );
            },
          ),
        ),
      );
    });
  }
}
