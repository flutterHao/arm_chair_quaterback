import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/training_new_widget.dart';
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
          width: 118.w,
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
        // 10.vGap,
        // SizedBox(
        //   width: 118.w,
        //   child: Center(
        //     child: SizedBox(
        //       width: 76.w,
        //       child: GetBuilder<TeamBattleV2Controller>(
        //           id: TeamBattleV2Controller.idReadiness,
        //           builder: (logic) {
        //             var events = controller.getQuarterEvents();
        //             GameEvent? event = events.isEmpty ? null : events.last;
        //
        //             double value = event == null
        //                 ? teamBattleController
        //                     .pkStartUpdatedEntity!.homeTeamStrength
        //                 : event.pkEventUpdatedEntity.homeCurrentStrength;
        //             return PreparationWidget(playerReadiness: value);
        //           }),
        //     ),
        //   ),
        // ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(4.5.w),
        //   child: SizedBox(
        //     width: 118.w,
        //     height: 9.w,
        //     child: Align(
        //       alignment: Alignment.centerLeft,
        //       child: GetBuilder<TeamBattleV2Controller>(
        //           id: TeamBattleV2Controller.idReadiness,
        //           builder: (logic) {
        //             var events = controller.getQuarterEvents();
        //             GameEvent? event = events.isEmpty ? null : events.last;
        //
        //             double value = event == null
        //                 ? teamBattleController
        //                     .pkStartUpdatedEntity!.homeTeamStrength
        //                 : event.pkEventUpdatedEntity.homeCurrentStrength;
        //             return _buildPrePercentWidget(value);
        //           }),
        //     ),
        //   ),
        // ),
        // 7.vGap,
        // SizedBox(
        //   width: 118.w,
        //   child: Center(
        //     child: FittedBox(
        //       fit: BoxFit.scaleDown,
        //       child: Text(
        //         "POWER ${teamBattleController.battleEntity.homeTeam.currTeamStrength}",
        //         style: 12.w4(
        //           color: AppColors.c000000,
        //           height: 1,
        //           fontFamily: FontFamily.fOswaldRegular,
        //         ),
        //       ),
        //     ),
        //   ),
        // )
        // SizedBox(
        //   width: 118.w,
        //   child: Obx(() {
        //     var value2 = controller.showBuff.value;
        //     var buff = controller
        //         .getBuff(teamBattleController.battleEntity.homeTeam.teamId);
        //     if (buff == 0) {
        //       return const SizedBox.shrink();
        //     }
        //     return AnimatedOpacity(
        //       opacity: value2 ? 1 : 0,
        //       duration: const Duration(milliseconds: 1000),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           6.hGap,
        //           IconWidget(
        //             iconWidth: 6.w,
        //             icon: Assets.commonUiCommonIconSystemArrow,
        //             rotateAngle: controller.getBuffAngle(
        //                 teamBattleController.battleEntity.homeTeam.teamId),
        //             iconColor: controller.getBuffColor(
        //                 teamBattleController.battleEntity.homeTeam.teamId),
        //           ),
        //           1.hGap,
        //           SizedBox(
        //             width: 35.w,
        //             child: FittedBox(
        //               fit: BoxFit.scaleDown,
        //               child: Text("${buff > 0 ? "+" : "-"}$buff",
        //                   style: 12.w4(
        //                       color: controller.getBuffColor(
        //                           teamBattleController
        //                               .battleEntity.homeTeam.teamId),
        //                       height: 1,
        //                       fontFamily: FontFamily.fRobotoRegular)),
        //             ),
        //           )
        //         ],
        //       ),
        //     );
        //   }),
        // ),
      ],
    );
    return Container(
      height: 90.w,
      margin: EdgeInsets.only(bottom: 1.w),
      decoration: BoxDecoration(color: AppColors.cFFFFFF, boxShadow: [
        BoxShadow(
            color: AppColors.cDEDEDE,
            offset: Offset(0, 9.w),
            blurRadius: 9.w,
            spreadRadius: -5.w)
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                    url: Utils.getAvatarUrl(
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
                    if (controller.isGameOver.value) {
                      return Text(
                        LangKey.scoreTipsFinal.tr,
                        style: 12.w4(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fRobotoRegular),
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
                    url: Utils.getAvatarUrl(
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
          10.vGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.hGap,
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
                          return MtInkWell(
                            onTap: () {
                              controller.jumpGame();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  LangKey.gameButtonSkip.tr,
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
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 118.w,
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
                  // 10.vGap,
                  // SizedBox(
                  //   width: 118.w,
                  //   child: Center(
                  //     child: SizedBox(
                  //       width: 76.w,
                  //       child: GetBuilder<TeamBattleV2Controller>(
                  //           id: TeamBattleV2Controller.idReadiness,
                  //           builder: (logic) {
                  //             var events = controller.getQuarterEvents();
                  //             GameEvent? event =
                  //                 events.isEmpty ? null : events.last;
                  //
                  //             double value = event == null
                  //                 ? teamBattleController
                  //                     .pkStartUpdatedEntity!.awayTeamStrength
                  //                 : event
                  //                     .pkEventUpdatedEntity.awayCurrentStrength;
                  //             return PreparationWidget(playerReadiness: value);
                  //           }),
                  //     ),
                  //   ),
                  // ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(4.5.w),
                  //   child: SizedBox(
                  //     width: 118.w,
                  //     height: 9.w,
                  //     child: GetBuilder<TeamBattleV2Controller>(
                  //         id: TeamBattleV2Controller.idReadiness,
                  //         builder: (logic) {
                  //           var events = controller.getQuarterEvents();
                  //           GameEvent? event =
                  //               events.isEmpty ? null : events.last;
                  //
                  //           double value = event == null
                  //               ? teamBattleController
                  //                   .pkStartUpdatedEntity!.awayTeamStrength
                  //               : event
                  //                   .pkEventUpdatedEntity.awayCurrentStrength;
                  //           return _buildPrePercentWidget(value);
                  //         }),
                  //   ),
                  // ),
                  // 7.vGap,
                  // SizedBox(
                  //   width: 118.w,
                  //   child: Center(
                  //     child: FittedBox(
                  //       fit: BoxFit.scaleDown,
                  //       child: Text(
                  //         "POWER ${teamBattleController.battleEntity.awayTeam.currTeamStrength}",
                  //         style: 12.w4(
                  //           color: AppColors.c000000,
                  //           height: 1,
                  //           fontFamily: FontFamily.fOswaldRegular,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                  // SizedBox(
                  //   width: 118.w,
                  //   child: Obx(() {
                  //     var value2 = controller.showBuff.value;
                  //     var buff = controller.getBuff(
                  //         teamBattleController.battleEntity.awayTeam.teamId);
                  //     if (buff == 0) {
                  //       return const SizedBox.shrink();
                  //     }
                  //     return AnimatedOpacity(
                  //       opacity: value2 ? 1 : 0,
                  //       duration: const Duration(milliseconds: 1000),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           6.hGap,
                  //           IconWidget(
                  //             iconWidth: 6.w,
                  //             icon: Assets.commonUiCommonIconSystemArrow,
                  //             rotateAngle: controller.getBuffAngle(
                  //                 teamBattleController
                  //                     .battleEntity.awayTeam.teamId),
                  //             iconColor: controller.getBuffColor(
                  //                 teamBattleController
                  //                     .battleEntity.awayTeam.teamId),
                  //           ),
                  //           1.hGap,
                  //           SizedBox(
                  //             width: 35.w,
                  //             child: FittedBox(
                  //               fit: BoxFit.scaleDown,
                  //               child: Text("${buff > 0 ? "+" : "-"}$buff",
                  //                   style: 12.w4(
                  //                       color: controller.getBuffColor(
                  //                           teamBattleController
                  //                               .battleEntity.awayTeam.teamId),
                  //                       height: 1,
                  //                       fontFamily: FontFamily.fRobotoRegular)),
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   }),
                  // ),
                ],
              ),
              24.hGap,
            ],
          )
        ],
      ),
    );
  }

  Stack _buildPrePercentWidget(double v) {
    print('value:$v');
    double value = max(0, v);
    var firstMaxValue = 1.44;
    var secondMaxValue = 0.06;
    return Stack(
      children: [
        Container(
          width: 118.w,
          height: 7.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.c666666, width: 1.w),
            borderRadius: BorderRadius.circular(4.5.w),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 118.w * min(1, (value / firstMaxValue)),
              height: 7.w,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(3.5.w)),
                  gradient: const LinearGradient(
                      colors: [AppColors.cB3B3B3, AppColors.c000000])),
            ),
          ),
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
                  width: 118.w *
                      (min(secondMaxValue, (value - firstMaxValue)) /
                          secondMaxValue),
                  height: 7.w,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(3.5.w)),
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
