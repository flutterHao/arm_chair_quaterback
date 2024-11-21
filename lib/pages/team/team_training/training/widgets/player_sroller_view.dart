/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-21 17:19:46
 */
import 'package:arm_chair_quaterback/common/utils/logger.dart';
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
    return GetBuilder<TrainingController>(
        id: "playerList",
        builder: (controller) {
          return InkWell(
            onTap: () {
              controller.startPlayerScroll(0);
            },
            child: SizedBox(
              width: 500.w,
              height: 80.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller.playerScollCtrl,
                itemExtent: 50.w,
                clipBehavior: Clip.none, // 防止子项超出父容器的边界
                physics: const NeverScrollableScrollPhysics(), // 禁止手动滚动
                itemCount: controller.playerList.length * 10,
                itemBuilder: (context, index) {
                  int current = index % controller.playerList.length;
                  var item = controller.playerList[current];
                  return Obx(() {
                    var select = controller.trainingInfo.selectPlayer
                        .contains(item.playerId);
                    return Align(
                      alignment: Alignment.center,
                      child: TrainingAvater(
                        player: item,
                        isCurrent: select,
                      ),
                    );
                  });
                },
              ),
            ),
          );
        });
  }
}
