/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 17:22:13
 * @LastEditTime: 2025-03-15 18:34:31
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/player_card.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/player_exchange_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/player_item_widget_new.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTeamWidget extends StatelessWidget {
  const MyTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(
        // init: TeamController(),
        builder: (ctrl) {
      return Container(
        width: 375.w,
        height: 498.w,
        margin: EdgeInsets.symmetric(vertical: 9.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.cFFFFFF,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.w),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LangKey.gametabTeam.tr,
                        style: 30.w7(
                          fontFamily: FontFamily.fOswaldBold,
                          height: 0.75,
                        ),
                      ),
                    ),
                    MtInkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.teamMemberPage);
                      },
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: AppColors.c000000, // 下划线颜色
                                  width: 0.5, // 下划线粗细
                                ))),
                                child: Text(
                                  "LINE-UP",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    height: 1,
                                    color: AppColors.c262626,
                                    fontFamily: FontFamily.fRobotoMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          6.5.hGap,
                          IconWidget(
                            icon: Assets.iconUiIconArrows04,
                            iconWidth: 9.w,
                            iconColor: AppColors.c000000,
                            rotateAngle: -90,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Positioned(
                top: 71.5.w,
                child: OutlinedText(
                  strokeColor: AppColors.ccccccc,
                  text: "career match".toUpperCase(),
                  textStyle: TextStyle(
                      fontSize: 54.5.sp,
                      height: 0.8,
                      fontFamily: FontFamily.fOswaldBold,
                      color: Colors.white
                      // color: AppColors.c5A5A5A,
                      ),
                )),
            Positioned(
              top: 102.w,
              child: Container(
                width: 342.w,
                height: 369.w,
                decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 3, color: Colors.white)),
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(Assets.managerUiManagerMyteamBg),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: ctrl.showExChange ? 0 : 1,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: 48.5.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 1),
                            ),
                            Positioned(
                              top: 48.5.w,
                              left: 36.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 2),
                            ),
                            Positioned(
                              top: 48.5.w,
                              right: 36.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 3),
                            ),
                            Positioned(
                              top: 179.w,
                              left: 91.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 4),
                            ),
                            Positioned(
                              top: 179.w,
                              right: 91.w,
                              child: PlayerCardWidget(
                                  teamPlayers: ctrl.myTeamEntity.teamPlayers,
                                  position: 5),
                            ),
                            Positioned(
                              bottom: 0,
                              child: GetBuilder<TrainingController>(
                                  id: "training_page",
                                  builder: (controller) {
                                    bool eable = controller.ballNum.value > 0;
                                    return MtInkWell(
                                      vibrate: true,
                                      minScale: 0.8,
                                      onTap: () {
                                        // Get.toNamed(RouteNames.teamMemberPage);
                                        if (eable) {
                                          TeamIndexController ctrl = Get.find();
                                          ctrl.matchBattle();
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Container(
                                              width: 343.w,
                                              height: 49.w,
                                              decoration: BoxDecoration(
                                                  color: eable
                                                      ? AppColors.c000000
                                                      : AppColors.cE6E6E,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.w)),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "MATCH",
                                                style: 23.w4(
                                                    color: eable
                                                        ? AppColors.cFFFFFF
                                                        : AppColors.cBFBFBF,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium),
                                              ),
                                            ),
                                            Positioned(
                                              right: 10.w,
                                              child: Obx(() {
                                                return Row(
                                                  children: [
                                                    Image.asset(
                                                      Assets.teamUiTrainingBall,
                                                      width: 22.5.w,
                                                    ),
                                                    5.hGap,
                                                    Text(
                                                      "${controller.ballNum.value}/${controller.trainDefine.ballMaxNum} ",
                                                      style: 16.w4(
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium,
                                                        color: eable
                                                            ? AppColors.cFFFFFF
                                                            : AppColors.cBFBFBF,
                                                      ),
                                                    )
                                                  ],
                                                );
                                              }),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (ctrl.showExChange)
                      Positioned(
                        top: 13.w,
                        left: 14.w,
                        right: 14.w,
                        child: Column(
                          children: [
                            PlayerExchangeCard(
                              playerId: 1402,
                              isNew: false,
                            ),
                            Container(
                              width: 36.w,
                              height: 36.w,
                              margin: EdgeInsets.symmetric(vertical: 6.5.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.w),
                                  color: AppColors.c262626),
                              child: IconWidget(
                                icon: Assets.commonUiCommonIconSystemExchange,
                                iconWidth: 18.w,
                                rotateAngle: 90,
                              ),
                            ),
                            PlayerExchangeCard(
                              playerId: 1402,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            // 20.vGap,
          ],
        ),
      );
    });
  }
}

class ExchangePlayerCard extends StatelessWidget {
  const ExchangePlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class PlayerCardWidget extends GetView<TeamController> {
  // ignore: prefer_const_constructors_in_immutables
  PlayerCardWidget(
      {super.key, required this.teamPlayers, required this.position});

  final List<TeamPlayerInfoEntity> teamPlayers;
  final int position;

  @override
  Widget build(BuildContext context) {
    if (teamPlayers.isEmpty) return const SizedBox();
    TeamPlayerInfoEntity player = teamPlayers.firstWhere(
        (e) => e.position == position,
        orElse: () => TeamPlayerInfoEntity());
    return Column(
      children: [
        PlayerCard(
          playerId: player.playerId,
          score: Utils.getPlayBaseInfo(player.playerId).playerScore,
          status: player.playerStatus,
        ),
        3.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).ename,
          style: 12.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
        ),
        // 2.5.vGap,
        // PlayerStartWidget(grade: player.breakThroughGrade),
        4.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).position,
          style: 10.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.75),
        ),
      ],
    );
  }
}

class PlayerStartWidget extends StatelessWidget {
  const PlayerStartWidget({super.key, required this.grade});
  final int grade;

  @override
  Widget build(BuildContext context) {
    int count = grade ~/ 2;
    int half = grade % 2;
    return SizedBox(
      width: 55.w,
      height: 18.5.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < 5; i++)
            count > i
                ? Positioned(
                    left: 8.5.w * i,
                    child: Image.asset(
                      Assets.managerUiManagerIconStar,
                      height: 18.5.w,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : (grade > i * 2)
                    ? Positioned(
                        left: 8.w * count,
                        child: Image.asset(
                          grade >= 9
                              ? Assets.managerUiManagerIconStar01
                              : Assets.managerUiManagerIconStar02,
                          height: 18.5.w,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Positioned(
                        left: 8.5.w * i,
                        child: Image.asset(
                          Assets.managerUiManagerIconAshstar,
                          height: 18.5.w,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
        ],
      ),
    );
  }
}
