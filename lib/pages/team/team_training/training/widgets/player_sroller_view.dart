/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-11-06 11:51:15
 * @LastEditTime: 2024-11-30 19:25:29
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
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
    Duration duration = 50.milliseconds * 2;
    return GetBuilder<TrainingController>(
        id: "playerList",
        builder: (controller) {
          var selectPlayers = controller.trainingInfo.selectPlayer;
          int count = selectPlayers.length ~/ 2;
          return InkWell(
            onTap: () {
              // controller.startPlayerScroll(0);
            },
            child: Container(
              width: 500.w,
              height: 115.w,
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
                    // var select = controller.trainingInfo.selectPlayer
                    //     .contains(item.playerId);
                    int scrollerIdx = selectPlayers.indexOf(item.playerId);
                    bool isSelect = controller.currentPlayerIndex.value <=
                            (index + count) &&
                        controller.currentPlayerIndex.value >= (index - count);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        scrollerIdx != -1
                            ? Opacity(
                                opacity: controller.showStatus.value ? 1 : 1,
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
                                        int current = index %
                                            controller.statusList.length;
                                        return Center(
                                          child: IconWidget(
                                            iconWidth: 27.w,
                                            iconHeight: 27.w,
                                            fit: BoxFit.fill,
                                            icon: Utils.getStatusUrl(
                                                controller.statusList[current]),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            : SizedBox(
                                width: 55.w,
                                height: 30.w,
                              ),
                        11.vGap,

                        ///头像
                        AnimatedOpacity(
                          opacity:
                              !isSelect && controller.playerScrollerEnd ? 0 : 1,
                          duration: 300.milliseconds,
                          child: AnimatedScale(
                              scale: isSelect ? 1.05 : 1,
                              duration: duration,
                              child: Container(
                                width: 55.w,
                                height: 74.w,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                alignment: Alignment.center,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      width: 55.w,
                                      height: 74.w,
                                      // width: isCurrent ? 46.w * scale : 46.w,
                                      // height: isCurrent ? 61.w * scale : 61.w,
                                      alignment: Alignment.center,
                                      // color: Colors.red,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: AppColors.cF2F2F2,
                                        borderRadius: BorderRadius.circular(
                                            isSelect ? 6.w : 6.w),
                                      ),
                                      child: ImageWidget(
                                        url: Utils.getPlayUrl(item.playerId),
                                        imageFailedPath: Assets.iconUiDefault04,
                                        borderRadius:
                                            BorderRadius.circular(7.w),
                                        width: 55.w,
                                        height: 74.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    // if (!isSelect &&
                                    //     controller.playerScrollerEnd)
                                    AnimatedOpacity(
                                      opacity: (!isSelect) ? 1 : 0,
                                      duration: duration,
                                      child: Container(
                                        width: 55.w,
                                        height: 74.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(6.w),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    );
                  });
                },
              ),
            ),
          );
        });
  }
}

class PlayerSelectBox extends StatelessWidget {
  const PlayerSelectBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "playerList",
        builder: (controller) {
          return Obx(() {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: controller.showPlayerBox.value ? 1 : 0,
              child: Container(
                height: 106.w,
                alignment: Alignment.center,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:
                        controller.trainingInfo.statusReplyPlayers.length,
                    separatorBuilder: (context, index) => 6.hGap,
                    itemBuilder: (context, index) {
                      return Center(
                        child: AnimatedContainer(
                          duration: 200.milliseconds,
                          width: 59.w,
                          height: controller.playerScrollerEnd ? 86.w : 106.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.w),
                              border: Border.symmetric(
                                  vertical: BorderSide(
                                      width: 2.w, color: AppColors.cFF7954),
                                  horizontal: BorderSide(
                                      width: 6.w, color: AppColors.cFF7954))),
                        ),
                      );
                    }),
              ),
            );
          });
        });
  }
}

class PlayerArrow extends StatelessWidget {
  const PlayerArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "playerList",
        builder: (controller) {
          if (controller.playerScrollerEnd) return Container();
          return Obx(() {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: controller.showPlayerBox.value ? 1 : 0,
              child: Container(
                height: 30.w,
                alignment: Alignment.center,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => 6.hGap,
                    itemCount:
                        controller.trainingInfo.statusReplyPlayers.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 59.w,
                        child: Center(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              AnimatedBuilder(
                                animation: controller.arrowAnimated,
                                builder: (context, child) {
                                  return Positioned(
                                    top: controller.arrowAnimated.value,
                                    child: Image.asset(
                                      Assets.commonUiCommonArrow,
                                      width: 14.w,
                                      height: 12.w,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            );
          });
        });
  }
}
