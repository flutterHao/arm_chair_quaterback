import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/thrid_lib/flutter_barrage.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/mark_animation_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_score_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/start_game_count_down_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/team_stats_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/win_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamBattleV2Page extends GetView<TeamBattleV2Controller> {
  TeamBattleV2Page({super.key});

  late TeamBattleController teamBattleController;

  @override
  Widget build(BuildContext context) {
    teamBattleController = Get.find();
    return GetBuilder<TeamBattleV2Controller>(
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            showPop: true,
          ),
          bodyWidget: Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                    onLongPressUp: () {
                      print('onLongPressUp---------------');
                      controller.changeGameSpeed(1);
                    },
                    onLongPress: (){
                      print('onLongPress---------------');
                      controller.changeGameSpeed(10);
                    },
                    child: buildHeader()),
                Obx(() {
                  var isGameOver = controller.isGameOver.value;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: isGameOver
                        ? InkWell(
                            onTap: () {
                              controller.reStart();
                            },
                            child: buildGameOverWidget(context))
                        : buildGameWidget(context),
                  );
                }),
                buildLiveText(context),
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idQuarterScore,
                    builder: (_) {
                      return QuarterScoreWidget();
                    }),
                GameLeaderWidget(
                  controller: controller.gameLeaderController,
                ),
                TeamStatsWidget(
                  controller: controller.teamStatsController,
                ),
                20.vGap,
              ],
            ),
          )),
        );
      },
    );
  }

  Column buildGameWidget(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.zero,
            child: buildBasketballCourt(context)),
        buildPlayersWidget(),
        10.vGap,
      ],
    );
  }

  Widget buildGameOverWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(9.w)),
          height: 280.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 52.w,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "FINAL STATEMENT",
                    style: TextStyle(
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1.w
                          ..color = AppColors.ccccccc),
                  ),
                ),
              ),
              Positioned(
                  top: 78.w,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                        Assets.managerUiManagerGameoverBg2,
                        fit: BoxFit.fitWidth,
                      )),
                      Expanded(
                          child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(-1.0, 1.0),
                        child: Image.asset(
                          Assets.managerUiManagerGameoverBg2,
                          fit: BoxFit.fitWidth,
                        ),
                      ))
                    ],
                  )),
              Positioned(
                  top: 31.w,
                  child: Text(
                    "VICTORY",
                    style: 42.w7(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  )),
              Positioned(
                  top: 100.w,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            border: Border.all(
                              color: AppColors.cB3B3B3,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(15.w)),
                        height: 31.w,
                        width: 243.w,
                        padding: EdgeInsets.only(left: 18.w, right: 37.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconWidget(
                                iconWidth: 21.w,
                                icon: Assets.teamUiIconTrophy01),
                            Text(
                              "15300",
                              style: 16.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                            Stack(
                              children: [
                                IconWidget(
                                  iconWidth: 7.w,
                                  icon: Assets.commonUiCommonIconSystemJumpto,
                                  iconColor: AppColors.cB3B3B3,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 7.w),
                                    child: IconWidget(
                                        iconWidth: 7.w,
                                        icon: Assets
                                            .commonUiCommonIconSystemJumpto,
                                        iconColor: AppColors.cB3B3B3)),
                              ],
                            ),
                            Text(
                              "15300",
                              style: 16.w5(
                                  color: AppColors.c2DE298,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium),
                            ),
                            IconWidget(
                              iconWidth: 8.w,
                              icon: Assets.commonUiCommonIconSystemArrow,
                              rotateAngle: -90,
                              iconColor: AppColors.c2DE298,
                            ),
                          ],
                        ),
                      ),
                      14.vGap,
                      Container(
                        constraints: BoxConstraints(minHeight: 23.w),
                        child: IconWidget(
                            iconWidth: 60.w,
                            icon: Assets.managerUiManagerGift03),
                      ),
                      6.vGap,
                      Container(
                        constraints: BoxConstraints(maxWidth: 180.w),
                        child: Text(
                          "You've got a treasure chest",
                          textAlign: TextAlign.center,
                          style: 14.w4(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1.2),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
        9.vGap,
      ],
    );
  }

  Container buildLiveText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          Container(
            height: 59.w,
            padding: EdgeInsets.only(left: 16.w),
            child: Obx(() {
              return Row(
                children:
                    List.generate(max(1, controller.quarter.value), (index) {
                  bool active = index == controller.quarter.value - 1;
                  return TweenAnimationBuilder(
                      // 定义动画起始值和结束值
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 2), // 动画时长
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: Container(
                            width: 82.w,
                            height: 28.w,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                                color: active
                                    ? AppColors.c000000
                                    : AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(14.w),
                                border: Border.all(
                                    color: AppColors.c666666, width: 1.w)),
                            alignment: Alignment.center,
                            child: Text(
                              Utils.getSortWithInt(index + 1),
                              style: active
                                  ? 16.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium)
                                  : 16.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldRegular),
                            ),
                          ),
                        );
                      });
                }),
              );
            }),
          ),
          Divider(
            color: AppColors.cD1D1D1,
            height: 1.w,
          ),
          SizedBox(
            height: 44.w * 5,
            child: GetBuilder<TeamBattleV2Controller>(
                id: TeamBattleV2Controller.idLiveText,
                builder: (_) {
                  var itemCount = controller.getQuarterEvents().length;
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: itemCount + 1,
                        reverse: true,
                        controller: controller.liveTextScrollController,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return SizedBox(height: 44.w * 5);
                          }
                          int index = i - 1;
                          GameEvent item = controller.getQuarterEvents()[index];
                          return Container(
                            height: 44.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.only(left: 1.w, right: 24.w),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.cE6E6E6, width: 1.w))),
                            child: Row(
                              children: [
                                Text(
                                  MyDateUtils.formatMS(item.time),
                                  style: 10.w4(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                                10.hGap,
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.5.w),
                                      border: Border.all(
                                          color: item.isHomePlayer
                                              ? AppColors.cD60D20
                                              : AppColors.c1F8FE5,
                                          width: 1.5.w)),
                                  child: ImageWidget(
                                    url: Utils.getPlayUrl(item.playerId),
                                    width: 28.w,
                                    height: 28.w,
                                    borderRadius: BorderRadius.circular(14.w),
                                    imageFailedPath: Assets.teamUiHead03,
                                  ),
                                ),
                                13.hGap,
                                Expanded(
                                    child: Text(
                                  item.text,
                                  maxLines: 3,
                                  softWrap: true,
                                  style: 12.w4(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.c4D4D4D,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )),
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                        text: "${item.homeScore}",
                                        style: TextStyle(
                                          color: item.score && item.isHomePlayer
                                              ? AppColors.cD60D20
                                              : AppColors.c4D4D4D,
                                        )),
                                    const TextSpan(text: "-"),
                                    TextSpan(
                                        text: "${item.awayScore}",
                                        style: TextStyle(
                                          color:
                                              item.score && !item.isHomePlayer
                                                  ? AppColors.c1F8FE5
                                                  : AppColors.c4D4D4D,
                                        )),
                                  ]),
                                  style: 12.w4(
                                      color: AppColors.c4D4D4D,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
          ),
          MtInkwell(
            onTap: () => controller.seeAll(),
            child: Container(
              height: 44.w,
              margin: EdgeInsets.only(right: 20.w),
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SEE ALL",
                    style: 16.w7(
                        color: AppColors.c262626,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                  6.hGap,
                  IconWidget(
                    iconWidth: 5.w,
                    icon: Assets.commonUiCommonIconSystemJumpto,
                    iconColor: AppColors.c000000,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPlayersWidget() {
    return GetBuilder<TeamBattleV2Controller>(
        id: TeamBattleV2Controller.idPlayers,
        builder: (_) {
          GameEvent? event;
          if (controller.getQuarterEvents().isNotEmpty) {
            event = controller.getQuarterEvents().last;
          }
          return SizedBox(
            height: 44.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                16.hGap,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      var list = controller.getHomeTeamPlayerList();
                      var item = list[index];
                      var active = event != null &&
                          event.isHomePlayer &&
                          item.playerId == event.playerId;

                      Widget content = Container(
                          width: 28.w,
                          height: 36.w,
                          decoration: BoxDecoration(
                            // color: active ? AppColors.cD60D20 : AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          margin: EdgeInsets.only(right: 4.w),
                          child: ImageWidget(
                            url: Utils.getPlayUrl(item.playerId),
                            imageFailedPath: Assets.iconUiDefault04,
                            borderRadius: BorderRadius.circular(4.w),
                          ));
                      if (active) {
                        content = MarkAnimationWidget(
                          height: 44.w,
                          end: 8.w,
                          duration: const Duration(milliseconds: 300),
                          child: Center(child: content),
                        );
                      }
                      return content;
                    }),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(5, (index) {
                      var list = controller.getAwayTeamPlayerList();
                      var item = list[index];
                      var active = event != null &&
                          !event.isHomePlayer &&
                          item.playerId == event.playerId;
                      Widget content = Container(
                          width: 28.w,
                          height: 36.w,
                          decoration: BoxDecoration(
                            // color: active ? AppColors.c1F8FE5 : AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          margin: EdgeInsets.only(right: 4.w),
                          child: ImageWidget(
                            url: Utils.getPlayUrl(item.playerId),
                            imageFailedPath: Assets.iconUiDefault04,
                            borderRadius: BorderRadius.circular(4.w),
                          ));
                      if (active) {
                        content = MarkAnimationWidget(
                          height: 44.w,
                          end: 8.w,
                          duration: const Duration(milliseconds: 300),
                          child: Center(child: content),
                        );
                      }
                      return content;
                    }),
                  ),
                ),
                16.hGap,
              ],
            ),
          );
        });
  }

  SizedBox buildBasketballCourt(BuildContext context) {
    return SizedBox(
      height: 156.w,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          //球场整行的宽高
          Positioned(
            top: 0.w,
            left: 9.w,
            right: 9.w,
            child: Stack(
              children: [
                //球场容器
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 38.w),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ///球场
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Assets.managerUiManagerCourt,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Expanded(
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..scale(-1.0, 1.0),
                                    child: Image.asset(
                                      Assets.managerUiManagerCourt,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //球员投篮位置，是否投中
                            ...List.generate(controller.shootHistory.length,
                                (index) {
                              var item = controller.shootHistory[index];
                              Color color = item.isAway
                                  ? AppColors.c1F8FE5
                                  : AppColors.cD60D20;
                              return Positioned(
                                  top: item.shootLocation.dy - 20.w / 2,
                                  right: item.shootLocation.dx - 20.w / 2,
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..rotateX(pi / 3),
                                    child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                          color: item.isSuccess ? color : null,
                                          border: Border.all(
                                              color: color, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10.w)),
                                    ),
                                  ));
                            }),
                            //比赛开始倒计时
                            StartGameCountDownWidget(
                              onStart: () {
                                controller.checkShowDialog();
                              },
                              onDown: () {
                                controller.startGame();
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                // 主角指示器
                GetBuilder<TeamBattleV2Controller>(
                    id: TeamBattleV2Controller.idPlayersLocation,
                    builder: (logic) {
                      if (controller.mainOffset == null) {
                        return const SizedBox.shrink();
                      }
                      var last = controller.mainOffset!;
                      return Positioned(
                          top: last.shootLocation.dy - 20.w - 7.w + 38.w,
                          right: last.shootLocation.dx - 12.w,
                          child: MarkAnimationWidget(
                            child: Icon(
                              Icons.location_on_rounded,
                              color: last.isAway
                                  ? AppColors.c1F8FE5
                                  : AppColors.cD60D20,
                            ),
                          ));
                    }),
                // 篮球
                //  左边篮筐位置 top: 49.w,left: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,left: 125.w,
                //
                //  右边篮筐位置 top: 49.w,right: 22.w,
                //  左边Y轴中点三分位置：top: 73.w,right: 125.w,
                Obx(() {
                  return Positioned(
                      top: controller.shootOffset.value.dy,
                      right: controller.shootOffset.value.dx,
                      child: Opacity(
                        opacity: controller.isSecondAnimationRunning
                            ? (1 - controller.shootAnimation?.value).toDouble()
                            : 1,
                        child: IconWidget(
                            iconWidth: 6.w, icon: Assets.teamUiTrainingBall),
                      ));
                })
              ],
            ),
          ),
          //普通弹幕
          // Positioned(
          //   top: 0,
          //   width: MediaQuery.of(context).size.width,
          //   height: 45.w,
          //   child: BarrageWall(
          //     width: MediaQuery.of(context).size.width,
          //     height: 45.w,
          //     controller: controller.normalBarrageWallController,
          //     child: Container(),
          //   ),
          // ),
          //高光时刻弹幕
          Positioned(
            bottom: 5.w,
            width: MediaQuery.of(context).size.width,
            height: 30.w,
            child: BarrageWall(
              width: MediaQuery.of(context).size.width,
              height: 30.w,
              controller: controller.highLightBarrageWallController,
              child: Container(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 101.w,
      margin: EdgeInsets.only(bottom: 9.w),
      decoration: BoxDecoration(color: AppColors.cFFFFFF, boxShadow: [
        BoxShadow(
            color: AppColors.cDEDEDE,
            offset: Offset(0, 9.w),
            blurRadius: 9.w,
            spreadRadius: -5.w)
      ]),
      child: Column(
        children: [
          12.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              children: [
                16.hGap,
                ImageWidget(
                  url: Utils.getTeamUrl(
                      teamBattleController.battleEntity.homeTeam.teamLogo),
                  imageFailedPath: Assets.teamUiHead01,
                  width: 36.w,
                  borderRadius: BorderRadius.circular(18.w),
                ),
                10.hGap,
                Container(
                  width: 45.w,
                  alignment: Alignment.centerLeft,
                  child: GetBuilder<TeamBattleV2Controller>(
                      id: TeamBattleV2Controller.idGameScore,
                      builder: (_) {
                        int score = 0;
                        if (controller.getQuarterEvents().isNotEmpty) {
                          score = controller.getQuarterEvents().last.homeScore;
                        }
                        return AnimatedNum(
                          number: score,
                          milliseconds: 300,
                          textStyle: 24.w7(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold),
                        );
                      }),
                ),
                Expanded(child: Center(
                  child: Obx(() {
                    return Text(
                      "${Utils.getSortWithInt(controller.quarter.value)} ${MyDateUtils.formatMS((controller.quarterGameCountDown.value / 40 * 12 * 60).toInt())}",
                      style: 12.w4(
                          color: AppColors.c10A86A,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular),
                    );
                  }),
                )),
                Container(
                  width: 45.w,
                  alignment: Alignment.centerRight,
                  child: GetBuilder<TeamBattleV2Controller>(
                      id: TeamBattleV2Controller.idGameScore,
                      builder: (_) {
                        int score = 0;
                        if (controller.getQuarterEvents().isNotEmpty) {
                          score = controller.getQuarterEvents().last.awayScore;
                        }
                        return AnimatedNum(
                          number: score,
                          milliseconds: 300,
                          textStyle: 24.w7(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold),
                        );
                      }),
                ),
                10.hGap,
                ImageWidget(
                  url: Utils.getTeamUrl(
                      teamBattleController.battleEntity.awayTeam.teamLogo),
                  imageFailedPath: Assets.teamUiHead03,
                  width: 36.w,
                  borderRadius: BorderRadius.circular(18.w),
                ),
                16.hGap,
              ],
            ),
          ),
          5.vGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 68.w,
                    child: Center(
                      child: Text(
                        teamBattleController.battleEntity.homeTeam.teamName,
                        style: 12.w5(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                  5.vGap,
                  Container(
                    width: 68.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 68.w *
                            teamBattleController.battleEntity.homeTeamReadiness,
                        height: 6.w,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                          AppColors.cB3B3B3,
                          AppColors.c000000
                        ])),
                      ),
                    ),
                  ),
                  4.vGap,
                  SizedBox(
                    width: 68.w,
                    child: Center(
                      child: Text(
                        "POW:${teamBattleController.battleEntity.homeTeam.currTeamStrength}",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Obx(() {
                  return AnimatedOpacity(
                    opacity: controller.showBuff.value ? 1 : 0,
                    duration: const Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        6.hGap,
                        IconWidget(
                          iconWidth: 6.w,
                          icon: Assets.commonUiCommonIconSystemArrow,
                          rotateAngle: controller.getBuffAngle(
                              teamBattleController
                                  .battleEntity.homeTeam.teamId),
                          iconColor: controller.getBuffColor(
                              teamBattleController
                                  .battleEntity.homeTeam.teamId),
                        ),
                        3.hGap,
                        Text(
                            controller.getBuff(teamBattleController
                                .battleEntity.homeTeam.teamId),
                            style: 12.w4(
                                color: controller.getBuffColor(
                                    teamBattleController
                                        .battleEntity.homeTeam.teamId),
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular))
                      ],
                    ),
                  );
                }),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 68.w,
                    child: Center(
                      child: Text(
                        teamBattleController.battleEntity.awayTeam.teamName,
                        style: 12.w5(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                  5.vGap,
                  Container(
                    width: 68.w,
                    height: 6.w,
                    decoration: BoxDecoration(
                        color: AppColors.c000000,
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 68.w *
                            teamBattleController.battleEntity.awayTeamReadiness,
                        height: 6.w,
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: AppColors.cFFFFFF, width: 1)),
                            gradient: LinearGradient(colors: [
                              AppColors.c022A1D,
                              AppColors.c23E8A9
                            ])),
                      ),
                    ),
                  ),
                  4.vGap,
                  SizedBox(
                    width: 68.w,
                    child: Center(
                      child: Text(
                        "POW:${teamBattleController.battleEntity.awayTeam.currTeamStrength}",
                        style: 10.w4(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 50.w,
                child: Obx(() {
                  return AnimatedOpacity(
                    opacity: controller.showBuff.value ? 1 : 0,
                    duration: const Duration(milliseconds: 1000),
                    child: Row(
                      children: [
                        6.hGap,
                        IconWidget(
                          iconWidth: 6.w,
                          icon: Assets.commonUiCommonIconSystemArrow,
                          rotateAngle: controller.getBuffAngle(
                              teamBattleController
                                  .battleEntity.awayTeam.teamId),
                          iconColor: controller.getBuffColor(
                              teamBattleController
                                  .battleEntity.awayTeam.teamId),
                        ),
                        3.hGap,
                        Text(
                            controller.getBuff(teamBattleController
                                .battleEntity.awayTeam.teamId),
                            style: 12.w4(
                                color: controller.getBuffColor(
                                    teamBattleController
                                        .battleEntity.awayTeam.teamId),
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular))
                      ],
                    ),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
