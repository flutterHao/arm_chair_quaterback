import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/money_income_animation.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/heartbeat.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_court.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/player_status_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/quarter_score/quarter_score_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/team_stat/team_stats_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/win_rate/win_rate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/10/14:18

class GameOverWidget extends GetView<GameOverController> {
  GameOverWidget({super.key});

  late TeamBattleController teamBattleController;

  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    teamBattleController = Get.find();
    return GetBuilder<GameOverController>(
        init: GameOverController(context),
        builder: (logic) {
          return Container(
            color: AppColors.cF2F2F2,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // 中间
                      Stack(
                        children: [
                          /// 背景球场
                          const GameCourtWidget(
                            needCountDown: false,
                          ),
                          SizedBox(
                            height: 219.w,
                            width: double.infinity,
                            child: controller.isLeftWin()
                                ? _buildLeftWinWidget(context)
                                : _buildRightWinWidget(context),
                          ),
                        ],
                      ),
                      //底部
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.cF2F2F2,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(9.w))),
                        child: Column(
                          children: [
                            Obx(() {
                              if (controller.onMvpAnimationEndObs.value) {
                                /// 动画结束后真实显示的视图
                                return _buildMvpWidget();
                              }

                              ///动画占位视图
                              return AnimatedContainer(
                                  height: controller.mvpObs.value ? 165.w : 0,
                                  margin: EdgeInsets.only(
                                      bottom:
                                          controller.mvpObs.value ? 9.w : 0),
                                  duration: const Duration(milliseconds: 300));
                            }),
                            GetBuilder<TeamBattleV2Controller>(
                                id: TeamBattleV2Controller.idQuarterScore,
                                builder: (_) {
                                  return QuarterScoreWidget(
                                    hasTopMargin: false,
                                  );
                                }),
                            PlayerStatusWidget(teamBattleV2Controller),
                            GameLeaderWidget(
                              controller:
                                  teamBattleV2Controller.gameLeaderController,
                              title: "KEY PLAYERS",
                            ),
                            WinRateWidget(teamBattleV2Controller.winRateController),
                            TeamStatsWidget(
                              controller:
                                  teamBattleV2Controller.teamStatsController,
                            ),
                            9.vGap,
                            const LiveTextWidget(
                              isGameOverStatus: true,
                            ),
                            9.vGap,
                          ],
                        ),
                      )
                    ],
                  ),
                  Obx(() {
                    if (controller.onMvpAnimationEndObs.value) {
                      ///动画结束后视图
                      return const SizedBox.shrink();
                    }

                    /// 位移动画视图
                    return AnimatedPositioned(
                        top: controller.mvpObs.value ? 219.w : 812.h,
                        left: 0,
                        right: 0,
                        duration: const Duration(milliseconds: 300),
                        onEnd: () {
                          controller.onMvpAnimationEndObs.value = true;
                        },
                        child: _buildMvpWidget());
                  }),
                ],
              ),
            ),
          );
        });
  }

  Builder _buildMvpWidget() {
    return Builder(builder: (context) {
      if (controller.getMvpInfo() == null) {
        return const SizedBox.shrink();
      }
      PkResultUpdatedPlayerResults pkResultUpdatedPlayer =
          controller.getMvpInfo()!;
      Widget parent({required Widget child}) {
        return Container(
          height: 165.w,
          margin: EdgeInsets.only(bottom: 9.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: AppColors.cFFFFFF),
          child: child,
        );
      }

      if (controller.isLeftWin()) {
        return parent(
          child: Stack(
            children: [
              Positioned(
                  top: 23.w,
                  right: 21.w,
                  child: IconWidget(
                    iconWidth: 14.w,
                    icon: Assets.commonUiCommonIconSystemInfo,
                    iconColor: AppColors.c000000,
                  )),
              Positioned(
                bottom: -12.w,
                right: -8.w,
                child: Text(
                  "MVP",
                  style: 100.w7(
                      color: AppColors.cF2F2F2,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
              ),
              Row(
                children: [
                  17.hGap,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.w),
                        border:
                            Border.all(color: AppColors.c000000, width: 5.w)),
                    child: ImageWidget(
                      url: Utils.getPlayUrl(pkResultUpdatedPlayer.playerId),
                      imageFailedPath: Assets.iconUiDefault06,
                      width: 88.w,
                      borderRadius: BorderRadius.circular(9.w),
                      height: 126.w,
                    ),
                  ),
                  15.hGap,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "MVP",
                              style: 40.w7(
                                  color: AppColors.cFF7954,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                            10.hGap,
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.isLeftWin()
                                        ? AppColors.c1F8FE5
                                        : AppColors.cD60D20,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(12.w)),
                              child: ImageWidget(
                                url: Utils.getAvaterUrl(
                                    controller.getWinnerInfo()?.teamLogo),
                                width: 21.w,
                                height: 21.w,
                                imageFailedPath: Assets.teamUiHead01,
                                borderRadius: BorderRadius.circular(11.w),
                              ),
                            )
                          ],
                        ),
                        20.vGap,
                        Text(
                          Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                              .ename,
                          style: 27.w7(
                              color: AppColors.c262626,
                              fontFamily: FontFamily.fOswaldBold,
                              height: 1),
                        ),
                        9.vGap,
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.pts}",
                                    style: 14.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "PTS",
                                  style: 10.w4(
                                      color: AppColors.c4D4D4D,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                            22.hGap,
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.reb}",
                                    style: 14.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "REB",
                                  style: 10.w4(
                                      color: AppColors.c4D4D4D,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                            22.hGap,
                            Column(
                              children: [
                                Text("${pkResultUpdatedPlayer.ast}",
                                    style: 14.w5(
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium)),
                                4.vGap,
                                Text(
                                  "AST",
                                  style: 10.w4(
                                      color: AppColors.c4D4D4D,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoRegular),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }
      return parent(
        child: Stack(
          children: [
            Positioned(
                top: 23.w,
                left: 21.w,
                child: IconWidget(
                  iconWidth: 14.w,
                  icon: Assets.commonUiCommonIconSystemInfo,
                  iconColor: AppColors.c000000,
                )),
            Positioned(
              bottom: -12.w,
              left: -20.w,
              child: Text(
                "MVP",
                style: 100.w7(
                    color: AppColors.cF2F2F2,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.isLeftWin()
                                      ? AppColors.c1F8FE5
                                      : AppColors.cD60D20,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(12.w)),
                            child: ImageWidget(
                              url: Utils.getAvaterUrl(
                                  controller.getWinnerInfo()?.teamLogo),
                              width: 21.w,
                              height: 21.w,
                              imageFailedPath: Assets.teamUiHead01,
                              borderRadius: BorderRadius.circular(11.w),
                            ),
                          ),
                          10.hGap,
                          Text(
                            "MVP",
                            style: 40.w7(
                                color: AppColors.cFF7954,
                                height: 1,
                                fontFamily: FontFamily.fOswaldBold),
                          ),
                        ],
                      ),
                      15.vGap,
                      Text(
                        Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                            .ename,
                        textAlign: TextAlign.end,
                        style: 27.w7(
                            color: AppColors.c262626,
                            fontFamily: FontFamily.fOswaldBold,
                            height: 1),
                      ),
                      13.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.pts}",
                                  style: 14.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "PTS",
                                style: 10.w4(
                                    color: AppColors.c4D4D4D,
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                          22.hGap,
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.reb}",
                                  style: 14.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "REB",
                                style: 10.w4(
                                    color: AppColors.c4D4D4D,
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                          22.hGap,
                          Column(
                            children: [
                              Text("${pkResultUpdatedPlayer.ast}",
                                  style: 14.w5(
                                      color: AppColors.c000000,
                                      height: 1,
                                      fontFamily: FontFamily.fRobotoMedium)),
                              4.vGap,
                              Text(
                                "AST",
                                style: 10.w4(
                                    color: AppColors.c4D4D4D,
                                    height: 1,
                                    fontFamily: FontFamily.fRobotoRegular),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                15.hGap,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.c000000, width: 5.w)),
                  child: ImageWidget(
                    url: Utils.getPlayUrl(pkResultUpdatedPlayer.playerId),
                    imageFailedPath: Assets.iconUiDefault06,
                    width: 88.w,
                    borderRadius: BorderRadius.circular(9.w),
                    height: 126.w,
                  ),
                ),
                17.hGap,
              ],
            ),
          ],
        ),
      );
    });
  }

  Stack _buildLeftWinWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///winner旗帜
        winnerBg(true,context),

        ///WINNER：文字
        winnerText(true),

        /// winner奖杯
        winnerCups(true),

        /// chest
        giftBox(true),

        /// 奖励箱子
        gift(true),

        ///loser旗帜
        loserBg(true),

        /// LOSER
        loserText(true),

        /// loser 奖杯
        loserCups(true),

        /// 钞票数量
        moneyCount(true),

        /// 钞票
        moneyAnimation(context, true),
      ],
    );
  }

  Positioned moneyCount(bool isLeft) {
    return Positioned(
        top: 133.w,
        left: isLeft ? 36.w : null,
        right: !isLeft ? 36.w : null,
        child: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.moneyOpacityObs.value ? 1 : 0,
            onEnd: () {
              controller.moneyIncomeObs.value = true;
            },
            child: Container(
              width: 96.w,
              height: 31.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 17.w),
              decoration: BoxDecoration(
                  color: AppColors.c000000,
                  border: Border.all(color: AppColors.c333333, width: 1.w),
                  borderRadius: BorderRadius.circular(6.w)),
              child: Row(
                children: [
                  7.hGap,
                  IconWidget(
                      iconWidth: 28.w,
                      fit: BoxFit.fitWidth,
                      iconHeight: 22.w,
                      icon: Assets.commonUiCommonProp05),
                  Expanded(
                    child: Center(
                      child: AnimatedNum(
                        number: controller.moneyAnimationEnd.value?controller.getMoneyCount():0,
                        isMoney: true,
                        milliseconds: 300,
                        textStyle: 14.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Positioned loserText(bool isLeft) {
    return Positioned(
        top: 22.w,
        right: isLeft ? 19.w : null,
        left: !isLeft ? 19.w : null,
        child: Container(
          width: 131.w,
          alignment: Alignment.topCenter,
          child: Text(
            "LOSER",
            style: 26.w7(
                color: AppColors.c666666,
                height: 1,
                fontFamily: FontFamily.fOswaldBold),
          ),
        ));
  }

  Obx gift(bool isLeft) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.giftObs.value ? 100.w : null,
          left: isLeft
              ? controller.giftObs.value
                  ? 44.w
                  : 155.w
              : null,
          right: !isLeft
              ? controller.giftObs.value
                  ? 102.w
                  : 155.w
              : null,
          duration: const Duration(milliseconds: 500),
          onEnd: () {
            print('giftObs===onEnd---');
            controller.opacityObs.value = !controller.opacityObs.value;
          },
          child: InkWell(
            onTap: () {
              // controller.startObs.value = false;
              // controller.giftObs.value = false;
              // controller.opacityObs.value = false;
              // controller.mvpObs.value = false;
              // controller.onMvpAnimationEndObs.value = false;
              // Future.delayed(const Duration(milliseconds: 500), () {
              //   controller.startObs.value = true;
              // });
            },
            child: AnimatedScale(
              scale: controller.giftObs.value
                  ? 1
                  : controller.giftScaleObs.value
                      ? 1.5
                      : 1,
              duration: const Duration(milliseconds: 500),
              onEnd: () {
                controller.giftObs.value = true;
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: controller.giftObs.value ? 24.w : 63.w,
                child: Center(
                  child: Opacity(
                    opacity: controller.isFull() ? 0.5 : 1,
                    child: IconWidget(
                      iconWidth: 63.w,
                      icon: Assets.managerUiManagerGift03,
                    ),
                  ),
                ),
              ),
            ),
          ));
    });
  }

  Positioned giftBox(bool isLeft) {
    return Positioned(
        top: 96.w,
        right: !isLeft ? 28.w : null,
        left: isLeft ? 36.w : null,
        child: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.opacityObs.value ? 1 : 0,
            onEnd: () {
              controller.moneyOpacityObs.value = true;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 96.w,
                  height: 31.w,
                  margin: EdgeInsets.only(right: 8.w),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 17.w),
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      border: Border.all(color: AppColors.c333333, width: 1.w),
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    controller.isFull() ? "FULL" : "CHEST",
                    style: 14.w5(
                        color: controller.isFull()
                            ? AppColors.c666666
                            : AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
                if (controller.isFull())
                  Positioned(
                    right: 0,
                    child: IconWidget(
                        iconWidth: 16.w,
                        icon: Assets.commonUiCommonIconSystemDanger01),
                  )
              ],
            ),
          );
        }));
  }

  Positioned winnerCups(bool isLeft) {
    return Positioned(
        top: 63.w,
        left: isLeft ? 19.w : null,
        right: !isLeft ? 19.w : null,
        child: Obx(() {
          return HeartbeatWidget(
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: IconWidget(
                            iconWidth: 23.w,
                            icon: Assets.managerUiManagerIconCurrency04),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1.w,
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.managerUiManagerTacticsArrow,
                          iconColor: AppColors.c40F093,
                        ),
                      ),
                    ],
                  ),
                  3.hGap,
                  Text(
                    "+${controller.cup.value.abs()}",
                    style: 16.w5(
                        color: AppColors.cF2F2F2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Obx winnerBg(bool isLeft,BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.startObs.value ? -10.w : -208.w,
          left: isLeft ? 19.w : null,
          right: !isLeft ? 19.w : null,
          duration: const Duration(milliseconds: 300),
          onEnd: () {
            print('AnimatedPositioned---onEnd----');
            Future.delayed(const Duration(milliseconds: 500), () {
              if(context.mounted) {
                controller.initCup();
              }
            });
          },
          child: IconWidget(
            iconHeight: 208.w,
            fit: BoxFit.fitHeight,
            icon: Assets.managerUiManagerEndingWin02,
            iconWidth: 131.w,
          ));
    });
  }

  void _onHeaderAnimationEnd() {
    controller.mvpObs.value = true;
    controller.moneyAnimationEnd.value = true;
  }

  Stack _buildRightWinWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///winner旗帜
        winnerBg(false,context),

        ///WINNER：文字
        winnerText(false),

        /// winner奖杯
        winnerCups(false),

        /// chest
        giftBox(false),

        /// 奖励箱子
        gift(false),

        ///loser旗帜
        loserBg(false),

        /// LOSER
        loserText(false),

        /// loser 奖杯
        loserCups(false),

        /// 钞票数量
        moneyCount(false),

        /// 钞票
        moneyAnimation(context, false),
      ],
    );
  }

  Positioned moneyAnimation(BuildContext context, bool isLeft) {
    return Positioned(child: Obx(() {
      if (!controller.moneyIncomeObs.value) {
        return const SizedBox.shrink();
      }
      return MoneyIncomeAnimation(
        randRect: Rect.fromLTWH((MediaQuery.of(context).size.width - 100) / 2,
            (219.w - 100) / 2, 100, 100),
        childSize: Size(28.w, 22.w),
        targetPosition: Offset(!isLeft ? 250.w : 43.w, 137.w),
        childWidget: IconWidget(
            iconWidth: 28.w,
            fit: BoxFit.fitWidth,
            iconHeight: 22.w,
            icon: Assets.commonUiCommonProp05),
        onEnd: _onHeaderAnimationEnd,
      );
    }));
  }

  Positioned loserCups(bool isLeft) {
    return Positioned(
        top: 63.w,
        right: isLeft ? 19.w : null,
        left: !isLeft ? 19.w : null,
        child: Obx(() {
          return HeartbeatWidget(
            onEnd: () {
              if (controller.cup.value == controller.cupNum) {
                Future.delayed(const Duration(milliseconds: 500), () {
                  controller.giftScaleObs.value = true;
                });
                return;
              }
              controller.cup.value = controller.cup.value + 1;
            },
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        child: IconWidget(
                            iconWidth: 23.w,
                            icon: Assets.managerUiManagerIconCurrency04),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 1.w,
                        child: IconWidget(
                          iconWidth: 8.w,
                          icon: Assets.managerUiManagerTacticsArrow,
                          iconColor: AppColors.cC01223,
                          rotateAngle: 180,
                        ),
                      ),
                    ],
                  ),
                  3.hGap,
                  Text(
                    "-${controller.cup.value.abs()}",
                    style: 16.w5(
                        color: AppColors.cF2F2F2,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Positioned winnerText(bool isLeft) {
    return Positioned(
      top: 22.w,
      right: !isLeft ? 19.w : null,
      left: isLeft ? 19.w : null,
      child: Container(
        width: 131.w,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              "WINNER",
              style: 30.w7(
                  color: AppColors.cC01223,
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
          ],
        ),
      ),
    );
  }

  Obx loserBg(bool isLeft) {
    return Obx(() {
      return AnimatedPositioned(
          top: controller.startObs.value ? -10.w : -208.w,
          right: isLeft ? 19.w : null,
          left: !isLeft ? 19.w : null,
          duration: const Duration(milliseconds: 300),
          child: IconWidget(
            iconHeight: 193.w,
            fit: BoxFit.fitHeight,
            icon: Assets.managerUiManagerEndingLose01,
            iconWidth: 131.w,
          ));
    });
  }
}
