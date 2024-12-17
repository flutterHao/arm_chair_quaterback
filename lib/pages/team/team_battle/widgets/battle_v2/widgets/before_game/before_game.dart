import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/common/widgets/heartbeat.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/before_game/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_court.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_header.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_players.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_score_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/win_rate_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/12/17:21

class BeforeGameWidget extends GetView<BeforeGameController> {
  const BeforeGameWidget(this.header,this.teamBattleController, this.teamBattleV2Controller,
      {super.key});

  final Widget header;
  final TeamBattleController teamBattleController;

  final TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeforeGameController>(
        init: BeforeGameController(context),
        builder: (_) {
          return SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                header,
                Obx(() {
                  return Positioned(
                      top: 101.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: GameCourtWidget(
                            /// 修改为true显示倒计时
                            needCountDown: controller.startCountDown.value,
                          )));
                }),

                /// 卡牌比较输赢结果
                Positioned(
                    top: 101.w + 53.w,
                    left: 0,
                    right: 0,
                    child: Obx(() {
                      return AnimatedOpacity(
                        opacity: controller.showTacticResult.value ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Center(
                          child: Container(
                            width: 280.w,
                            height: 55.w,
                            decoration: BoxDecoration(
                                color: AppColors.cFFFFFF,
                                borderRadius: BorderRadius.circular(9.w)),
                            child: Row(
                              children: [
                                28.hGap,
                                Stack(
                                  children: [
                                    IconWidget(
                                      iconWidth: 22.w,
                                      icon: Assets.managerUiManagerTacticsArrow,
                                      iconColor: controller.isHomeWin()
                                          ? AppColors.c10A86A
                                          : AppColors.cD60D20,
                                      rotateAngle:
                                          controller.isHomeWin() ? 0 : 180,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 21.w, top: 14.w),
                                      child: IconWidget(
                                        iconWidth: 12.w,
                                        icon:
                                            Assets.managerUiManagerTacticsArrow,
                                        iconColor: controller.isHomeWin()
                                            ? AppColors.c10A86A
                                            : AppColors.cD60D20,
                                        rotateAngle:
                                            controller.isHomeWin() ? 0 : 180,
                                      ),
                                    )
                                  ],
                                ),
                                12.hGap,
                                Text(
                                  controller.isHomeWin()
                                      ? "TACTICAL SUCCESS"
                                      : "TACTICAL RESTRAINT",
                                  style: 21.w7(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldBold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
                Positioned(
                    top: 101.w + 139.w,
                    left: 16.w,
                    right: 16.w,
                    child: Obx(() {
                      if (controller.onTheEnd.value) {
                        return const SizedBox.shrink();
                      }
                      var leftValue = controller.homeTacticProgress.value;
                      return SupportPercentProgressWidget(
                        leftPercent: leftValue.toInt(),
                        rightPercent: 100 - leftValue.toInt(),
                        height: 12.w,
                        leftColor: AppColors.c1F8FE5,
                        rightColor: AppColors.cD60D20,
                      );
                    })),

                /// 左边牌背景
                ...List.generate(5, (index) {
                  return Obx(() {
                    if (controller.onTheEnd.value) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                        top: 101.w + 162.w,
                        left: 13.w + (index * (28.w + 3.w)),
                        child: Container(
                          width: 28.w,
                          height: 38.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: Colors.transparent, width: 1.w)),
                          child:
                              buildEmpty(AppColors.cE6E6E6, AppColors.cC7C7C7),
                        ));
                  });
                }),

                /// 右边牌背景
                ...List.generate(5, (index) {
                  return Obx(() {
                    if (controller.onTheEnd.value) {
                      return const SizedBox.shrink();
                    }
                    return Positioned(
                        top: 101.w + 162.w,
                        right: 13.w + (index * (28.w + 3.w)),
                        child: Container(
                          width: 28.w,
                          height: 38.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.w),
                              border: Border.all(
                                  color: Colors.transparent, width: 1.w)),
                          child:
                              buildEmpty(AppColors.cE6E6E6, AppColors.cC7C7C7),
                        ));
                  });
                }),

                /// 右边卡牌，叠在右边背景上面
                ...List.generate(5, (index) {
                  var list = controller.awayTeamBuffList;
                  print('awayTeamBuff:${list.length}');
                  TrainingInfoBuff? item =
                      list.length - 1 >= index ? list[index] : null;
                  Widget child;
                  if (item == null) {
                    child = Center(
                      child: IconWidget(
                          iconWidth: 28.w,
                          iconHeight: 38.w,
                          fit: BoxFit.fill,
                          icon: Assets.managerUiManagerTacticsCardback),
                    );
                  } else {
                    child = Obx(() {
                      Offset offset =
                          controller.awayAnimationList[index].value.value;
                      return Positioned(
                          top: offset.dy,
                          right: offset.dx,
                          child: AnimatedOpacity(
                            opacity: offset.dy == 75.w ? 0 : 1,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                                width: 28.w,
                                height: 38.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.w),
                                ),
                                child: Obx(() {
                                  return FlipCard(
                                      isFlipped: item.isOpen.value,
                                      width: 28.w,
                                      useSmallTacticCard: true,
                                      onFlip: () {
                                        if(kReleaseMode){
                                          return;
                                        }
                                        item.isOpen.value = !item.isOpen.value;
                                      },
                                      buff: item);
                                })),
                          ));
                    });
                  }
                  return child;
                }),

                /// 球员
                Positioned(
                  top: 101.w + 156.w,
                  left: 0,
                  right: 0,
                  child: Obx(() {
                    if (!controller.onTheEnd.value) {
                      return const SizedBox.shrink();
                    }
                    return const GamePlayersWidget(
                      needStartAnimation: true,
                    );
                  }),
                ),

                /// MY TACTICS 和整块白色背景
                Positioned(
                    top: 101.w + 156.w + 44.w,
                    left: 0,
                    right: 0,
                    child: Obx(() {
                      return AnimatedContainer(
                        height:
                            controller.onTheEnd.value ? (329.w + 335.h) : 163.w,
                        duration: const Duration(milliseconds: 300),
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                height: 163.w,
                                decoration: BoxDecoration(
                                    color: AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(9.w)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () => controller.reStart(),
                                      child: Container(
                                        height: 46.w,
                                        padding: EdgeInsets.only(
                                            left: 17.w, top: 20.w),
                                        child: Text(
                                          "MY TACTICS",
                                          style: 16.w5(
                                              color: AppColors.c000000,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.cD1D1D1,
                                      height: 1.w,
                                    ),

                                    /// 我的卡牌背景
                                    SizedBox(
                                      height: 64.w + 17.w,
                                      child: Stack(
                                        children: [
                                          ...List.generate(5, (index) {
                                            var d = MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                (43.w * 5 + 12.w * 4);
                                            var left = d / 2;
                                            var list =
                                                controller.getHomeTeamBuff();
                                            TrainingInfoBuff? item =
                                                list.length - 1 >= index
                                                    ? list[index]
                                                    : null;
                                            List<Widget> sC = [];
                                            sC.add(Positioned(
                                              top: 6.w,
                                              child: buildEmpty(
                                                  AppColors.cF2F2F2,
                                                  AppColors.ccccccc,
                                                  width: 43.w,
                                                  height: 58.w),
                                            ));
                                            if (item != null) {
                                              List<Widget> abc = [];
                                              for (int i = 0;
                                                  i <
                                                      item.takeEffectGameCount -
                                                          1;
                                                  i++) {
                                                double top = 3.w - i * 3.w;
                                                abc.add(Positioned(
                                                  top: max(0, top),
                                                  child: Container(
                                                    width: 43.w,
                                                    height: 58.w,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: AppColors
                                                              .c000000
                                                              .withOpacity(0.2),
                                                          offset: const Offset(
                                                              1, 1),
                                                          blurRadius: 5,
                                                        )
                                                      ],
                                                    ),
                                                    child: TacticCard(
                                                      num: item.face,
                                                      color: item.color,
                                                      width: 43.w,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.w),
                                                      buff: TrainingInfoBuff(),
                                                    ),
                                                  ),
                                                ));
                                              }
                                              sC.addAll(abc);
                                            }
                                            return Positioned(
                                                top: 17.w,
                                                left: left +
                                                    (43.w + 12.w) * index,
                                                child: SizedBox(
                                                    height: 64.w,
                                                    width: 55.w,
                                                    child: Stack(
                                                      children: sC,
                                                    )));
                                          })
                                        ],
                                      ),
                                    ),

                                    /// 我的卡牌数量
                                    SizedBox(
                                      height: 17.w,
                                      child: Stack(
                                        children: [
                                          ...List.generate(5, (index) {
                                            var d = MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                (43.w * 5 + 12.w * 4);
                                            var left = d / 2;
                                            var list =
                                                controller.getHomeTeamBuff();
                                            TrainingInfoBuff? item =
                                                list.length - 1 >= index
                                                    ? list[index]
                                                    : null;
                                            Widget child;
                                            if (item == null) {
                                              child = const SizedBox.shrink();
                                            } else {
                                              child = Obx(() {
                                                Offset offset = controller
                                                    .homeAnimationList[index]
                                                    .value
                                                    .value;
                                                // dy:269.w -95.w
                                                double startY = 101.w +
                                                    156.w +
                                                    44.w +
                                                    9.w +
                                                    63.w;
                                                double endY = 101.w + 162.w;
                                                double progress =
                                                    controller.showBorder.value
                                                        ? 0
                                                        : ((offset.dy - endY) /
                                                            (startY - endY));
                                                var count =
                                                    item.takeEffectGameCount -
                                                        1;
                                                return Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Text(
                                                      "x$count",
                                                      style: 10.w5(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoMedium),
                                                    ),
                                                    Positioned(
                                                      top: 7.w * progress,
                                                      right: 0,
                                                      child: Text(
                                                        "-1",
                                                        style: 10.w5(
                                                            color: AppColors
                                                                .cD60D20
                                                                .withOpacity(min(
                                                                    1,
                                                                    progress)),
                                                            height: 1,
                                                            fontFamily: FontFamily
                                                                .fRobotoMedium),
                                                      ),
                                                    )
                                                  ],
                                                );
                                              });
                                            }
                                            return Positioned(
                                                top: 0,
                                                left: left +
                                                    (43.w + 12.w) * index,
                                                child: SizedBox(
                                                  height: 17.w,
                                                  width: 43.w,
                                                  child: child,
                                                ));
                                          }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const LiveTextWidget(),
                              WinRateWidget(
                                  teamBattleV2Controller.winRateController),
                            ],
                          ),
                        ),
                      );
                    })),

