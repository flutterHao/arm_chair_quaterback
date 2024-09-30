import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/circle_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/score_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller.dart';

///
///@auther gejiahui
///created at 2024/9/29/15:59

class BattleGame extends StatefulWidget {
  const BattleGame({super.key, required this.onGameOver});

  final Function onGameOver;

  @override
  State<BattleGame> createState() => _BattleGameState();
}

class _BattleGameState extends State<BattleGame>
    with SingleTickerProviderStateMixin {
  late TeamBattleController controller;

  /// 比赛开始倒计时
  var countDown = 3.0.obs;

  /// 比赛剩余
  var gameLastTimes = 170.obs;

  late AnimationController animationController;
  late Animation<double> animation;
  Timer? gameTimer;

  var fightAnimationValue = 0.0.obs;

  var winAnimationValue = false.obs;

  final winDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 3))
      ..addStatusListener(_countDownStatusListener);
    animation = Tween(begin: 4.0, end: 1.0).animate(animationController)
      ..addListener(_countDownAnimationListener);
    animationController.forward();
  }

  void _countDownAnimationListener() {
    countDown.value = animation.value;
  }

  void _countDownStatusListener(status) {
    if (status == AnimationStatus.completed) {
      _gameStart();
      // gameTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      //   gameLastTimes.value = gameLastTimes.value - 1;
      //   if (gameLastTimes.value == 0) {
      //     gameTimer?.cancel();
      //   }
      //   if (gameLastTimes.value == 13) {
      //     /// 中场助威,助威完之后恢复倒计时
      //     // gameTimer?.cancel();
      //   }
      // });
    }
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildScore(),
        _buildWinRate(),
        _buildPlayers(),
        _buildGameStartCountdown(),
        _buildCenterFight(width),
        _buildWinText()
      ],
    );
  }

  Obx _buildWinText() {
    return Obx(() {
      return AnimatedPositioned(
          top: winAnimationValue.value ? 270.h : -100.h,
          duration: winDuration,
          child: Text(
            "WIN",
            style: 64.w7(color: AppColors.c000000),
          ));
    });
  }

  Widget _buildCenterFight(double width) {
    return Obx(() {
      var maxXTranslateValue = width / 4;
      var xTranslateValue = 0.0;
      if (fightAnimationValue.value < 1) {
        xTranslateValue = fightAnimationValue.value * maxXTranslateValue;
      } else if (fightAnimationValue.value < 3) {
        xTranslateValue =
            -(fightAnimationValue.value - 1) * maxXTranslateValue +
                maxXTranslateValue;
      } else if (fightAnimationValue.value < 3.8) {
        xTranslateValue =
            (fightAnimationValue.value - 3) * 2 * maxXTranslateValue -
                maxXTranslateValue;
      } else {
        xTranslateValue =
            -(fightAnimationValue.value - 3.8) * 3 * maxXTranslateValue +
                0.6 * maxXTranslateValue;
      }
      var winWidth = 250.w;
      return Positioned(
          bottom: 282.h,
          child: SizedBox(
            height: 135.h,
            width: width,
            child: Stack(
              children: [
                // left
                AnimatedPositioned(
                  duration: winDuration,
                  left: winAnimationValue.value
                      ? 0
                      : -width / 2 - 5 - xTranslateValue,
                  child: SizedBox(
                    height: 135.h,
                    width: width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            left: 0,
                            bottom: 3.h,
                            top: 0,
                            right: 0,
                            child: Center(
                              child: ClipPath(
                                clipper: CircleClipper(
                                    leftCut: winAnimationValue.value),
                                child: Container(
                                  width: winAnimationValue.value
                                      ? winWidth
                                      : width,
                                  color: AppColors.c3B93FF,
                                ),
                              ),
                            )),
                        Positioned(
                            left: -3.h,
                            bottom: 0,
                            top: 3.h,
                            right: 0,
                            child: Center(
                              child: ClipPath(
                                clipper: CircleClipper(
                                    leftCut: winAnimationValue.value),
                                child: Container(
                                  width: winAnimationValue.value
                                      ? winWidth
                                      : width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.c3B93FF,
                                            AppColors.c000000.withOpacity(.8),
                                            AppColors.c000000.withOpacity(.9),
                                            AppColors.c000000
                                          ])),
                                ),
                              ),
                            )),
                        Positioned(
                          right: winAnimationValue.value ? null : 47.w,
                          child: Container(
                              height: 68.h,
                              width: 68.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14.h),
                                  border: Border.all(
                                      color: AppColors.c3B93FF, width: 2.h)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.h),
                                  child: IconWidget(
                                      iconWidth: 68.h,
                                      iconHeight: 68.h,
                                      icon: controller.meAvatar))),
                        )
                      ],
                    ),
                  ),
                ),

                // right
                AnimatedPositioned(
                  duration: winDuration,
                  right: winAnimationValue.value
                      ? -width
                      : -width / 2 - 5 + xTranslateValue,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: pi,
                        child: SizedBox(
                          height: 135.h,
                          width: width,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 0,
                                  bottom: 3.h,
                                  top: 0,
                                  child: ClipPath(
                                    clipper: CircleClipper(),
                                    child: Container(
                                      width: width,
                                      // margin: EdgeInsets.only(bottom: 3.h),
                                      color: AppColors.cFF7954,
                                    ),
                                  )),
                              Positioned(
                                  left: -3.h,
                                  bottom: 0,
                                  top: 3.h,
                                  child: ClipPath(
                                    clipper: CircleClipper(),
                                    child: Container(
                                      width: width,
                                      // margin: EdgeInsets.only(top: 3.h),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [
                                                AppColors.cFF7954,
                                                AppColors.c000000.withOpacity(
                                                    .7),
                                                AppColors.c000000.withOpacity(
                                                    .9),
                                                AppColors.c000000
                                              ])),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 47.w,
                        child: Container(
                            height: 68.h,
                            width: 68.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.h),
                                border: Border.all(
                                    color: AppColors.c3B93FF, width: 2.h)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.h),
                                child: IconWidget(
                                    iconWidth: 68.h,
                                    iconHeight: 68.h,
                                    icon: controller.opponentAvatar))),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }

  Positioned _buildWinRate() {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 315.h,
          color: AppColors.c262626,
          child: Column(
            children: [
              75.vGap,
              Text(
                "WIN RATE",
                style: 16.w7(color: AppColors.cD3D3D3),
              ),
              9.vGap,
              Container(
                width: 325.w,
                height: 181.h,
                color: AppColors.c3B3B3B,
              )
            ],
          ),
        ));
  }

  Widget _buildGameStartCountdown() {
    return Positioned(
        top: 244.h,
        child: Obx(() {
          return AnimatedOpacity(
            opacity: winAnimationValue.value ? 0 : 1,
            duration: winDuration,
            child: AnimatedContainer(
              width: countDown.value == 1 ? 86.w : 58.h,
              height: countDown.value == 1 ? 46.h : 58.h,
              decoration: BoxDecoration(
                  color: AppColors.c000000.withOpacity(.7),
                  borderRadius:
                  BorderRadius.circular(countDown.value == 1 ? 8.h : 29.h)),
              duration: const Duration(milliseconds: 300),
              child: countDown.value == 1
                  ? Center(
                  child: Text(
                    MyDateUtils.formatMS((gameLastTimes.value -
                        gameLastTimes.value *
                            fightAnimationValue.value /
                            4.4)
                        .toInt()),
                    style: 24.w7(
                        color: /*gameLastTimes.value <= 10
                            ? AppColors.cFF3B5C
                            :*/
                        AppColors.cF2F2F2),
                  ))
                  : Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 48.h,
                    height: 48.h,
                    child: CircularProgressIndicator(
                      value: 1 - (countDown.value - 1) / 3,
                      strokeWidth: 3.w,
                      backgroundColor: AppColors.c666666,
                      color: AppColors.cF2F2F2,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Text(
                    "${countDown.value ~/ 1}",
                    style: 34.w7(color: AppColors.cF2F2F2),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Widget _buildPlayers() {
    /// 垂直范围 320.h - 370.h
    List<Offset> positions = [
      Offset(30.h, 14.h),
      Offset(99.h, 10.h),
      Offset(180.h, 15.h),
      Offset(70.h, 35.h),
      Offset(130.h, 40.h),
    ];
    return Obx(() {
      return Positioned(
        top: 320.h,
        left: 0,
        right: 0,
        child: AnimatedOpacity(
          opacity: winAnimationValue.value ? 0 : 1,
          duration: winDuration,
          child: SizedBox(
            height: 70.h,
            child: Stack(
              children: [

                /// left
                ...List.generate(positions.length, (index) {
                  var dx = positions[index].dx;
                  var dy = positions[index].dy;
                  return Positioned(
                      left: dx,
                      top: dy,
                      child: IconWidget(
                          iconWidth: 15.h, icon: Assets.uiIconLocation_02Png));
                }),
                // right
                ...List.generate(positions.length, (index) {
                  var dx = positions[index].dx;
                  var dy = positions[index].dy;
                  return Positioned(
                      right: dx,
                      top: dy,
                      child: IconWidget(
                          iconWidth: 15.h, icon: Assets.uiIconLocation_01Png));
                }),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildScore() {
    return Obx(() {
      return ScorePanel(leftScore: ((fightAnimationValue.value / 4) * 172).toInt(), rightScore: ((fightAnimationValue.value / 4) * 146).toInt());
    });
    return Positioned(
        top: 145.h,
        child: Container(
          height: 81.h,
          constraints: BoxConstraints(
            maxWidth: 343.w,
          ),
          decoration: BoxDecoration(
              color: AppColors.c262626,
              borderRadius: BorderRadius.circular(16.w)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              9.hGap,
              Container(
                width: 99.w,
                height: 63.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.c666666,
                    borderRadius: BorderRadius.circular(9.h)),
                child: Obx(() {
                  return Text(
                    "${((fightAnimationValue.value / 4) * 172).toInt()}",
                    style: 40.w7(color: AppColors.c3B93FF),
                  );
                }),
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      var section = index == 0
                          ? "1ST"
                          : index == 1
                          ? "2ND"
                          : index == 2
                          ? "3RD"
                          : "4TH";
                      var score = index == 0 ? 99 : -1;
                      return Container(
                        margin: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${score > 0 ? score : "--"}",
                              style: 14.w7(
                                  color: score > 0
                                      ? AppColors.c3B93FF
                                      : AppColors.c666666,
                                  height: 1),
                            ),
                            14.hGap,
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.h,
                                  height: 5.h,
                                  child: Visibility(
                                      visible: score > 0,
                                      child: IconWidget(
                                        iconWidth: 5.h,
                                        icon: Assets.uiTriangleGPng,
                                        rotateAngle: -90,
                                        iconColor: AppColors.cB3B3B3,
                                      )),
                                ),
                                4.hGap,
                                Text(
                                  section,
                                  style: 10.w4(
                                      color: score > 0
                                          ? AppColors.cB3B3B3
                                          : AppColors.c666666,
                                      height: 1),
                                ),
                                4.hGap,
                                SizedBox(
                                    width: 5.h,
                                    height: 5.h,
                                    child: Visibility(
                                        visible: score > 0,
                                        child: IconWidget(
                                          iconWidth: 5.h,
                                          icon: Assets.uiTriangleGPng,
                                          rotateAngle: 90,
                                          iconColor: AppColors.cB3B3B3,
                                        ))),
                              ],
                            ),
                            14.hGap,
                            Text(
                              "${score > 0 ? score : "--"}",
                              style: 14.w7(
                                  color: score > 0
                                      ? AppColors.c3B93FF
                                      : AppColors.c666666,
                                  height: 1),
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
              Container(
                width: 99.w,
                height: 63.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.c666666,
                    borderRadius: BorderRadius.circular(9.h)),
                child: Obx(() {
                  return Text(
                    "${((fightAnimationValue.value / 4) * 146).toInt()}",
                    style: 40.w7(color: AppColors.cFF7954),
                  );
                }),
              ),
              9.hGap,
            ],
          ),
        ));
  }

  void _gameStart() {
    /// 随机生产一个0-1的数字，
    var nextDouble = Random().nextDouble();

    /// 以此为左边胜率，右边相反（跟着左边一起移动），用nextDouble
    animationController.removeStatusListener(_countDownStatusListener);
    animation.removeListener(_countDownAnimationListener);
    animationController.reset();
    fightAnimationValue.value = 0.0;
    animationController.duration = const Duration(milliseconds: 1500);
    animationController.addStatusListener(_fightAnimationStatusListener);
    animation = Tween(begin: 0.0, end: 4.4).animate(animationController)
      ..addListener(_fightAnimationListener);
    animationController.forward();
  }

  void _fightAnimationStatusListener(status) {
    if (status != AnimationStatus.completed) {
      return;
    }

    /// 比赛结束
    Future.delayed(const Duration(seconds: 1), () {
      animationController.removeStatusListener(_fightAnimationStatusListener);
      animation.removeListener(_fightAnimationListener);
      animationController.reset();
      animationController.addStatusListener((s) {});
      winAnimationValue.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        widget.onGameOver.call();
      });
    });
  }

  void _fightAnimationListener() {
    fightAnimationValue.value = animation.value;
  }
}
