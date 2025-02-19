/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-02 10:15:35
 * @LastEditTime: 2025-02-19 17:51:19
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

                  // if (ctrl.showBuff.value)
                  //   for (int index = 0;
                  //       index < ctrl.tacticChooseList.length;
                  //       index++)
                  //     Obx(() {
                  //       var e = ctrl.tacticChooseList[index];
                  //       return Positioned(
                  //           left: e.offset.value.dx,
                  //           top: e.offset.value.dy + 30.w,
                  //           child: Visibility(
                  //             visible: !ctrl.showBuff.value,
                  //             child: Container(
                  //               width: 74.w,
                  //               alignment: Alignment.center,
                  //               child: AnimatedArrow(
                  //                 end: -5,
                  //                 child: Image.asset(
                  //                   Assets.commonUiCommonArrow,
                  //                   width: 10.w,
                  //                   // height: 12.w,
                  //                 ),
                  //               ),
                  //             ),
                  //           ));
                  //     }),
                  if (ctrl.showBuff.value)
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
                                Assets.managerUiManagerBattleTextbase01,
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

                  // Positioned(
                  //   top: 47.w,
                  //   left: 0,
                  //   child: Container(
                  //     width: 140.w,
                  //     height: 157.w,
                  //     color: Colors.transparent,
                  //     child: Stack(
                  //       children: [
                  //         for (var i = 0; i < 5; i++)
                  // Positioned(
                  //   left: ctrl.offsets[i].dx,
                  //   top: ctrl.offsets[i].dy,
                  //   child: Transform.rotate(
                  //     alignment: Alignment.center,
                  //     angle: ctrl.angles[i] * pi / 180,
                  //     child: i <= ctrl.trainingInfo.buff.length - 1
                  //         ? SmallTacticCardNew(
                  //             buff: ctrl.trainingInfo.buff[i],
                  //             width: 35.w + i * 2.5.w,
                  //           )
                  //         : CardBackWidget(width: 35.w + i * 2.5.w),
                  //   ),
                  // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  ///卡牌选择
                  if (ctrl.showBuff.value)
                    for (int index = 0;
                        index < ctrl.tacticChooseList.length;
                        index++)
                      Obx(() {
                        var e = ctrl.tacticChooseList[index];
                        return AnimatedPositioned(
                          left: e.offset.value.dx,
                          top: e.offset.value.dy,
                          duration: 200.milliseconds,
                          child: AnimatedRotation(
                            duration: 300.milliseconds,
                            turns: e.rotate.value / 360,
                            curve: Curves.decelerate,
                            child: AnimatedScale(
                              alignment: Alignment.topLeft,
                              duration: Duration(
                                  milliseconds: !ctrl.showBuff.value ? 0 : 300),
                              scale: e.scale,
                              child: MtInkWell(
                                onTap: () {
                                  if (!ctrl.canChoose) return;
                                  ctrl.chooseTactic(context, e);
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

class TrainingSlotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final strokeWidth = 1.5;
    final innerLineWidth = 132.5;
    final lineCount = 8; // 8 lines with 45-degree intervals
    final initialAngle =
        22.5 * (3.141592653589793 / 180); // Convert 22.5 degrees to radians

    // Paint the green semicircle
    final semicirclePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final semicirclePath = Path()
      ..moveTo(center.dx, center.dy)
      ..arcToPoint(
        Offset(center.dx + radius, center.dy),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(center.dx - radius, center.dy),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(semicirclePath, semicirclePaint);

    // Paint the inner line with border
    final innerLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + innerLineWidth;

    final innerLinePath = Path()
      ..moveTo(center.dx - innerLineWidth / 2, center.dy)
      ..lineTo(center.dx + innerLineWidth / 2, center.dy);

    canvas.drawPath(innerLinePath, innerLinePaint);

    // Paint the inner line border
    final innerLineBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final innerLineBorderPath = Path()
      ..moveTo(center.dx - innerLineWidth / 2 - strokeWidth / 2, center.dy)
      ..lineTo(center.dx + innerLineWidth / 2 + strokeWidth / 2, center.dy);

    canvas.drawPath(innerLineBorderPath, innerLineBorderPaint);

    // Paint the connecting lines
    final linePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < lineCount; i++) {
      double angle = initialAngle +
          i * (45 * (3.141592653589793 / 180)); // Convert 45 degrees to radians
      double x1 = center.dx + (radius - strokeWidth / 2) * cos(angle);
      double y1 = center.dy - (radius - strokeWidth / 2) * sin(angle);
      double x2 = center.dx +
          (radius + innerLineWidth / 2 + strokeWidth / 2) * cos(angle);
      double y2 = center.dy -
          (radius + innerLineWidth / 2 + strokeWidth / 2) * sin(angle);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
