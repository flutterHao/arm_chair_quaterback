import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/12/17:24

class GameHeaderWidget extends GetView<TeamBattleV2Controller> {
  const GameHeaderWidget(this.teamBattleController, {super.key});

  final TeamBattleController teamBattleController;

  @override
  Widget build(BuildContext context) {
    var homeInfo = Column(
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
              border: Border.all(color: AppColors.c666666, width: 1.w),
              borderRadius: BorderRadius.circular(3.w)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: GetBuilder<TeamBattleV2Controller>(
                id: TeamBattleV2Controller.idReadiness,
                builder: (logic) {
                  var events = controller.getQuarterEvents();
                  GameEvent? event = events.isEmpty ? null : events.last;

                  double value = event == null
                      ? teamBattleController.battleEntity.homeTeamReadiness
                      : event.pkEventUpdatedEntity.homePreparationLevel;
                  print('home pre value:$value');
                  return _buildPrePercentWidget(value);
                }),
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
    );
    return Container(
      height: 101.w,
      margin: EdgeInsets.only(bottom: 1.w),
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.w),
                      border: Border.all(color: AppColors.c1F8FE5, width: 1.w)),
                  child: ImageWidget(
                    url: Utils.getTeamUrl(
                        teamBattleController.battleEntity.homeTeam.teamLogo),
                    imageFailedPath: Assets.teamUiHead01,
                    width: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
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
                        if (controller.isGameOver.value) {
                          score = controller.pkResultUpdatedEntity
                                  ?.homeTeamResult.score ??
                              controller.getQuarterEvents().last.homeScore;
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
                    var text =
                        "${Utils.getSortWithInt(controller.quarter.value)} ${MyDateUtils.formatMS((controller.quarterGameCountDown.value / 40 * 12 * 60).toInt())}";
                    if (!controller.isGameStart.value) {
                      return Text(
                        "VS",
                        style: 21.w5(
                            color: AppColors.cB3B3B3,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      );
                    }
                    return Text(
                      text,
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
                        if (controller.isGameOver.value) {
                          score = controller.pkResultUpdatedEntity
                                  ?.awayTeamResult.score ??
                              controller.getQuarterEvents().last.awayScore;
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.w),
                      border: Border.all(color: AppColors.cD60D20, width: 1.w)),
                  child: ImageWidget(
                    url: Utils.getTeamUrl(
                        teamBattleController.battleEntity.awayTeam.teamLogo),
                    imageFailedPath: Assets.teamUiHead03,
                    width: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                ),
                16.hGap,
              ],
            ),
          ),
          5.vGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50.w,
              ),
              homeInfo,
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(opacity: 0, child: homeInfo),
                    Positioned(
                        top: 0,
                        child: Obx(() {
                          if (!controller.isGameStart.value ||
                              controller.isGameOver.value) {
                            return const SizedBox.shrink();
                          }
                          return MtInkwell(
                            onTap: () {
                              controller.jumpGame();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "SKIP",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.c000000,
                                      fontSize: 12.sp,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                                5.hGap,
                                IconWidget(
                                  iconWidth: 5.w,
                                  icon: Assets.commonUiCommonIconSystemJumpto,
                                  iconColor: AppColors.c000000,
                                )
                              ],
                            ),
                          );
                        })),
                    Obx(() {
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
                            SizedBox(
                              width: 35.w,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    controller.getBuff(teamBattleController
                                        .battleEntity.homeTeam.teamId),
                                    style: 12.w4(
                                        color: controller.getBuffColor(
                                            teamBattleController
                                                .battleEntity.homeTeam.teamId),
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular)),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
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
                        border:
                            Border.all(color: AppColors.c666666, width: 1.w),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GetBuilder<TeamBattleV2Controller>(
                          id: TeamBattleV2Controller.idReadiness,
                          builder: (logic) {
                            var events = controller.getQuarterEvents();
                            GameEvent? event =
                                events.isEmpty ? null : events.last;

                            double value = event == null
                                ? teamBattleController
                                    .battleEntity.awayTeamReadiness
                                : event
                                    .pkEventUpdatedEntity.awayPreparationLevel;
                            print('away pre value:$value');
                            return _buildPrePercentWidget(value);
                          }),
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
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Opacity(opacity: 0, child: homeInfo),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(
                              width: 35.w,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    controller.getBuff(teamBattleController
                                        .battleEntity.awayTeam.teamId),
                                    style: 12.w4(
                                        color: controller.getBuffColor(
                                            teamBattleController
                                                .battleEntity.awayTeam.teamId),
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular)),
                              ),
                            )
                          ],
                        ),
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

  Stack _buildPrePercentWidget(double value) {
    var firstMaxValue = 1.44;
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 68.w * (min(firstMaxValue, value) / firstMaxValue),
          height: 6.w,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.cB3B3B3, AppColors.c000000])),
        ),
        if (value > firstMaxValue)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.rotate(
                angle: pi / 180 * 180,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 68.w * ((value - firstMaxValue) / 0.06),
                  height: 6.w,
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: AppColors.cFFFFFF, width: 1)),
                    color: AppColors.c10A86A,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
