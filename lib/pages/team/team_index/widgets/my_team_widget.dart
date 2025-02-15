/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 17:22:13
 * @LastEditTime: 2025-02-15 11:43:22
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/player_card.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
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
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 9.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.cFFFFFF,
        ),
        child: Column(
          children: [
            24.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    LangKey.gametabTeam.tr,
                    style: 30.w7(
                      fontFamily: FontFamily.fOswaldBold,
                      height: 0.75,
                    ),
                  ),
                ],
              ),
            ),
            34.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 124.w,
                  height: 108.w,
                  padding:
                      EdgeInsets.only(top: 14.5.w, left: 15.w, bottom: 18.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(
                        width: 1,
                        color: AppColors.c666666,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // LangKey.teamTabTeamPower.tr,
                        "Total power",
                        style: 14.w4(
                          fontFamily: FontFamily.fRobotoRegular,
                          height: 0.8,
                        ),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "${ctrl.myTeamEntity.oVR}",
                        style: 30.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
                9.hGap,
                Container(
                  width: 210.w,
                  height: 108.w,
                  padding:
                      EdgeInsets.only(top: 14.5.w, left: 15.w, right: 14.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(
                        width: 1,
                        color: AppColors.c666666,
                      )),
                  child: GetBuilder<IllustratiionsController>(
                      init: IllustratiionsController(),
                      id: "list",
                      builder: (iCtrl) {
                        int count = iCtrl.playerCollectEntity.collects
                            .where((e) => e.isLight == 1)
                            .length;
                        int compCount = iCtrl.playerCollectEntity.collects
                            .where((e) => e.fragmentNum >= e.needNum)
                            .length;
                        return InkWell(
                          onTap: () {
                            TeamIndexController ctrl = Get.find();
                            ctrl.goToIllustraction();
                            Get.toNamed(RouteNames.illustrationPage);
                            iCtrl.reset();
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Archive",
                                      style: 14.w4(
                                        fontFamily: FontFamily.fRobotoRegular,
                                        height: 0.8,
                                      ),
                                    ),
                                    5.5.vGap,
                                    if (compCount > 0)
                                      Container(
                                        height: 16.w,
                                        // width: 24.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6.w, vertical: 3),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                          color: AppColors.cE34D4D,
                                        ),
                                        child: Text(
                                          "+${compCount > 99 ? 99 : compCount}",
                                          style: 10.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                              height: 0.75,
                                              color: AppColors.cFFFFFF),
                                        ),
                                      ),
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          AnimatedNum(
                                            number: count,
                                            milliseconds: 1000,
                                            textStyle: 24.w4(
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            "/${CacheApi.playerBookRuleList.length}",
                                            style: 16.w4(
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldRegular),
                                          ),
                                        ],
                                      ),
                                    ),
                                    19.vGap,
                                  ],
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                Container(
                                  margin: EdgeInsets.only(top: 3.w),
                                  child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Image.asset(
                                        width: 56.w,
                                        height: 75.5.w,
                                        Assets.managerUiManagerIconArchive,
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                          top: 51.5.w,
                                          child: Text(
                                            "NBA",
                                            style: 19.w4(
                                              fontFamily:
                                                  FontFamily.fOswaldMedium,
                                              height: 0.8,
                                              color: AppColors.cE34D4D,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                9.5.hGap,
                                Image.asset(
                                  width: 14.w,
                                  Assets.iconUiIconRead,
                                  color: AppColors.c000000,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            14.vGap,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              color: AppColors.c666666.withOpacity(0.3),
              height: 1.w,
            ),
            9.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                28.5.hGap,
                Expanded(
                  flex: 194,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  LangKey.gameMeanSalaryCap.tr,
                                  style: 12.w4(
                                      color: AppColors.c000000,
                                      fontFamily: FontFamily.fRobotoRegular,
                                      height: 0.9),
                                ),
                              ],
                            ),
                            6.5.vGap,
                            // const Expanded(child: SizedBox.shrink()),
                            Row(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AnimatedNum(
                                      number: ctrl.myTeamEntity.salary,
                                      isMoney: true,
                                      milliseconds: 1000,
                                      textStyle: 19.w4(
                                          height: 0.75,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      "/${Utils.formatMoney(ctrl.myTeamEntity.salaryCap)}",
                                      style: 14.w4(
                                          height: 0.9,
                                          fontFamily:
                                              FontFamily.fOswaldRegular),
                                    ),
                                  ],
                                ),
                                9.5.hGap,
                                SizedBox(
                                  width: 71.w,
                                  child: Stack(
                                    children: [
                                      CustomLinearProgressBar(
                                          width: 71.w,
                                          height: 6.w,
                                          progressColor: ctrl
                                                      .myTeamEntity.salary >
                                                  ctrl.myTeamEntity.salaryCap
                                              ? AppColors.cD60D20
                                              : AppColors.c000000,
                                          backgroundColor: AppColors.cFFFFFF,
                                          progress: ctrl.myTeamEntity.salary /
                                              ctrl.myTeamEntity.salaryCap),
                                      Container(
                                        width: 71.w,
                                        height: 6.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.w),
                                            border: Border.all(
                                                width: 0.5,
                                                color: AppColors.c666666)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            10.vGap,
                          ],
                        ),
                      ),
                      if (ctrl.myTeamEntity.salary >
                              ctrl.myTeamEntity.salaryCap &&
                          ctrl.current.value == 0)
                        Positioned(
                          top: 0.w,
                          left: 90.w,
                          child: Container(
                            width: 32.w,
                            // height: 16.5.w,
                            padding: EdgeInsets.symmetric(vertical: 2.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.cD60D20,
                                borderRadius: BorderRadius.circular(4.w)),
                            child: Text(
                              "MAX",
                              style: 12.w4(
                                  color: AppColors.cFFFFFF,
                                  fontFamily: FontFamily.fOswaldMedium,
                                  height: 1),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Container(width: 1, height: 42.w, color: AppColors.cD1D1D1),
                23.5.hGap,
              ],
            ),
            Container(
              width: 367.w,
              height: 330.w,
              margin: EdgeInsets.only(top: 18.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.managerUiManagerMyteamBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 16.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 1),
                  ),
                  Positioned(
                    top: 61.w,
                    left: 27.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 2),
                  ),
                  Positioned(
                    top: 61.w,
                    right: 27.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 3),
                  ),
                  Positioned(
                    top: 198.w,
                    left: 87.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 4),
                  ),
                  Positioned(
                    top: 198.w,
                    right: 87.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 5),
                  )
                ],
              ),
            ),
            20.vGap,
            MtInkWell(
              vibrate: true,
              minScale: 0.8,
              onTap: () {
                // Get.toNamed(RouteNames.teamMemberPage,
                //     id: GlobalNestedKey.TEAM);
                // BottomTipDialog.showWithSound(
                //     barrierColor: Colors.transparent,
                //     backgroundColor: Colors.transparent,
                //     isScrollControlled: true,
                //     context: context,
                //     builder: (context) {
                //       return VerticalDragBackWidget(child: TeamMenberView());
                //     });
                Get.toNamed(RouteNames.teamMemberPage);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 51.w,
                      decoration: BoxDecoration(
                          color: AppColors.c000000,
                          borderRadius: BorderRadius.circular(9.w)),
                      alignment: Alignment.center,
                      child: Text(
                        LangKey.teamTabLineUp.tr,
                        style: 23.w4(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Positioned(
                        right: 10.w,
                        child: IconWidget(
                          iconWidth: 15.w,
                          icon: Assets.iconUiIconTriangle03,
                          iconColor: AppColors.cFFFFFF,
                          rotateAngle: 90,
                        ))
                  ],
                ),
              ),
            ),
            20.vGap,
          ],
        ),
      );
    });
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
          isMyPlayer: true,
          status: player.playerStatus,
          onTap: () => Get.toNamed(RouteNames.teamTeamUpgrade,
              arguments: {"playerUuid": player.uuid}),
        ),
        3.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).ename,
          style: 12.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
        ),
        4.5.vGap,
        OutLineProgressWidget(
          width: 68.w,
          height: 6.w,
          progress: player.power / 100,
          progressColor: Utils.getProgressColor(player.power),
        ),
        3.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).position,
          style: 10.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.75),
        ),
      ],
    );
  }
}
