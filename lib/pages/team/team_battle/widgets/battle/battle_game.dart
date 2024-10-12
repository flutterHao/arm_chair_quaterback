import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/DashedLine.dart';
import 'package:arm_chair_quaterback/common/widgets/chart_painter.dart';
import 'package:arm_chair_quaterback/common/widgets/circle_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/line_chart_clipper.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_game_over.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
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

class _BattleGameState extends State<BattleGame> with TickerProviderStateMixin {
  late TeamBattleController controller;

  /// 比赛开始倒计时
  var countDown = 3.0.obs;

  /// 比赛剩余
  var gameLastTimes = 170.obs;

  late AnimationController animationController;
  late BattleAnimationController startAnimationController;
  late Animation<double> animation;
  Timer? gameTimer;

  var fightAnimationValue = 0.0.obs;

  var winAnimationValue = false.obs;

  final winDuration = const Duration(milliseconds: 500);

  //设置左边赢不赢
  bool leftWin = true;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    leftWin = Random().nextBool();

    startAnimationController = BattleAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 300));
    startAnimationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.forward();
        _controller.forward();
        Timer.periodic(const Duration(seconds: 1), (t) {
          if (countDown.value <= 1) {
            t.cancel();
          } else {
            _controller.forward();
          }
        });
      }
    });
    startAnimationController.forward();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addStatusListener(_countDownStatusListener);
    animation = Tween(begin: 4.0, end: 1.0).animate(animationController)
      ..addListener(_countDownAnimationListener);

    // 初始化动画控制器
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // 动画时长
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.2, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(); // 动画完成时反向播放
        }
      });
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
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      // onTap: () => _gameStart(),
      child: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (controller.step.value == 5)
              const BattleGameOver()
            else ...[
              _buildWinRate(),
              _buildPlayers(),
              _buildLive(),
              _buildGameStartCountdown(),
              _buildCenterFight(width),
              _buildWinText()
            ],
            _buildScore(),
          ],
        );
      }),
    );
  }

  Positioned _buildLive() {
    return Positioned(
        top: 247.h,
        left: 16.w,
        right: 16.w,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Obx(() {
              return Transform.scale(
                scale: max(1, min(countDown.value, 3) - 1.5),
                child: Container(
                  height: 120.h,
                  child: Stack(
                    children: [
                      //左上
                      Positioned(
                          left: 0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(-1.0, 1.0), // X 轴翻转
                            child: IconWidget(
                              iconWidth: 21.w,
                              icon: Assets.uiTeamFramePng,
                              iconColor: AppColors.c161616,
                            ),
                          )),
                      //右上
                      Positioned(
                          right: 0,
                          child: IconWidget(
                            iconWidth: 21.w,
                            icon: Assets.uiTeamFramePng,
                            iconColor: AppColors.c161616,
                          )),
                      //左下
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Transform.rotate(
                            angle: pi / 180 * 180,
                            child: IconWidget(
                              iconWidth: 21.w,
                              icon: Assets.uiTeamFramePng,
                              iconColor: AppColors.c161616,
                            ),
                          )),
                      // 右下
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(1.0, -1.0), // X 轴翻转
                            child: IconWidget(
                              iconWidth: 21.w,
                              icon: Assets.uiTeamFramePng,
                              iconColor: AppColors.c161616,
                            ),
                          )),
                    ],
                  ),
                ),
              );
            }),
            Container(
              height: 12.h,
              width: 37.w,
              margin: EdgeInsets.only(top: 6.h, left: 7.w),
              decoration: BoxDecoration(
                  color: AppColors.cF2F2F2.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6.h)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 4.h,
                      width: 4.h,
                      decoration: BoxDecoration(
                          color: AppColors.cF42D40,
                          borderRadius: BorderRadius.circular(2.h)),
                    ),
                    3.hGap,
                    Text(
                      "LIVE",
                      style: 8.w7(color: AppColors.c262626, height: 1.12),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
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
    var xTranslateValue = 0.0;
    var winX = 0.0;
    return Obx(() {
      var maxXTranslateValue = width / 3;
      var backX = maxXTranslateValue / 2;
      if (fightAnimationValue.value <= 1) {
        xTranslateValue = fightAnimationValue.value * maxXTranslateValue;
      } else if (fightAnimationValue.value <= 3) {
        xTranslateValue =
            -(fightAnimationValue.value - 1) / 2 * 2 * maxXTranslateValue +
                maxXTranslateValue;
      } else if (fightAnimationValue.value <= 3.8) {
        xTranslateValue =
            (fightAnimationValue.value - 3) / 0.8 * maxXTranslateValue -
                maxXTranslateValue;
      } else if (fightAnimationValue.value <= 4.7) {
        winX = (fightAnimationValue.value - 3.8) / 0.9 * -backX;
      } else if (fightAnimationValue.value <= 5.0) {
        winX = (fightAnimationValue.value - 4.7) / 0.3 * (backX + 20.w) - backX;
      } else {
        xTranslateValue = (fightAnimationValue.value - 4.8) /
            0.4 *
            (leftWin ? -1 : 1) *
            maxXTranslateValue;
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
                      : -width / 2 - 5 - xTranslateValue + (leftWin ? winX : 0),
                  child: SizedBox(
                    height: 135.h,
                    width: width,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -width /
                              2 *
                              (1 - startAnimationController.value.value),
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
                                        borderRadius:
                                            BorderRadius.circular(14.h),
                                        border: Border.all(
                                            color: AppColors.c3B93FF,
                                            width: 2.h)),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
                                        child: IconWidget(
                                            iconWidth: 68.h,
                                            iconHeight: 68.h,
                                            icon: controller.meAvatar))),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // right
                AnimatedPositioned(
                  duration: winDuration,
                  right: winAnimationValue.value
                      ? -width
                      : -width / 2 - 5 + xTranslateValue + (leftWin ? 0 : winX),
                  child: SizedBox(
                    height: 135.h,
                    width: width,
                    child: Stack(
                      children: [
                        Positioned(
                          right: -width / 2 +
                              width / 2 * startAnimationController.value.value,
                          height: 135.h,
                          width: width,
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
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                    AppColors.cFF7954,
                                                    AppColors.c000000
                                                        .withOpacity(.7),
                                                    AppColors.c000000
                                                        .withOpacity(.9),
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
                                        borderRadius:
                                            BorderRadius.circular(14.h),
                                        border: Border.all(
                                            color: AppColors.c3B93FF,
                                            width: 2.h)),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.h),
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
                  ),
                ),
              ],
            ),
          ));
    });
  }

  Widget _buildWinRate() {
    return Obx(() {
      return Positioned(
          bottom: (1 - startAnimationController.value.value) * -200.h,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: max(startAnimationController.value.value, 0.2),
            child: Container(
              height: 315.h,
              color: AppColors.c262626,
              child: Column(
                children: [
                  50.vGap,
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      //背景
                      Text(
                        "WIN RATE",
                        style: 40.w7(
                            color: AppColors.cB3B3B3.withOpacity(.1),
                            height: 1),
                      ),
                      //前景
                      Container(
                        margin: EdgeInsets.only(bottom: 5.h),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "WIN RATE",
                          style: 16.w7(color: AppColors.cD3D3D3, height: 1),
                        ),
                      ),
                    ],
                  ),
                  // 9.vGap,
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 325.w,
                            height: 181.h,
                            color: AppColors.c0D0D0D.withOpacity(.3),
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                // 表格的纵向参照线
                                ...List.generate(3, (index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: (325.w / 4) * (index + 1) - 3.w),
                                    height: 181.h,
                                    width: 3.w,
                                    color: AppColors.c262626,
                                  );
                                }),
                                //横向50参照线
                                const DashedLine(
                                  axis: Axis.horizontal,
                                  dashedWidth: 4,
                                  dashedColor: AppColors.c666666,
                                  count: 40,
                                ),
                                Obx(() {
                                  return Stack(
                                    children: [
                                      //倾斜渐变线
                                      SizedBox(
                                        width: 325.w,
                                        height: 181.h,
                                        child: ClipPath(
                                          clipper: LineChartClipper(
                                              chartPoints.value),
                                          child: ShaderMask(
                                            shaderCallback: (Rect bounds) {
                                              return const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    AppColors.c3B93FF,
                                                    AppColors.c3B93FF,
                                                    AppColors.c3B93FF,
                                                    Colors.black,
                                                    AppColors.cFF7954,
                                                    AppColors.cFF7954,
                                                    AppColors.cFF7954
                                                  ]).createShader(bounds);
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(Assets
                                                          .uiBgDiagonalPng),
                                                      repeat:
                                                          ImageRepeat.repeat)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //折线图实线
                                      CustomPaint(
                                        size: Size(325.w, 181.h),
                                        painter: ChartPainter(
                                            chartPoints.value, 181.h),
                                      )
                                    ],
                                  );
                                }),
                                //实时指标虚线
                                Obx(() {
                                  return Positioned(
                                    left: pointOffset.value != Offset.zero
                                        ? pointOffset.value.dx - 2
                                        : 0,
                                    child: SizedBox(
                                      width: 325.w,
                                      height: 181.h,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            color: AppColors.c3B3B3B
                                                .withOpacity(.3),
                                          ),
                                          const Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                height: double.infinity,
                                                child: DashedLine(
                                                  axis: Axis.vertical,
                                                  dashedHeight: 2,
                                                  dashedWidth: 2,
                                                  count: 30,
                                                  dashedColor:
                                                      AppColors.cF2F2F2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                          2.hGap,
                          SizedBox(
                            height: 181.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "100",
                                  style: 10.w4(
                                      color: AppColors.cB3B3B3.withOpacity(.7),
                                      height: 1),
                                ),
                                Text(
                                  "50",
                                  style: 10.w4(
                                      color: AppColors.cB3B3B3.withOpacity(.7),
                                      height: 1),
                                ),
                                Text(
                                  "100",
                                  style: 10.w4(
                                      color: AppColors.cB3B3B3.withOpacity(.7),
                                      height: 1),
                                )
                              ],
                            ),
                          ),
                          8.hGap
                        ],
                      ),
                      //实时数据指示点
                      SizedBox(
                        width: 332.w,
                        height: 188.h,
                        child: Stack(
                          children: [
                            Obx(() {
                              return Positioned(
                                left: pointOffset.value != Offset.zero
                                    ? pointOffset.value.dx - 7.h / 2
                                    : 0,
                                top: pointOffset.value != Offset.zero
                                    ? pointOffset.value.dy
                                    : (181.h - 7.h) / 2, //修改位置
                                child: Container(
                                  width: 7.h,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFFFFF,
                                      borderRadius: BorderRadius.circular(4.h)),
                                  child: Center(
                                    child: Container(
                                        width: 4.h,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.cFF7954,
                                            borderRadius:
                                                BorderRadius.circular(2.h))),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
    });
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
                        AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Text(
                                  "${countDown.value ~/ 1}",
                                  style: 34.w7(color: AppColors.cF2F2F2),
                                ),
                              );
                            }),
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
      return Positioned(
        top: max(145.h * startAnimationController.value.value, 70.h),
        child: Opacity(
          opacity: max(startAnimationController.value.value, 0.5),
          child: ScorePanel(
              leftScore: ((fightAnimationValue.value / 4) * 172).toInt(),
              rightScore: ((fightAnimationValue.value / 4) * 146).toInt()),
        ),
      );
    });
  }

  void _gameStart() {
    /// 以此为左边胜率，右边相反（跟着左边一起移动），用nextDouble
    animationController.removeStatusListener(_countDownStatusListener);
    animation.removeListener(_countDownAnimationListener);
    animationController.reset();
    fightAnimationValue.value = 0.0;
    _buildPath();
    animationController.duration = const Duration(milliseconds: 1000);
    animationController.addStatusListener(_fightAnimationStatusListener);
    animation = Tween(begin: 0.0, end: 5.2).animate(animationController)
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
      // animationController.reset();
      animationController.addStatusListener((s) {});
      winAnimationValue.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        widget.onGameOver.call();
      });
    });
  }

  void _fightAnimationListener() {
    fightAnimationValue.value = animation.value;
    calculate(animation.value);
  }

  /// y：取值范围（-50，50）
  List<Offset> pointData = [
    const Offset(0, 20), //0 90
    const Offset(1, -20),
    const Offset(2, 30),
    const Offset(3, 10),
    const Offset(4, 40),
    const Offset(5, -30),
    const Offset(6, -16),
    const Offset(7, -20),
    const Offset(8, -45),
    const Offset(9, 40),
    const Offset(10, 50),
  ];

  var pointOffset = Offset.zero.obs;
  RxList<Offset> chartPoints = RxList();

  List<Offset> list = [];

  void _buildPath() {
    Path path = Path();
    list.clear();
    chartPoints.clear();
    path.reset();
    Size size = Size(325.w, 181.h);

    var temp = Offset.zero;
    var stepY = size.height / 100;
    var stepX = size.width / (pointData.length - 1);
    var points = List.generate(pointData.length, (index) {
      double dy = 0;
      if (pointData[index].dy < 0) {
        dy = pointData[index].dy.abs() * stepY + size.height / 2;
      } else {
        dy = size.height / 2 - pointData[index].dy;
      }
      return Offset(pointData[index].dx * stepX, dy);
    });
    final spline = CatmullRomSpline(points);
    list = spline.generateSamples().map((e) => e.value).toList();
    // var list = points;
    // print('list.len:${list[0]}');
    path.moveTo(list[0].dx, list[0].dy);
    for (var i = 1; i < list.length; i++) {
      final current = list[i];
      final next = list[i + 1 >= list.length ? i : i + 1];
      final previous = list[i - 1];
      final controlPoint1 = previous + temp;
      temp = Offset(0, temp.dy);

      temp = ((next - previous) / 2) * 0.35;

      final controlPoint2 = current - temp;
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        current.dx,
        current.dy,
      );
    }
    path.lineTo(list[list.length - 1].dx, size.height / 2);
  }

  void calculate(double value) {
    var index = (value / 5.2 * (list.length - 1)).toInt();
    var item = list[index];
    if (pointOffset.value.dx != item.dx) {
      pointOffset.value = item;
      // print('chartPoints.length:${chartPoints.length},$index,${list.length}');
      chartPoints.addAll(list.getRange(chartPoints.length, index));
      chartPoints.refresh();
    }
  }
}
