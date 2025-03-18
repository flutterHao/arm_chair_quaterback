/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-02 10:15:35
 * @LastEditTime: 2025-03-18 10:32:38
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/animated_arrow.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
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
              // color: Colors.black.withOpacity(0.6),
              width: 375.w,
              height: double.infinity,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  if (ctrl.showShield.value)
                    ShowAwardAnimation(
                      initialPosition: Offset(155.w, 250.w), // 初始位置
                      targetPosition: Offset(290.w, 514.w + 47.w), // 目标位置
                      initialScale: 1.0, // 初始缩放
                      targetScale: 1.5, // 目标缩放
                      imageAsset: Assets.managerUiManagerShield, // 图片资源
                      imageWidth: 56.w, // 图片宽度
                      scaleDuration:
                          const Duration(milliseconds: 200), // 缩放动画时长
                      moveDuration: const Duration(milliseconds: 300),
                    ),
                  if (ctrl.showCard.value || ctrl.showTactics.value)
                    Positioned(
                      top: top,
                      left: 0,
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

                  ///准备程度进度条
                  if (ctrl.showCard.value || ctrl.showTactics.value)
                    Positioned(
                      top: 139.5.w + top,
                      left: 26.w,
                      child: Column(
                        children: [
                          // PreparationWidget(
                          //   playerReadiness: ctrl.trainingInfo.playerReadiness,
                          // ),
                          3.vGap,
                          SizedBox(
                            width: 106.w,
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
                                  number:
                                      (ctrl.trainingInfo.playerReadiness * 100)
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
                            ),
                          )
                        ],
                      ),
                    ),

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
                        opacity: ctrl.showCash.value > 0 ? 1 : 0,
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
                                  icon: ctrl.showCash.value == 1
                                      ? Assets.teamUiMoney02
                                      : Assets.commonUiCommonIconCurrency02,
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
                                    milliseconds:
                                        ctrl.showCash.value == 1 ? 800 : 300,
                                    isMoney: ctrl.showCash.value == 1,
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

                  ///卡牌选择
                  if (ctrl.showCard.value)
                    Positioned(
                      top: 300.w,
                      child: Container(
                        width: 356.w,
                        height: 237.w,
                        padding: EdgeInsets.only(top: 7.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: AppColors.c000000,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 342.w,
                              height: 139.w,
                              alignment: Alignment.topCenter,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.w),
                                color: AppColors.cF2F2F2,
                              ),
                              child: Image.asset(
                                height: 139.w,
                                "",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            16.vGap,
                            Container(
                              width: 342.w,
                              height: 68.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.w),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 0.15, 0.5, 0.85, 1.0],
                                    colors: [
                                      AppColors.cBFBFBF,
                                      AppColors.cD9D9D9,
                                      AppColors.cFFFFFF,
                                      AppColors.cD9D9D9,
                                      AppColors.cBFBFBF,
                                    ],
                                  )),
                              child: Text(
                                "Choose a Tactic".toUpperCase(),
                                style: 32.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fOswaldRegular),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ///卡牌选择
                  if (ctrl.showCard.value)
                    for (int index = 0;
                        index < ctrl.tacticChooseList.length;
                        index++)
                      Obx(() {
                        var e = ctrl.tacticChooseList[index];
                        return AnimatedPositioned(
                          left: e.offset.value.dx - 2,
                          top: e.offset.value.dy,
                          duration: 200.milliseconds,
                          child: AnimatedRotation(
                            duration: 300.milliseconds,
                            turns: e.rotate.value / 360,
                            curve: Curves.decelerate,
                            child: AnimatedScale(
                              alignment: Alignment.topLeft,
                              duration: Duration(
                                  milliseconds: !ctrl.showCard.value ? 0 : 300),
                              scale: e.scale,
                              child: MtInkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  if (!ctrl.canChoose) return;
                                  ctrl.chooseTactic(e);
                                },
                                child: SmallTacticCardNew(
                                  buff: e,
                                  width: 50.w,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),

                  if (ctrl.showTactics.value)
                    for (var e in ctrl.newCardList)
                      Obx(() {
                        return AnimatedPositioned(
                          left: e.offset.value.dx,
                          top: e.offset.value.dy,
                          duration: 200.milliseconds,
                          child: AnimatedRotation(
                            duration: 300.milliseconds,
                            turns: e.rotate.value / 360,
                            curve: Curves.decelerate,
                            child: AnimatedScale(
                              alignment: Alignment.topCenter,
                              duration: Duration(
                                  milliseconds: !ctrl.showCard.value ? 0 : 300),
                              scale: e.scale,
                              child: SmallTacticCardNew(
                                buff: e,
                                width: 50.w,
                              ),
                            ),
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

class ShowAwardAnimation extends StatefulWidget {
  final Offset initialPosition; // 初始位置
  final Offset targetPosition; // 目标位置
  final Offset? controlPoint; // 贝塞尔曲线控制点（可选）
  final double initialScale; // 初始缩放
  final double targetScale; // 目标缩放
  final String imageAsset; // 图片资源
  final double imageWidth; // 图片宽度
  final Duration scaleDuration; // 缩放动画时长
  final Duration moveDuration; // 移动动画时长

  const ShowAwardAnimation({
    super.key,
    required this.initialPosition,
    required this.targetPosition,
    this.controlPoint,
    this.initialScale = 1.0,
    this.targetScale = 2,
    required this.imageAsset,
    required this.imageWidth,
    this.scaleDuration = const Duration(milliseconds: 300),
    this.moveDuration = const Duration(milliseconds: 300),
  });

  @override
  State<ShowAwardAnimation> createState() => _ShowAwardAnimationState();
}

class _ShowAwardAnimationState extends State<ShowAwardAnimation>
    with SingleTickerProviderStateMixin {
  var showShield = false.obs;
  var shieldScale = 1.0.obs;
  var shieldPosition = Offset.zero.obs;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.moveDuration,
      vsync: this,
    );

    // 使用 Curves.easeIn 实现先慢后快
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn, // 先慢后快
    );

    startAnimation();
  }

  // 自动计算默认控制点：取两点的中点，并向上偏移 50 像素
  Offset get _defaultControlPoint {
    // final midX = (widget.initialPosition.dx + widget.targetPosition.dx) / 2;
    return Offset(widget.initialPosition.dx + 10.w,
        widget.initialPosition.dy - 20.w); // 向上偏移形成弧线
  }

  void startAnimation() async {
    showShield.value = true;
    shieldPosition.value = widget.initialPosition;
    shieldScale.value = widget.initialScale;
    await Future.delayed(300.milliseconds);
    // 放大动画
    shieldScale.value = widget.targetScale;
    await Future.delayed(widget.scaleDuration);

    // 复原动画
    shieldScale.value = widget.initialScale;
    await Future.delayed(widget.scaleDuration);
    await Future.delayed(100.milliseconds);
    // 启动贝塞尔曲线动画
    _controller.forward();

    // 监听动画值变化，更新位置和缩放
    _controller.addListener(() {
      final path = Path()
        ..moveTo(widget.initialPosition.dx, widget.initialPosition.dy)
        ..quadraticBezierTo(
          widget.controlPoint?.dx ?? _defaultControlPoint.dx, // 使用默认控制点
          widget.controlPoint?.dy ?? _defaultControlPoint.dy,
          widget.targetPosition.dx,
          widget.targetPosition.dy,
        );

      final metric = path.computeMetrics().first;
      final offset = metric
          .getTangentForOffset(
              metric.length * _animation.value) // 使用 _animation.value
          ?.position;
      if (offset != null) {
        shieldPosition.value = offset;
      }

      // 移动过程中逐渐缩小
      shieldScale.value = 1.0 - 0.5 * _animation.value;
    });

    // 动画结束后隐藏护盾
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showShield.value = false;
        Get.back();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (showShield.value) {
        return Positioned(
          top: shieldPosition.value.dy,
          left: shieldPosition.value.dx,
          child: AnimatedScale(
            duration: widget.scaleDuration,
            scale: shieldScale.value,
            child: Image.asset(
              widget.imageAsset,
              width: widget.imageWidth,
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
