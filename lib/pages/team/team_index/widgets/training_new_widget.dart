/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-11 16:05:49
 * @LastEditTime: 2025-02-15 16:15:37
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/free_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_widget.dart';

class TrainingNewWidget extends GetView<TrainingController> {
  const TrainingNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.showAward();
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (ctrl) {
          return SizedBox(
              width: double.infinity,
              height: 607.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ///背景文字
                  Positioned(
                    top: 0,
                    child: OutlinedText(
                      text: "cheerleaders".toUpperCase(),
                      strokeColor: AppColors.ccccccc,
                      strokeWidth: 1.w,
                      textStyle: TextStyle(
                          fontSize: 66.sp,
                          letterSpacing: 0,
                          // color: AppColors.c262626,
                          color: AppColors.cTransparent,
                          height: 0.95,
                          fontFamily: FontFamily.fOswaldBold),
                    ),
                  ),

                  ///背景图
                  Positioned(
                    top: 51.w,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      Assets.managerUiManagerBackground,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  ///美女图片
                  Positioned(
                    top: -15.w,
                    child: GetBuilder<BeautyController>(
                        // init: BeautyController(),
                        builder: (beautyCtrl) {
                      return InkWell(
                        onTap: () => Get.toNamed(RouteNames.teamBeautyPage),
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 130.w,
                          ),
                          height: 498.w,
                          child: Visibility(
                            visible: beautyCtrl.beautyIndex.value != 0,
                            child: Image.asset(
                              alignment: Alignment.topLeft,
                              beautyCtrl.girlList[beautyCtrl.beautyIndex.value]
                                  .girlImg,
                              height: 498.w,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),

                  ///美女动画
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GetBuilder<BeautyController>(
                        // init: BeautyController(),
                        builder: (beautyCtrl) {
                      return InkWell(
                        onTap: () => Get.toNamed(RouteNames.teamBeautyPage),
                        child: Container(
                            margin: EdgeInsets.only(left: 130.w, top: 20.w),
                            height: 468.5.w,
                            child: Opacity(
                              opacity:
                                  beautyCtrl.beautyIndex.value == 0 ? 1 : 0,
                              child: SpineWidget.fromAsset(
                                Assets.assetsSpineNv1,
                                "assets/spine/nv_1.json",
                                beautyCtrl.spineWidgetController,
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.topCenter,
                              ),
                            )),
                      );
                    }),
                  ),

                  Positioned(
                      top: 70.w,
                      right: -10.w,
                      child: Image.asset(
                        Assets.managerUiManagerIconBubble01,
                        height: 64.w,
                        fit: BoxFit.fitHeight,
                      )),
                  Positioned(
                    top: 72.w,
                    right: 5.w,
                    child: Image.asset(
                      Assets.managerUiManagerIcon001,
                      width: 41.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                      top: 105.w,
                      right: 5.w,
                      child: Text(
                        "02:30:30",
                        style: 10.w4(
                          fontFamily: FontFamily.fRobotoMedium,
                          height: 0.8,
                        ),
                      )),

                  ///战术牌
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ClipRect(
                      child: Container(
                        width: 140.w,
                        height: 157.w,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Positioned(
                                left: ctrl.offsets[i].dx,
                                top: ctrl.offsets[i].dy,
                                child: Transform.rotate(
                                  alignment: Alignment.center,
                                  angle: ctrl.angles[i] * pi / 180,
                                  child: i <= ctrl.trainingInfo.buff.length - 1
                                      ? SmallTacticCardNew(
                                          buff: ctrl.trainingInfo.buff[i],
                                          width: 35.w + i * 2.5.w,
                                        )
                                      : CardBackWidget(width: 35.w + i * 2.5.w),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      left: 139.5.w,
                      top: 142.5.w,
                      child: InkWell(
                        onTap: () {
                          ctrl.showRuleDilaog();
                        },
                        child: Container(
                          width: 13.w,
                          height: 13.w,
                          color: Colors.transparent,
                          alignment: Alignment.bottomRight,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconWidget(
                              iconWidth: 13.w,
                              icon: Assets.managerUiManagerIconDescribe,
                            ),
                          ),
                        ),
                      )),

                  ///准备程度进度条
                  Positioned(
                    top: 139.5.w,
                    left: 26.w,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Image.asset(
                          Assets.managerUiManagerIconPrepareprogressbar02,
                          width: 106.w,
                          fit: BoxFit.fitWidth,
                          color: AppColors.c4c4c4c,
                        ),
                        ClipRect(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            widthFactor: ctrl.trainingInfo.playerReadiness,
                            child: Image.asset(
                              Assets.managerUiManagerIconPrepareprogressbar03,
                              width: 103.w,
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                        ),
                        Image.asset(
                          Assets.managerUiManagerIconPrepareprogressbar04,
                          width: 106.w,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),

                  ///准备程度文字
                  Positioned(
                      top: 161.5.w,
                      left: 27.w,
                      child: Row(
                        children: [
                          //TODO
                          Text(
                            "Preparation",
                            style: 12.w4(
                                height: 1,
                                fontFamily: FontFamily.fOswaldRegular,
                                color: AppColors.cFFFFFF),
                          ),
                          31.hGap,
                          AnimatedNum(
                            number: (ctrl.trainingInfo.playerReadiness * 100)
                                .toInt(),
                            textStyle: 12.w4(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                          Text(
                            "%",
                            style: 12.w4(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ],
                      )),

                  // ///状态
                  Positioned(
                    top: 188.w,
                    left: 25.w,
                    child: SizedBox(
                      height: 60.w,
                      child: const PlayerStatusWidget(),
                    ),
                  ),

                  ///渐变背景
                  Positioned(
                      top: 268.w,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: 221.5.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.c000000.withOpacity(0.1),
                              offset: Offset(0, 20.w),
                              blurRadius: 35.w,
                            )
                          ],
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(9.w)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.cF2F2F2.withOpacity(0.0),
                              AppColors.cF2F2F2.withOpacity(0.95),
                              AppColors.cF2F2F2.withOpacity(1),
                            ],
                          ),
                        ),
                      )),

                  Positioned(
                    top: 473.w,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      height: 1.w,
                      color: AppColors.c666666.withOpacity(0.3),
                    ),
                  ),

                  ///训练slot
                  Positioned(
                    top: 327.w,
                    left: 0,
                    right: 0,
                    child: const TrainingSlotNew(),
                  ),

                  //开始按钮
                  Positioned(
                    top: 453.w,
                    child: const _SlotButton(),
                  ),

                  //免费宝箱
                  Positioned(
                    top: 515.w,
                    left: 22.5.w,
                    child: const FreeGiftBox(),
                  ),

                  //防御盾
                  Positioned(
                    top: 515.w,
                    right: 26.5.w,
                    child: Image.asset(
                      Assets.managerUiManagerIconDefenseshield,
                      width: 56.w,
                    ),
                  ),

                  ///恢复倒计时
                  if (ctrl.trainingInfo.prop.num < ctrl.trainDefine.ballMaxNum)
                    Positioned(
                      // bottom: 12.w,
                      top: 585.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${ctrl.trainDefine.ballRecoverNum} balls ready in ",
                            style: 12.w4(
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular,
                                color: AppColors.c000000),
                          ),
                          Obx(() {
                            return Text(
                              ctrl.recoverTimeStr.value,
                              style: 12.w4(
                                height: 1,
                                color: AppColors.c10A86A,
                                fontFamily: FontFamily.fRobotoRegular,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                  ///卡牌选择
                  for (int index = 0;
                      index < ctrl.tacticChooseList.length;
                      index++)
                    Obx(() {
                      var e = ctrl.tacticChooseList[index];
                      return AnimatedPositioned(
                        left: e.offset.value.dx,
                        top: e.offset.value.dy,
                        duration: 300.milliseconds,
                        child: AnimatedRotation(
                          duration: 300.milliseconds,
                          turns: e.rotate.value,
                          child: AnimatedScale(
                            alignment: e.offset.value.dy == (250.w)
                                ? Alignment.center
                                : Alignment.topLeft,
                            duration: Duration(
                                milliseconds: !ctrl.showBuff.value ? 0 : 300),
                            // scale: !controller.tacticFly.value ? 1 : 0.5,
                            scale: ctrl.showBuff.value
                                ? (!ctrl.tacticFly.value
                                    ? 1
                                    : (e.offset.value.dy == (250.w) ? 0 : 1))
                                : 0,
                            child: Opacity(
                              opacity: ctrl.tacticFly.value ? 1 : 0,
                              child: SmallTacticCardNew(
                                  width: 74.w * e.scale, buff: e),
                            ),
                          ),
                        ),
                      );
                    }),
                ],
              ));
        });
  }
}

///球员状态
class PlayerStatusWidget extends StatelessWidget {
  const PlayerStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> statusList = [105, 104, 103, 102, 101];
    return GetBuilder<TeamController>(
        // init: TeamController(),
        builder: (teamCtrl) {
      return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            int count = teamCtrl.myTeamEntity.teamPlayers
                .where((e) => e.playerStatus == statusList[index])
                .length;
            return Column(
              children: [
                IconWidget(
                    iconWidth: 19.5.w,
                    icon: Utils.getStatusUrl(statusList[index])),
                2.vGap,
                Text(
                  "$count",
                  style: 12.w4(
                      height: 1,
                      fontFamily: FontFamily.fRobotoMedium,
                      color: AppColors.cFFFFFF),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => 2.hGap,
          itemCount: statusList.length);
    });
  }
}

class _SlotButton extends StatelessWidget {
  const _SlotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
          return Obx(() {
            return MtInkWell(
              onTap: controller.isPlaying.value
                  ? null
                  : () async {
                      if (controller.ballNum.value <= 0 &&
                          !Utils.getNoTip("ball")) {
                        BottomTipDialog.show(
                            context: Get.context!,
                            desc:
                                "Automatically use Coins for training when there's a shortage of balls ",
                            centerWidget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "COST:",
                                  style:
                                      16.w4(fontFamily: FontFamily.fOswaldBold),
                                ),
                                10.hGap,
                                Image.asset(
                                  Assets.commonUiCommonIconCurrency02,
                                  width: 20.w,
                                ),
                                5.hGap,
                                Text(
                                  "${controller.getBallCost()}",
                                  style:
                                      16.w4(fontFamily: FontFamily.fOswaldBold),
                                ),
                              ],
                            ),
                            onTap: () {
                              Get.back();
                              controller.startSlot();
                              Utils.saveNotTip("ball");
                            });
                      } else {
                        controller.startSlot();
                      }
                    },
              child: Container(
                width: 129.w,
                height: 129.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.c000000.withOpacity(0.1),
                        offset: Offset(0, 2.w),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(66.w),
                    border:
                        Border.all(width: 12.5.w, color: AppColors.cF2F2F2)),
                child: Opacity(
                  opacity: controller.isPlaying.value ? 0.5 : 1,
                  child: SizedBox(
                    width: 104.5.w,
                    height: 104.5.w,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          Assets.managerUiManagerIconButton,
                          width: 104.5.w,
                          height: 104.5.w,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 12.5.w,
                          child: AnimationArcWidget(
                            43.w,
                            progressWidth: 5.w,
                            progressColor: AppColors.cFFFFFF,
                            borderColor: Colors.black.withOpacity(0.3),
                            progressSweepAngle: 180 *
                                (controller.ballNum.value /
                                    controller.trainDefine.ballMaxNum),
                            borderWidth: 5.w,
                          ),
                        ),
                        Positioned(
                          // bottom: 16.w,
                          top: 74.w,
                          child: Container(
                            // height: 72.5.w,
                            width: 75.w,
                            alignment: Alignment.bottomCenter,
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedScale(
                                    duration: 150.milliseconds,
                                    scale: controller.showBall.value ? 1.5 : 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(() {
                                          int v = controller.ballNum.value;
                                          return AnimatedNum(
                                            milliseconds: 100,
                                            number: v,
                                            textStyle: 14.w4(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                    FontFamily.fOswaldRegular,
                                                height: 0.8),
                                          );
                                        }),
                                        if (controller.showBall.value)
                                          Text(
                                            "+${controller.trainingInfo.prop.num - controller.ballNum.value}",
                                            style: 14.w4(
                                                color: AppColors.c31E99E,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                                height: 0.8),
                                          )
                                      ],
                                    ),
                                  ),
                                  AnimatedScale(
                                    duration: 150.milliseconds,
                                    scale: controller.showBall.value ? 0 : 1,
                                    child: Text(
                                      "/${controller.trainDefine.ballMaxNum}",
                                      style: 14.w4(
                                          color: AppColors.cFFFFFF,
                                          fontFamily: FontFamily.fOswaldRegular,
                                          height: 0.8),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
