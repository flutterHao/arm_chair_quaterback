/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-02 10:15:35
 * @LastEditTime: 2025-02-14 16:50:53
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/animated_arrow.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingAwardDialog extends GetView<TrainingController> {
  const TrainingAwardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double top = 47.w;
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (ctrl) {
          return Align(
            child: Container(
              // color: Colors.white,
              width: 375.w,
              height: 812.h,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 80.w + 100.w + top,
                    left: 0,
                    right: 0,
                    child: Obx(() {
                      return Visibility(
                        visible: ctrl.showPlayer.value,
                        child: Container(
                          width: double.infinity,
                          height: 94.w,
                          color: AppColors.c000000,
                        ),
                      );
                    }),
                  ),

                  ///球员列表
                  // if (controller.showPlayer.value)
                  Positioned(
                    top: 49.w + 100.w + top,
                    left: -40.w,
                    right: -40.w,
                    child: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          ctrl.colosePlayerAwards();
                        },
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: ctrl.showPlayer.value ? 1 : 0,
                          child: const PlayerSrollerView(),
                        ),
                      );
                    }),
                    // child: PlayerSrollerView(),
                  ),

                  Positioned(
                      top: 74.w + 100.w + top,
                      left: -40.w,
                      right: -40.w,
                      child: const PlayerSelectBox()),

                  Positioned(
                    top: 60.w + 100.w + top,
                    child: const PlayerArrow(),
                  ),

                  ///金钱奖励
                  Positioned(
                    top: 66.w + 150.w + top,
                    child: Obx(() {
                      return AnimatedOpacity(
                        opacity: ctrl.showCash.value ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: 126.w,
                          height: 51.w,
                          decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(9.w),
                            border: Border.all(
                              width: 2.w,
                              color: AppColors.cFF7954,
                            ),
                          ),
                          child: AnimatedScale(
                            scale: ctrl.caShScale.value ? 1.3 : 1,
                            duration: const Duration(milliseconds: 300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 32.w,
                                  icon: Assets.teamUiMoney02,
                                ),
                                4.hGap,
                                Text(
                                  "+",
                                  style: 16.w4(
                                      color: AppColors.cFFFFFF,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                Obx(() {
                                  return AnimatedNum(
                                    fromZero: true,
                                    number: ctrl.cash.value,
                                    milliseconds: 800,
                                    isMoney: true,
                                    textStyle: 16.w4(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fOswaldMedium),
                                  );
                                  // return Text(
                                  //   Utils.formatMoney(controller.cash.value),
                                  //   style: 16.w4(color: AppColors.cFFFFFF),
                                  // );
                                })
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  if (ctrl.showBuff.value)
                    Positioned(
                      top: 230.w,
                      child: Text(
                        "Choose a Tactic".toUpperCase(),
                        style: 18.w4(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),

                  if (ctrl.showBuff.value)
                    for (int index = 0;
                        index < ctrl.tacticChooseList.length;
                        index++)
                      Obx(() {
                        var e = ctrl.tacticChooseList[index];
                        return Positioned(
                            left: e.offset.value.dx,
                            top: e.offset.value.dy + 30.w,
                            child: Container(
                              width: 74.w,
                              alignment: Alignment.center,
                              child: AnimatedArrow(
                                end: -5,
                                child: Image.asset(
                                  Assets.commonUiCommonArrow,
                                  width: 10.w,
                                  // height: 12.w,
                                ),
                              ),
                            ));
                      }),

                  ///卡牌选择
                  if (ctrl.showBuff.value)
                    for (int index = 0;
                        index < ctrl.tacticChooseList.length;
                        index++)
                      Obx(() {
                        var e = ctrl.tacticChooseList[index];
                        return AnimatedPositioned(
                          left: e.offset.value.dx,
                          top: e.offset.value.dy + 47.w,
                          duration: 300.milliseconds,
                          child: FlipCard(
                            useSmallTacticCard: true,
                            isFlipped: e.isOpen.value,
                            onFlip: () async {
                              if (!ctrl.canChoose) return;
                              ctrl.chooseTactic(context, e);
                            },
                            buff: e,
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }
}

class BezierCurve extends Curve {
  final double cx1;
  final double cy1;
  final double cx2;
  final double cy2;

  const BezierCurve(this.cx1, this.cy1, this.cx2, this.cy2);

  @override
  double transform(double t) {
    return _bezier(t, 0, cx1, cx2, 1);
  }

  double _bezier(double t, double start, double c1, double c2, double end) {
    return ((1 - t) * (1 - t) * (1 - t) * start +
        3 * (1 - t) * (1 - t) * t * c1 +
        3 * (1 - t) * t * t * c2 +
        t * t * t * end);
  }
}
