/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-25 10:55:41
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
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
              height: 91.w,
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
                    int statusIdx = controller.trainingInfo.selectPlayer
                        .indexOf(item.playerId);
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (statusIdx != -1)
                            SizedBox(
                              width: 55.w,
                              height: 30.w,
                              child: ListView.separated(
                                  controller:
                                      controller.statusScollerList[statusIdx],
                                  padding: EdgeInsets.zero,
                                  itemCount: controller.statusList.length * 10,
                                  separatorBuilder: (context, index) => 3.vGap,
                                  itemBuilder: (context, index) {
                                    int current =
                                        index % controller.statusList.length;
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.statusScroll(statusIdx),
                                      child: Center(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 27.w,
                                              height: 27.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.w),
                                                  color: AppColors.c262626,
                                                  border: Border.all(
                                                      width: 1.5.w,
                                                      color:
                                                          AppColors.cFFFFFF)),
                                            ),
                                            IconWidget(
                                              iconWidth: 25.w,
                                              iconHeight: 25.w,
                                              fit: BoxFit.fill,
                                              icon: Utils.getStatusUrl(
                                                  controller
                                                      .statusList[current]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          TrainingAvater(
                            player: item,
                            isCurrent: select,
                          ),
                        ],
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
