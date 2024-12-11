import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_leader/game_leader_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/live_text_widget.dart';
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
  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    teamBattleV2Controller = Get.find();
    return GetBuilder<GameOverController>(
        init: GameOverController(),
        builder: (logic) {
          return Container(
            color: AppColors.c000000.withOpacity(0.6),
            child: Column(
              children: [
                // 中间
                SizedBox(
                  height: 219.w,
                  width: double.infinity,
                  child: controller.isLeftWin()
                      ? _buildLeftWinWidget()
                      : _buildRightWinWidget(),
                ),
                //底部
                Expanded(
                    child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(9.w)),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(9.w))),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Obx(() {
                                if(controller.onMvpAnimationEndObs.value){
                                  /// 动画结束后真实显示的视图
                                  return _buildMvpWidget();
                                }
                                ///动画占位视图
                                return AnimatedContainer(
                                    height: controller.mvpObs.value ? 165.w : 0,
                                    margin: EdgeInsets.only(
                                        bottom:
                                            controller.mvpObs.value ? 9.w : 0),
                                    duration:
                                        const Duration(milliseconds: 300));
                              }),
                              GetBuilder<TeamBattleV2Controller>(
                                  id: TeamBattleV2Controller.idQuarterScore,
                                  builder: (_) {
                                    return QuarterScoreWidget(
                                      hasTopMargin: false,
                                    );
                                  }),
                              GameLeaderWidget(
                                controller:
                                    teamBattleV2Controller.gameLeaderController,
                                title: "KEY PLAYERS",
                              ),
                              // WinRateWidget(teamBattleV2Controller.winRateController),
                              TeamStatsWidget(
                                controller: teamBattleV2Controller.teamStatsController,
                              ),
                              9.vGap,
                              const LiveTextWidget(isGameOverStatus: true,),
                              9.vGap
                            ],
                          ),
                        ),
                        Obx(() {
                          if(controller.onMvpAnimationEndObs.value){
                            ///动画结束后视图
                            return const SizedBox.shrink();
                          }
                          /// 位移动画视图
                          return AnimatedPositioned(
                              top: controller.mvpObs.value ? 0 : 812.h,
                              left: 0,
                              right: 0,
                              duration: const Duration(milliseconds: 300),
                              onEnd: (){
                                controller.onMvpAnimationEndObs.value = true;
                              },
                              child: _buildMvpWidget());
                        }),
                      ],
                    ),
                  ),
                ))
              ],
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
                      width: 85.w,
                      borderRadius: BorderRadius.circular(9.w),
                      height: 123.w,
                    ),
                  ),
                  15.hGap,
                  Column(
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
                      6.vGap,
                      Text(
                        Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                            .ename,
                        style: 14.w4(
                            color: AppColors.c262626,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fRobotoRegular),
                      ),
                      2.vGap,
                      Text(
                        Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                            .elname,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
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
                    6.vGap,
                    Text(
                      Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                          .ename,
                      style: 14.w4(
                          color: AppColors.c262626,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: FontFamily.fRobotoRegular),
                    ),
                    2.vGap,
                    Text(
                      Utils.getPlayBaseInfo(pkResultUpdatedPlayer.playerId)
                          .elname,
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
                15.hGap,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.c000000, width: 5.w)),
                  child: ImageWidget(
                    url: Utils.getPlayUrl(pkResultUpdatedPlayer.playerId),
                    imageFailedPath: Assets.iconUiDefault06,
                    width: 85.w,
                    borderRadius: BorderRadius.circular(9.w),
                    height: 123.w,
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

  Stack _buildLeftWinWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///旗帜
        Obx(() {
          return AnimatedPositioned(
              top: controller.startObs.value ? -10.w : -208.w,
              left: 19.w,
              duration: const Duration(milliseconds: 300),
              onEnd: () {
                print('AnimatedPositioned---onEnd----');
                controller.giftObs.value = !controller.giftObs.value;
              },
              child: IconWidget(
                iconHeight: 208.w,
                fit: BoxFit.fitHeight,
                icon: Assets.managerUiManagerFlag,
                iconWidth: 131.w,
              ));
        }),

        ///WINNER：文字
        Positioned(
          top: 15.w,
          left: 19.w,
          child: Container(
            width: 131.w,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "WINNER",
                  style: 30.w7(
                      color: AppColors.cFFFFFF,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                10.vGap,
                Container(
                  width: 15.w,
                  height: 2.w,
                  color: AppColors.cFF7954,
                )
              ],
            ),
          ),
        ),

        /// chest
        Positioned(
            left: 36.w,
            child: Obx(() {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: controller.opacityObs.value ? 1 : 0,
                onEnd: _onHeaderAnimationEnd,
                child: Container(
                  width: 96.w,
                  height: 31.w,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 17.w),
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      border: Border.all(color: AppColors.c333333, width: 1.w),
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    "CHEST",
                    style: 14.w5(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              );
            })),

        /// 奖励箱子
        Obx(() {
          return AnimatedPositioned(
              left: controller.giftObs.value ? 43.w : 155.w,
              duration: const Duration(milliseconds: 300),
              onEnd: () {
                print('giftObs===onEnd---');
                controller.opacityObs.value = !controller.opacityObs.value;
              },
              child: InkWell(
                onTap: () {
                  // controller.startObs.value = !controller.startObs.value;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: controller.giftObs.value ? 24.w : 63.w,
                  child: Center(
                    child: IconWidget(
                        iconWidth: 63.w, icon: Assets.managerUiManagerGift03),
                  ),
                ),
              ));
        }),

        /// LOSER
        Positioned(
            top: 19.w,
            right: 19.w,
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Text(
                "LOSER",
                style: 26.w7(
                    color: AppColors.cB3B3B3,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
            ))
      ],
    );
  }

  void _onHeaderAnimationEnd() {
    controller.mvpObs.value = true;
  }

  Stack _buildRightWinWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ///旗帜
        Obx(() {
          return AnimatedPositioned(
              top: controller.startObs.value ? -10.w : -208.w,
              right: 19.w,
              duration: const Duration(milliseconds: 300),
              onEnd: () {
                print('AnimatedPosi         tioned---onEnd----');
                controller.giftObs.value = !controller.giftObs.value;
              },
              child: IconWidget(
                iconHeight: 208.w,
                fit: BoxFit.fitHeight,
                icon: Assets.managerUiManagerFlag,
                iconWidth: 131.w,
              ));
        }),

        ///WINNER：文字
        Positioned(
          top: 15.w,
          right: 19.w,
          child: Container(
            width: 131.w,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "WINNER",
                  style: 30.w7(
                      color: AppColors.cFFFFFF,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                10.vGap,
                Container(
                  width: 15.w,
                  height: 2.w,
                  color: AppColors.cFF7954,
                )
              ],
            ),
          ),
        ),

        /// chest
        Positioned(
            right: 36.w,
            child: Obx(() {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: controller.opacityObs.value ? 1 : 0,
                onEnd: _onHeaderAnimationEnd,
                child: Container(
                  width: 96.w,
                  height: 31.w,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 17.w),
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      border: Border.all(color: AppColors.c333333, width: 1.w),
                      borderRadius: BorderRadius.circular(6.w)),
                  child: Text(
                    "CHEST",
                    style: 14.w5(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fOswaldMedium),
                  ),
                ),
              );
            })),

        /// 奖励箱子
        Obx(() {
          return AnimatedPositioned(
              right: controller.giftObs.value ? 102.w : 155.w,
              duration: const Duration(milliseconds: 300),
              onEnd: () {
                print('giftObs===onEnd---');
                controller.opacityObs.value = !controller.opacityObs.value;
              },
              child: InkWell(
                onTap: () {
                  // controller.startObs.value = !controller.startObs.value;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: controller.giftObs.value ? 24.w : 63.w,
                  child: Center(
                    child: IconWidget(
                        iconWidth: 63.w, icon: Assets.managerUiManagerGift03),
                  ),
                ),
              ));
        }),

        /// LOSER
        Positioned(
            top: 19.w,
            left: 19.w,
            child: Container(
              width: 131.w,
              alignment: Alignment.topCenter,
              child: Text(
                "LOSER",
                style: 26.w7(
                    color: AppColors.cB3B3B3,
                    height: 1,
                    fontFamily: FontFamily.fOswaldBold),
              ),
            ))
      ],
    );
  }
}
