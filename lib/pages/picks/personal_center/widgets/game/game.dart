import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_background.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/14/10:02

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late PersonalCenterController controller;

  EasyAnimationController? easyAnimationController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalCenterController>(
        id: PersonalCenterController.idPersonalCenterGameMain,
        builder: (c) {
          controller = c;
          easyAnimationController ??= EasyAnimationController(
              vsync: this,
              begin: 0,
              end: 1,
              duration: const Duration(milliseconds: 500));
          easyAnimationController?.forward(from: 0);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(top: 16.w),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 306.w,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: 18.w,
                                        height: 18.w,
                                        margin: EdgeInsets.only(
                                            top: 9.w, right: 9.w),
                                        child: IconWidget(
                                          iconWidth: 18.w,
                                          icon: Assets.uiIconEyesPng,
                                          iconColor: AppColors.c666666,
                                        )),
                                  ],
                                ),
                                5.vGap,
                                InkWell(
                                  onTap: () {
                                    _showLevelDetailDialog(context);
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Obx(() {
                                        var p = (controller
                                                    .teamInfoEntity?.teamExp ??
                                                0) /
                                            double.parse(
                                                controller.nextLevelTotalExp!) *
                                            180;
                                        p = easyAnimationController
                                                ?.value.value *
                                            p;
                                        return ArcWidget(
                                          85.w,
                                          borderColor: AppColors.c666666,
                                          progressColor: AppColors.cFF7954,
                                          progressWidth: 16,
                                          progressSweepAngle: p,
                                          borderWidth: 16,
                                        );
                                      }),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "${controller.teamInfoEntity?.teamGrade ?? 0}",
                                            style: 42.w7(
                                                color: AppColors.cFF7954,
                                                height: 1),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "TEAM LEVEL",
                                                style: 12.w7(
                                                    color: AppColors.c666666,
                                                    height: 1),
                                              ),
                                              3.hGap,
                                              IconWidget(
                                                iconWidth: 12.w,
                                                icon: Assets.uiIconMsg_02Png,
                                                iconColor: AppColors.c666666,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${controller.teamInfoEntity?.teamExp ?? 0}/${controller.nextLevelTotalExp ?? 0}",
                                            style:
                                                10.w4(color: AppColors.c666666),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                24.vGap,
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: const Divider(
                                      height: 1,
                                      color: AppColors.c666666,
                                    )),
                                Container(
                                  height: 46.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      IconWidget(
                                        iconWidth: 18.w,
                                        icon: Assets.uiIconWinPng,
                                        iconColor: AppColors.cFF7954,
                                      ),
                                      10.hGap,
                                      Expanded(
                                          child: Text(
                                        "Win rate",
                                        style: 12.w4(color: AppColors.c666666),
                                      )),
                                      Text(
                                        "${controller.teamInfoEntity?.gameWinRate.toStringAsFixed(0) ?? 0}%",
                                        style: 16.w7(color: AppColors.cFFFFFF),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: const Divider(
                                      height: 1,
                                      color: AppColors.c666666,
                                    )),
                                Container(
                                  height: 46.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      IconWidget(
                                        iconWidth: 18.w,
                                        icon: Assets.uiIconScorePng,
                                        iconColor: AppColors.cFF7954,
                                      ),
                                      10.hGap,
                                      Expanded(
                                          child: Text(
                                        "Top score",
                                        style: 12.w4(color: AppColors.c666666),
                                      )),
                                      Text(
                                        "${controller.teamInfoEntity?.currentWinGames ?? 0}",
                                        style: 16.w7(color: AppColors.cFFFFFF),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: const Divider(
                                      height: 1,
                                      color: AppColors.c666666,
                                    )),
                                Container(
                                  height: 46.w,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Row(
                                    children: [
                                      IconWidget(
                                        iconWidth: 18.w,
                                        icon: Assets.uiIconWinningPng,
                                        iconColor: AppColors.cFF7954,
                                      ),
                                      10.hGap,
                                      Expanded(
                                          child: Text(
                                        "Winning streak",
                                        style: 12.w4(color: AppColors.c666666),
                                      )),
                                      Text(
                                        "${controller.teamInfoEntity?.maxGameWinningStreak}",
                                        style: 16.w7(color: AppColors.cFFFFFF),
                                      )
                                    ],
                                  ),
                                ),
                                14.vGap
                              ],
                            ),
                          ),
                        ),
                        8.hGap,
                        Flexible(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  height: 84.w,
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 16.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.c262626,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Utils.formatMoney(controller
                                                    .teamInfoEntity?.salary ??
                                                0),
                                            style: 16.w7(
                                                color: AppColors.cFFFFFF,
                                                height: 1),
                                          ),
                                          8.hGap,
                                          Text(
                                            "/${Utils.formatMoney(double.parse(controller.salaryCap ?? "0"))}",
                                            style: 10.w4(
                                                color: AppColors.c666666,
                                                height: 1),
                                          )
                                        ],
                                      ),
                                      7.vGap,
                                      LinearProgressIndicator(
                                        color: AppColors.cB3B3B3,
                                        value: 0.8,
                                        minHeight: 4.w,
                                        backgroundColor: AppColors.c666666,
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                      ),
                                      15.vGap,
                                      Text(
                                        "Salary",
                                        style: 12.w4(
                                            color: AppColors.c666666,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                ),
                                9.vGap,
                                Expanded(
                                    child: Container(
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 16.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.c262626,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconWidget(
                                          iconWidth: 40.w,
                                          icon: Assets.uiIconTrophy_01Png),
                                      28.vGap,
                                      Text(
                                        "${controller.teamInfoEntity?.cup ?? 0}",
                                        style: 21.w7(
                                            color: AppColors.cFFFFFF,
                                            height: 1),
                                      ),
                                      9.vGap,
                                      Text(
                                        "Current",
                                        style: 12.w4(color: AppColors.c666666),
                                      ),
                                      20.vGap,
                                      Text(
                                        "${controller.teamInfoEntity?.maxCup ?? 0}",
                                        style: 21.w7(
                                            color: AppColors.cFFFFFF,
                                            height: 1),
                                      ),
                                      9.vGap,
                                      Text(
                                        "Highest",
                                        style: 12.w4(color: AppColors.c666666),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ))
                      ],
                    ),
                  ),
                  33.vGap,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Main",
                          style: 19.w7(color: AppColors.c262626, height: 1),
                        ),
                        8.hGap,
                        Expanded(
                            child: Text(
                          "expend more stamina",
                          style: 10.w4(color: AppColors.c666666, height: 1),
                        )),
                        SizedBox(
                          width: 18.w,
                          height: 18.w,
                          child: IconWidget(
                            iconWidth: 18.w,
                            icon: Assets.uiIconEyesPng,
                            iconColor: AppColors.cB3B3B3,
                          ),
                        )
                      ],
                    ),
                  ),
                  ...List.generate(controller.teamPlayers.length, (index) {
                    TeamInfo player = controller.teamPlayers[index];
                    return Container(
                      margin: EdgeInsets.only(top: 13.w, right: 16.w),
                      height: 84.w,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          if (!player.teamPlayerEntity.isSubstitute())
                            Container(
                              height: 84.w,
                              width: 40.w,
                              color: AppColors.c3B93FF,
                              alignment: Alignment.centerLeft,
                              child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    player.teamPlayerEntity.getPosition(),
                                    textAlign: TextAlign.center,
                                    style: 21.w7(
                                        color: AppColors.c2170D2, height: 1),
                                  )),
                            ),
                          Container(
                            height: 84.w,
                            margin: EdgeInsets.only(left: 16.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Row(
                              children: [
                                10.hGap,
                                PlayerAwater(
                                  player: player.teamPlayerEntity,
                                  backgroudColor: AppColors.cE1E1E1,
                                ),
                                4.hGap,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 12.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.c000000
                                                  .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(6.w)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Score",
                                                style: 10.w4(
                                                    color: AppColors.cB3B3B3,
                                                    height: 1),
                                              ),
                                              8.hGap,
                                              Text(
                                                "${player.baseInfo.playerScore}",
                                                style: 10.w4(
                                                    color: AppColors.c262626,
                                                    height: 1),
                                              )
                                            ],
                                          ),
                                        ),
                                        4.hGap,
                                        Container(
                                          height: 12.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          decoration: BoxDecoration(
                                              color: AppColors.c000000
                                                  .withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(6.w)),
                                          child: Row(
                                            children: [
                                              Text(
                                                "SAL",
                                                style: 10.w4(
                                                    color: AppColors.cB3B3B3,
                                                    height: 1),
                                              ),
                                              8.hGap,
                                              Text(
                                                "${player.baseInfo.salary}",
                                                style: 10.w4(
                                                    color: AppColors.c262626,
                                                    height: 1),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    6.vGap,
                                    Container(
                                        margin: EdgeInsets.only(left: 6.w),
                                        child: Text(
                                          player.baseInfo.ename,
                                          style:
                                              16.w4(color: AppColors.c262626),
                                        )),
                                    6.vGap,
                                    Container(
                                      margin: EdgeInsets.only(left: 6.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 12.w,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: AppColors.c666666,
                                                borderRadius:
                                                    BorderRadius.circular(2.w)),
                                            child: Text(
                                              player.baseInfo.position,
                                              style: 10.w7(
                                                  color: AppColors.cF2F2F2,
                                                  height: 1),
                                            ),
                                          ),
                                          6.hGap,

                                          ///todo 后段缺少状态字段
                                          // IconWidget(
                                          //     iconWidth: 12.w,
                                          //     icon: Assets.uiStateBestPng)
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  100.vGap
                ],
              ),
            ),
          );
        });
  }

  void _showLevelDetailDialog(BuildContext context) {
    showModalBottomSheet(
        context: Get.context!,
        isScrollControlled: true,
        builder: (context) {
          Future.delayed(const Duration(milliseconds: 200),(){
            easyAnimationController?.forward(from: 0);
          });
          return SizedBox(
            height: 675.h,
            child: DialogBackground(
                frontColor: AppColors.cE6E6E6,
                child: Column(
                  children: [
                    12.vGap,
                    Container(
                      width: 64.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                          color: AppColors.cB3B3B3,
                          borderRadius: BorderRadius.circular(2.w)),
                    ),
                    24.vGap,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            height: 148.w,
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 104.w,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Obx(() {
                                    var p =
                                        (controller.teamInfoEntity?.teamExp ??
                                                0) /
                                            double.parse(
                                                controller.nextLevelTotalExp!) *
                                            180;
                                    p = easyAnimationController?.value.value *
                                        p;
                                    return ArcWidget(
                                      85.w,
                                      borderColor: AppColors.ccccccc,
                                      progressColor: AppColors.cFF7954,
                                      progressWidth: 16,
                                      progressSweepAngle: p,
                                      borderWidth: 16,
                                    );
                                  }),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${controller.teamInfoEntity?.teamGrade ?? 0}",
                                        style: 42.w7(
                                            color: AppColors.cFF7954,
                                            height: 1),
                                      ),
                                      Text(
                                        "TEAM LEVEL",
                                        style: 12.w7(
                                            color: AppColors.c666666,
                                            height: 1),
                                      ),
                                      Text(
                                        "${controller.teamInfoEntity?.teamExp ?? 0}/${controller.nextLevelTotalExp}",
                                        style: 10.w4(color: AppColors.c666666),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          16.vGap,
                          Row(
                            children: [
                              Text(
                                "Next stage (lv.${controller.nextLevelRuleConfig?.grade??0})",
                                style:
                                    16.w7(color: AppColors.c262626, height: 1),
                              ),
                            ],
                          ),
                          9.vGap,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            height: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 40.w,
                                      icon: Assets.uiIconCapsPng,
                                    ),
                                    Text(
                                      "Salary caps",
                                      style: 10.w4(color: AppColors.cB3B3B3),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${controller.currentLevelRuleConfig?.salaryCap??0}",
                                      style: 18.w7(color: AppColors.cB3B3B3),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // SizedBox(
                                          //   width: 30.w,
                                          //   height: 12.w,
                                          // ),
                                          Positioned(
                                              left: -2.w,
                                              right: 0,
                                              child: IconWidget(
                                                iconWidth: 7.w,
                                                icon: Assets.uiIconArrows_01Png,
                                                iconColor: AppColors.c1BC27D,
                                              )),
                                          Positioned(
                                              left: 6.w,
                                              right: 0,
                                              child: IconWidget(
                                                iconWidth: 7.w,
                                                icon: Assets.uiIconArrows_01Png,
                                                iconColor: AppColors.c1BC27D,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "${controller.nextLevelRuleConfig?.salaryCap??0}",
                                      style: 18.w7(color: AppColors.c1BC27D),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          9.vGap,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            height: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 40.w,
                                      icon: Assets.uiIconPlayerPng,
                                    ),
                                    Text(
                                      "Bench player",
                                      style: 10.w4(color: AppColors.cB3B3B3),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "56%",//todo
                                      style: 18.w7(color: AppColors.cB3B3B3),
                                    ),
                                    SizedBox(
                                      width: 30.w,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // SizedBox(
                                          //   width: 30.w,
                                          //   height: 12.w,
                                          // ),
                                          Positioned(
                                              left: -2.w,
                                              right: 0,
                                              child: IconWidget(
                                                iconWidth: 7.w,
                                                icon: Assets.uiIconArrows_01Png,
                                                iconColor: AppColors.c1BC27D,
                                              )),
                                          Positioned(
                                              left: 6.w,
                                              right: 0,
                                              child: IconWidget(
                                                iconWidth: 7.w,
                                                icon: Assets.uiIconArrows_01Png,
                                                iconColor: AppColors.c1BC27D,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "60%",//todo
                                      style: 18.w7(color: AppColors.c1BC27D),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          9.vGap,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            height: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 40.w,
                                      icon: Assets.uiIconCapsPng,
                                    ),
                                    Text(
                                      "Salary caps",
                                      style: 10.w4(color: AppColors.cB3B3B3),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 24.w,
                                  width: 44.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.cE41033,
                                      borderRadius: BorderRadius.circular(6.w)),
                                  child: Text(
                                    "new",//todo
                                    style: 16.w7(
                                        color: AppColors.cFFFFFF, height: 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                          9.vGap,
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
