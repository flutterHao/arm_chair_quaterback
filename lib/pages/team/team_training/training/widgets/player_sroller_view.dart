/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-28 11:03:48
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
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
              // controller.startPlayerScroll(0);
            },
            child: Container(
              width: 500.w,
              height: 110.w,
              alignment: Alignment.topCenter,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                controller: controller.playerScollCtrl,
                itemExtent: 65.w,
                clipBehavior: Clip.none, // 防止子项超出父容器的边界
                physics: const NeverScrollableScrollPhysics(), // 禁止手动滚动
                itemCount: controller.playerList.length * 10,
                itemBuilder: (context, index) {
                  int current = index % controller.playerList.length;
                  var item = controller.playerList[current];
                  return Obx(() {
                    //是否选中
                    var select = controller.trainingInfo.selectPlayer
                        .contains(item.playerId);
                    int scrollerIdx = controller.trainingInfo.selectPlayer
                        .indexOf(item.playerId);

                    return Container(
                      // color: Colors.red,
                      // width: 55.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (scrollerIdx != -1)
                            Opacity(
                              opacity: controller.showStatus.value ? 1 : 0,
                              child: SizedBox(
                                width: 55.w,
                                height: 30.w,
                                child: ListView.separated(
                                    controller: controller
                                        .statusScollerList[scrollerIdx],
                                    padding: EdgeInsets.zero,
                                    itemCount:
                                        controller.statusList.length * 10,
                                    separatorBuilder: (context, index) =>
                                        3.vGap,
                                    itemBuilder: (context, index) {
                                      int current =
                                          index % controller.statusList.length;
                                      return Center(
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
                                      );
                                    }),
                              ),
                            ),
                          3.vGap,
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
