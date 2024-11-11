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
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
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
  late EasyAnimationController startAnimationController;
  late Animation<double> animation;
  Timer? gameTimer;

  var fightAnimationValue = 0.0.obs;

  var winAnimationValue = false.obs;

  final winDuration = const Duration(milliseconds: 500);

  //设置左边赢不赢
  bool leftWin = true;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  late Animation<double> otherAnimationWithFighting;
  var otherAnimationWithFightingValue = 0.0.obs;

  @override
  void initState() {
    super.initState();
    controller = Get.find();

    leftWin = getScore(true)>getScore(false);

    startAnimationController = EasyAnimationController(
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
              _buildPlayers(width),
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
                            transform: Matrix4.identity()
                              ..scale(-1.0, 1.0), // X 轴翻转
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
                            transform: Matrix4.identity()
                              ..scale(1.0, -1.0), // X 轴翻转
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
    return Obx(() {
      var maxXTranslateValue = fightAnimationValue.value;
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
                  left: winAnimationValue.value && leftWin
                      ? 0
                      : -width / 2 - 5 - maxXTranslateValue,
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
                                      child: AnimatedContainer(
                                        duration: winDuration,
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
                                      child: AnimatedContainer(
                                        duration: winDuration,
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
                              AnimatedPositioned(
                                duration: winDuration,
                                right: winAnimationValue.value ? 0 : 47.w,
                                left: winAnimationValue.value ? 0 : null,
                                child: Center(
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
                                ),
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
                  right: winAnimationValue.value && !leftWin
                      ? (width - winWidth) / 2
                      : -width / 2 - 5 + maxXTranslateValue,
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
                                            clipper: CircleClipper(
                                                leftCut:
                                                    winAnimationValue.value),
                                            child: AnimatedContainer(
                                              duration: winDuration,
                                              width: winAnimationValue.value
                                                  ? winWidth
                                                  : width,
                                              color: AppColors.cFF7954,
                                            ),
                                          )),
                                      Positioned(
                                          left: -3.h,
                                          bottom: 0,
                                          top: 3.h,
                                          child: ClipPath(
                                            clipper: CircleClipper(
                                                leftCut:
                                                    winAnimationValue.value),
                                            child: AnimatedContainer(
                                              duration: winDuration,
                                              width: winAnimationValue.value
                                                  ? winWidth
                                                  : width,
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
                              AnimatedPositioned(
                                duration: winDuration,
                                left: winAnimationValue.value
                                    ? (width - (width - winWidth) / 2 - 47.w) /
                                        2
                                    : 47.w,
                                right: winAnimationValue.value ? 0 : null,
                                child: Center(
                                  child: Container(
                                      height: 68.h,
                                      width: 68.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.h),
                                          border: Border.all(
                                              color: AppColors.cFF7954,
                                              width: 2.h)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12.h),
                                          child: IconWidget(
                                              iconWidth: 68.h,
                                              iconHeight: 68.h,
                                              icon:
                                                  controller.opponentAvatar))),
                                ),
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
            child: InkWell(
              // onTap: () => _gameStart(),
              // onTap: (){
              //   winAnimationValue.value = !winAnimationValue.value;
              // },
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
                                          left:
                                              (325.w / 4) * (index + 1) - 3.w),
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
                                                        repeat: ImageRepeat
                                                            .repeat)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "100",
                                    style: 10.w4(
                                        color:
                                            AppColors.cB3B3B3.withOpacity(.7),
                                        height: 1),
                                  ),
                                  Text(
                                    "50",
                                    style: 10.w4(
                                        color:
                                            AppColors.cB3B3B3.withOpacity(.7),
                                        height: 1),
                                  ),
                                  Text(
                                    "100",
                                    style: 10.w4(
                                        color:
                                            AppColors.cB3B3B3.withOpacity(.7),
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
                                        borderRadius:
                                            BorderRadius.circular(4.h)),
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
                                  otherAnimationWithFightingValue.value)
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

  Widget _buildPlayers(double width) {
    /// 垂直范围 320.h - 370.h
    List<Offset> positions = [
      Offset(30.w, 14.h),
      Offset(99.w, 10.h),
      Offset(170.w, 15.h),
      Offset(70.w, 35.h),
      Offset(130.w, 40.h),
    ];
    return Obx(() {
      return Positioned(
        top: 320.h,
        left: -fightAnimationValue.value / 5,
        // right: 0,
        child: AnimatedOpacity(
          opacity: winAnimationValue.value ? 0 : 1,
          duration: winDuration,
          child: SizedBox(
            width: width,
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

  int getScore(bool left) {
    var scoreBoard = left
        ? controller.battleEntity.gameData.homeScoreBoard
        : controller.battleEntity.gameData.awayScoreBoard;
    var score = scoreBoard.quarter1 +
        scoreBoard.quarter2 +
        scoreBoard.quarter3 +
        scoreBoard.quarter4;
    return score;
  }

  Widget _buildScore() {
    return Obx(() {
      return Positioned(
        top: max(145.h * startAnimationController.value.value, 70.h),
        child: Opacity(
          opacity: max(startAnimationController.value.value, 0.5),
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
                      color: AppColors.cFFFFFF.withOpacity(.1),
                      borderRadius: BorderRadius.circular(9.h)),
                  child: Text(
                    "${(otherAnimationWithFightingValue.value * getScore(true)).toInt()}",
                    style: 40.w7(color: AppColors.c3B93FF),
                  ),
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
                    var leftQuarterScore =
                        (otherAnimationWithFightingValue.value * getScore(true))
                            .toInt();
                    var rightQuarterScore =
                        (otherAnimationWithFightingValue.value *
                                getScore(false))
                            .toInt();

                    getQuarterScore(int index, bool left, int score) {
                      var result = score;
                      var scoreBoard = left
                          ? controller.battleEntity.gameData.homeScoreBoard
                          : controller.battleEntity.gameData.awayScoreBoard;
                      if (index == 0) {
                        result = min(scoreBoard.quarter1, result);
                      }

                      if (index == 1) {
                        result = min(
                            scoreBoard.quarter1 + scoreBoard.quarter2, result);
                        result = result > scoreBoard.quarter1
                            ? result - scoreBoard.quarter1
                            : 0;
                      }

                      if (index == 2) {
                        result = min(
                            scoreBoard.quarter1 +
                                scoreBoard.quarter2 +
                                scoreBoard.quarter3,
                            result);
                        result =
                            result > (scoreBoard.quarter1 + scoreBoard.quarter2)
                                ? result -
                                    (scoreBoard.quarter1 + scoreBoard.quarter2)
                                : 0;
                      }

                      if (index == 3) {
                        result = min(
                            scoreBoard.quarter1 +
                                scoreBoard.quarter2 +
                                scoreBoard.quarter3 +
                                scoreBoard.quarter4,
                            result);
                        result = result >
                                (scoreBoard.quarter1 +
                                    scoreBoard.quarter2 +
                                    scoreBoard.quarter3)
                            ? result -
                                (scoreBoard.quarter1 +
                                    scoreBoard.quarter2 +
                                    scoreBoard.quarter3)
                            : 0;
                      }
                      return result;
                    }

                    leftQuarterScore =
                        getQuarterScore(index, true, leftQuarterScore);
                    rightQuarterScore =
                        getQuarterScore(index, false, rightQuarterScore);

                    return Container(
                      margin: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "${leftQuarterScore > 0 ? leftQuarterScore : "--"}",
                              textAlign: TextAlign.end,
                              style: 14.w7(
                                  color: leftQuarterScore > 0
                                      ? AppColors.c3B93FF
                                      : AppColors.c666666,
                                  height: 1),
                            ),
                          ),
                          14.hGap,
                          Row(
                            children: [
                              SizedBox(
                                width: 5.h,
                                height: 5.h,
                                child: Visibility(
                                    visible: leftQuarterScore > 0,
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
                                    color: leftQuarterScore > 0
                                        ? AppColors.cB3B3B3
                                        : AppColors.c666666,
                                    height: 1),
                              ),
                              4.hGap,
                              SizedBox(
                                  width: 5.h,
                                  height: 5.h,
                                  child: Visibility(
                                      visible: leftQuarterScore > 0,
                                      child: IconWidget(
                                        iconWidth: 5.h,
                                        icon: Assets.uiTriangleGPng,
                                        rotateAngle: 90,
                                        iconColor: AppColors.cB3B3B3,
                                      ))),
                            ],
                          ),
                          14.hGap,
                          Expanded(
                            child: Text(
                              "${rightQuarterScore > 0 ? rightQuarterScore : "--"}",
                              style: 14.w7(
                                  color: leftQuarterScore > 0
                                      ? AppColors.c3B93FF
                                      : AppColors.c666666,
                                  height: 1),
                            ),
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
                      color: AppColors.cFFFFFF.withOpacity(.1),
                      borderRadius: BorderRadius.circular(9.h)),
                  child: Text(
                    "${(otherAnimationWithFightingValue.value * getScore(false)).toInt()}",
                    style: 40.w7(color: AppColors.cFF7954),
                  ),
                ),
                9.hGap,
              ],
            ),
          ),
        ),
      );
    });
  }

  void _gameStart() {
    // leftWin = false;

    /// 以此为左边胜率，右边相反（跟着左边一起移动），用nextDouble
    animationController.removeStatusListener(_countDownStatusListener);
    animation.removeListener(_countDownAnimationListener);
    animationController.reset();
    fightAnimationValue.value = otherAnimationWithFightingValue.value = 0.0;
    _buildPath();
    animationController.duration = const Duration(milliseconds: 3000);
    animationController.addStatusListener(_fightAnimationStatusListener);
    // animation = Tween(begin: 0.0, end: 5.2).animate(animationController)
    //   ..addListener(_fightAnimationListener);
    _buildFightAnimation();
    _buildOtherAnimationWithFight();
    animationController.forward();
  }

  void _fightAnimationStatusListener(status) {
    if (status != AnimationStatus.completed) {
      return;
    }

    /// 比赛结束
    Future.delayed(const Duration(seconds: 1), () {
      winAnimationValue.value = true;
      animationController.removeStatusListener(_fightAnimationStatusListener);
      animation.removeListener(_fightAnimationListener);
      Future.delayed(const Duration(seconds: 2), () {
        widget.onGameOver.call();
      });
    });
  }

  void _buildFightAnimation() {
    var width = MediaQuery.of(context).size.width / 2;
    width = leftWin ? width : -width;
    var curve = Random().nextBool() ? Curves.elasticInOut : Curves.elasticInOut;
    animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: width).chain(CurveTween(curve: curve)),
          weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: -width).chain(CurveTween(curve: curve)),
          weight: 0.3),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: width).chain(CurveTween(curve: curve)),
          weight: 0.1),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: width).chain(CurveTween(curve: curve)),
          weight: 0.2),
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: -width)
              .chain(CurveTween(curve: Curves.elasticIn)),
          weight: 0.2),
    ]).animate(animationController)
      ..addListener(_fightAnimationListener);
  }

  _buildOtherAnimationWithFight() {
    otherAnimationWithFighting =
        Tween(begin: 0.0, end: 1.0).animate(animationController)
          ..addListener(() {
            otherAnimationWithFightingValue.value =
                otherAnimationWithFighting.value;
            calculate(otherAnimationWithFighting.value);
          });
  }

  void _fightAnimationListener() {
    fightAnimationValue.value = animation.value;
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
    var index = (value * (list.length - 1)).toInt();
    var item = list[index];
    if (pointOffset.value.dx != item.dx) {
      pointOffset.value = item;
      // print('chartPoints.length:${chartPoints.length},$index,${list.length}');
      chartPoints.addAll(list.getRange(chartPoints.length, index));
      chartPoints.refresh();
    }
  }
}