                /// 我的全部卡牌
                ...List.generate(5, (index) {
                  var list = controller.getHomeTeamBuff();
                  TrainingInfoBuff? item =
                      list.length - 1 >= index ? list[index] : null;
                  Widget child;
                  if (item == null) {
                    child = const SizedBox.shrink();
                  } else {
                    child = Obx(() {
                      Offset offset =
                          controller.homeAnimationList[index].value.value;
                      print('offset:$offset');
                      var where = teamBattleController
                          .pkStartUpdatedEntity?.homeTeamWinPokers
                          .where((e) => e.id == item.id);
                      bool contain = where?.isNotEmpty == true;
                      double startY = 101.w + 156.w + 44.w + 9.w + 63.w;
                      double endY = 101.w + 162.w;
                      double progress = controller.showBorder.value
                          ? 0
                          : ((offset.dy - endY) / (startY - endY));
                      // print('index,progress:$index,$progress');
                      Widget tacticCard = TacticCard(
                        num: item.face,
                        color: item.color,
                        width: 43.w * progress,
                        borderRadius: BorderRadius.circular(4.w),
                        buff: TrainingInfoBuff(),
                      );
                      if (progress == 0) {
                        tacticCard = HeartbeatWidget(
                          child: SmallTacticCard(
                            num: item.face,
                            color: item.color,
                            width: 26.w,
                          ),
                        );
                      }
                      return Positioned(
                          top: offset.dy,
                          left: offset.dx,
                          child: AnimatedOpacity(
                            opacity: offset.dy == 75.w ? 0 : 1,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          contain && controller.showBorder.value
                                              ? AppColors.c1F8FE5
                                              : AppColors.cTransparent,
                                      width: 1.w),
                                  borderRadius: BorderRadius.circular(5.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.c000000.withOpacity(0.2),
                                      offset: const Offset(1, 1),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: tacticCard),
                          ));
                    });
                  }
                  return child;
                }),

                Obx(() {
                  return AnimatedPositioned(
                    top: controller.onTheEnd.value
                        ? ((329.w + 335.h - 163.w) +
                            (101.w + 156.w + 44.w + 163.w + 9.w))
                        : (101.w + 156.w + 44.w + 163.w + 9.w),
                    left: 0,
                    right: 0,
                    duration: const Duration(milliseconds: 300),
                    child: GetBuilder<TeamBattleV2Controller>(
                        id: TeamBattleV2Controller.idQuarterScore,
                        builder: (_) {
                          return QuarterScoreWidget();
                        }),
                  );
                }),
              ],
            ),
          );
        });
  }

  Widget buildEmpty(Color bgColor, Color iconColor,
      {double? width, double? height, double? iconWidth}) {
    return Container(
      width: width ?? 26.w,
      height: height ?? 36.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: bgColor,
      ),
      child: IconWidget(
        iconWidth: 14.w,
        icon: Assets.managerUiManagerTacticsIconEmpty,
        iconColor: iconColor,
      ),
    );
  }
}
