/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 17:22:13
 * @LastEditTime: 2025-02-25 10:22:58
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
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
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
        width: 375.w,
        margin: EdgeInsets.symmetric(vertical: 9.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.cFFFFFF,
        ),
        child: Column(
          children: [
            24.5.vGap,
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
            34.5.vGap,
            SizedBox(
              width: 375.w,
              height: 185.5.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ///工资帽背景
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 375.w,
                      height: 109.5.w,
                      color: AppColors.c333333,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Stack(
                              children: [
                                // 描边
                                Text(
                                  LangKey.gameMeanSalaryCap.tr,
                                  style: 80
                                      .w4(
                                        fontFamily: FontFamily.fOswaldMedium,
                                        color: Colors.transparent,
                                      )
                                      .copyWith(
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1
                                            ..color = AppColors.c474747,
                                          height: 1),
                                ),
                                // 填充文字
                                Text(LangKey.gameMeanSalaryCap.tr,
                                    style: 80.w4(
                                        fontFamily: FontFamily.fOswaldMedium,
                                        color: Colors.transparent,
                                        height: 1)),
                              ],
                            ),
                          ),

                          ///工资帽数字
                          Positioned(
                            top: 53.w,
                            left: 28.5.w,
                            right: 38.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    LangKey.gameMeanSalaryCap.tr,
                                    style: 14.w4(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fRobotoRegular,
                                        height: 0.8),
                                  ),
                                ),
                                AnimatedNum(
                                  number: ctrl.myTeamEntity.salary,
                                  isMoney: true,
                                  milliseconds: 1000,
                                  textStyle: 21.w4(
                                      height: 0.8,
                                      color: AppColors.cFFFFFF,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  " /${Utils.formatMoney(ctrl.myTeamEntity.salaryCap)}",
                                  style: 16.w4(
                                      height: 0.8,
                                      color: AppColors.cFFFFFF,
                                      fontFamily: FontFamily.fOswaldRegular),
                                ),
                              ],
                            ),
                          ),
                          6.5.vGap,
                          // const Expanded(child: SizedBox.shrink()),
                          ///工资帽进度

                          Positioned(
                            top: 79.w,
                            left: 27.w,
                            right: 27.w,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Container(
                                  width: 321.w,
                                  height: 9.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: AppColors.c666666,
                                    border: Border.all(
                                        width: 0.5, color: AppColors.cB3B3B3),
                                  ),
                                ),
                                CustomLinearProgressBar(
                                    width: 321.w,
                                    height: 9.w,
                                    progressColor: (ctrl.myTeamEntity.salary /
                                                ctrl.myTeamEntity.salaryCap) >
                                            0.01
                                        ? AppColors.cE34D4D
                                        : AppColors.cFFFFFF,
                                    // border: AppColors.cFFFFFF,
                                    backgroundColor: AppColors.cTransparent,
                                    progress: ctrl.myTeamEntity.salary /
                                        ctrl.myTeamEntity.salaryCap),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///战力值+图鉴
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 124.w,
                          height: 108.w,
                          padding: EdgeInsets.only(
                              top: 14.5.w, left: 15.w, bottom: 18.w),
                          decoration: BoxDecoration(
                              color: AppColors.cFFFFFF,
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
                          padding: EdgeInsets.only(
                              top: 14.5.w, left: 15.w, right: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.w),
                              color: AppColors.cFFFFFF,
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
                                int compCount = iCtrl
                                    .playerCollectEntity.collects
                                    .where((e) => e.fragmentNum >= e.needNum)
                                    .length;
                                return InkWell(
                                  onTap: () {
                                    TeamIndexController ctrl = Get.find();
                                    ctrl.goToIllustraction();
                                    // Get.toNamed(RouteNames.illustrationPage);
                                    iCtrl.reset();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 2.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Archive",
                                              style: 14.w4(
                                                fontFamily:
                                                    FontFamily.fRobotoRegular,
                                                height: 0.8,
                                              ),
                                            ),
                                            5.5.vGap,
                                            if (compCount > 0)
                                              Container(
                                                height: 16.w,
                                                // width: 24.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 6.w,
                                                    vertical: 3),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.w),
                                                  color: AppColors.cE34D4D,
                                                ),
                                                child: Text(
                                                  "+${compCount > 99 ? 99 : compCount}",
                                                  style: 10.w4(
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
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
                                                        fontFamily: FontFamily
                                                            .fOswaldMedium),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    "/${CacheApi.playerBookRuleList.length}",
                                                    style: 16.w4(
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fOswaldRegular),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            19.vGap,
                                          ],
                                        ),
                                        const Expanded(
                                            child: SizedBox.shrink()),
                                        Container(
                                          margin: EdgeInsets.only(top: 3.w),
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Image.asset(
                                                width: 56.w,
                                                height: 75.5.w,
                                                Assets
                                                    .managerUiManagerIconArchive,
                                                fit: BoxFit.fill,
                                              ),
                                              Positioned(
                                                  top: 51.5.w,
                                                  child: Text(
                                                    "NBA",
                                                    style: 19.w4(
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
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
                  ),
                ],
              ),
            ),
            Container(
              width: 367.w,
              height: 369.w,
              margin: EdgeInsets.only(top: 4.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(Assets.managerUiManagerMyteamBg),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 35.5.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 1),
                  ),
                  Positioned(
                    top: 80.5.w,
                    left: 27.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 2),
                  ),
                  Positioned(
                    top: 80.5.w,
                    right: 27.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 3),
                  ),
                  Positioned(
                    top: 213.w,
                    left: 87.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 4),
                  ),
                  Positioned(
                    top: 213.w,
                    right: 87.w,
                    child: PlayerCardWidget(
                        teamPlayers: ctrl.myTeamEntity.teamPlayers,
                        position: 5),
                  )
                ],
              ),
            ),
            // 20.vGap,
            MtInkWell(
              vibrate: true,
              minScale: 0.8,
              onTap: () {
                Get.toNamed(RouteNames.teamMemberPage);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 375.w,
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
        2.5.vGap,
        PlayerStartWidget(grade: player.breakThroughGrade),
        4.5.vGap,
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
