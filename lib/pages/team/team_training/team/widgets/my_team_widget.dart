/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-13 17:22:13
 * @LastEditTime: 2024-11-13 21:04:56
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTeamWidget extends StatelessWidget {
  const MyTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(
        init: TeamController(),
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
                  child: Text(
                    "MY TEAM",
                    style: 30.w7(
                      fontFamily: FontFamily.fOswaldBold,
                      height: 0.75,
                    ),
                  ),
                ),
                38.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL POWER",
                        style: 16.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.75,
                        ),
                      ),
                      Text(
                        "${ctrl.myTeamEntity.oVR}",
                        style: 16.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.75,
                        ),
                      ),
                    ],
                  ),
                ),
                20.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  color: AppColors.c666666,
                  height: 1.w,
                ),
                15.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SALARY CAP",
                        style: 16.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.75,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${Utils.formatMoney(ctrl.myTeamEntity.salary)}/${Utils.formatMoney(ctrl.myTeamEntity.salaryCap)}",
                            style: 16.w4(
                              fontFamily: FontFamily.fOswaldMedium,
                              height: 0.75,
                            ),
                          ),
                          6.vGap,
                          CustomLinearProgressBar(
                            progress: ctrl.myTeamEntity.salary /
                                ctrl.myTeamEntity.salaryCap,
                            width: 113.w,
                            height: 6.w,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 367.w,
                  height: 318.w,
                  margin: EdgeInsets.only(top: 18.w),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.uiManagerMyteamBgJpg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 28.5.w,
                        child: PlayerCardWidget(position: 1),
                      ),
                      Positioned(
                        top: 73.5.w,
                        left: 27.w,
                        child: PlayerCardWidget(position: 2),
                      ),
                      Positioned(
                        top: 73.5.w,
                        right: 27.w,
                        child: PlayerCardWidget(position: 3),
                      ),
                      Positioned(
                        top: 195.5.w,
                        left: 51.w,
                        child: PlayerCardWidget(position: 4),
                      ),
                      Positioned(
                        top: 195.5.w,
                        right: 51.w,
                        child: PlayerCardWidget(position: 5),
                      )
                    ],
                  ),
                ),
                20.vGap,
                MtInkwell(
                  onTap: () {},
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
                            "LINE-UP",
                            style: 23.w4(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fRobotoMedium),
                          ),
                        ),
                        Positioned(
                            right: 10.w,
                            child: IconWidget(
                              iconWidth: 15.w,
                              icon: Assets.uiIconTriangle_03Png,
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
  PlayerCardWidget({super.key, required this.position});
  final int position;

  @override
  Widget build(BuildContext context) {
    if (controller.myTeamEntity.teamPlayers.isEmpty) return const SizedBox();
    TeamPlayerInfoEntity player = controller.myTeamEntity.teamPlayers
        .firstWhere((e) => e.position == position);
    return Column(
      children: [
        Container(
          width: 74.w,
          height: 93.w,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.w),
            color: AppColors.cFFFFFF,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ImageWidget(
                width: 74.w,
                height: 93.w,
                url: Utils.getPlayUrl(player.playerId),
              ),
              Positioned(
                left: 4.4.w,
                top: 5.5.w,
                child: Text(
                  "${Utils.getPlayBaseInfo(player.playerId).playerScore}",
                  style: 16.w4(
                    color: AppColors.c262626,
                    height: 0.75,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
              ),
              Positioned(
                top: 4.w,
                right: 4.w,
                child: Container(
                  width: 16.w,
                  height: 16.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: AppColors.cF2F2F2),
                  child: IconWidget(
                    iconWidth: 10.w,
                    icon: Assets.uiIconReadPng,
                    iconColor: AppColors.c262626,
                  ),
                ),
              ),
            ],
          ),
        ),
        5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).ename,
          style: 12.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
        ),
        5.5.vGap,
        Text(
          Utils.getPlayBaseInfo(player.playerId).position,
          style: 10.w4(fontFamily: FontFamily.fRobotoRegular, height: 0.75),
        ),
      ],
    );
  }
}
