/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2025-03-15 15:12:58
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/custom_buttom.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/my_team_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';

class PlayerExchangeCard extends GetView<TeamController> {
  const PlayerExchangeCard({
    super.key,
    required this.playerId,
    this.isNew = true,
  });

  final int playerId;
  final bool isNew;

  ///球员操作
  Widget _playerInfo() {
    NbaPlayerInfosPlayerBaseInfoList palyer = Utils.getPlayBaseInfo(playerId);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                palyer.ename,
                style: 19.w4(
                    height: 1,
                    color: AppColors.c000000,
                    fontFamily: FontFamily.fOswaldMedium,
                    overflow: TextOverflow.ellipsis),
              ),
              10.5.hGap,
              if (Utils.getPlayBaseInfo(playerId).injuries)
                Container(
                  width: 29.w,
                  height: 19.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: AppColors.cE34D4D,
                  ),
                  child: Text(
                    "INJ",
                    style: 12.w4(
                      fontFamily: FontFamily.fRobotoMedium,
                      color: AppColors.cFFFFFF,
                    ),
                  ),
                )
            ],
          ),
          7.vGap,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${Utils.getTeamInfo(palyer.teamId).shortEname} · ${palyer.position}",
                style: 12.w4(
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                    color: AppColors.cB2B2B2),
              ),
              9.hGap,
              Visibility(
                visible: Utils.getPlayBaseInfo(playerId).injuries,
                child: IconWidget(
                  iconWidth: 16.w,
                  iconHeight: 16.w,
                  icon: Assets.commonUiCommonIconInjury,
                ),
              )
            ],
          ),
          // 7.5.vGap,
        ],
      ),
    );
  }

  Widget _playerPosition() {
    return Container(
      height: 83.w,
      width: 16.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isNew ? AppColors.c0FA76C : AppColors.c262626,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(9.w))),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(
          isNew ? "NEW" : "Current",
          style: 12.w4(
              color: isNew ? AppColors.cFFFFFF : AppColors.cB3B3B3,
              height: 1,
              fontFamily: FontFamily.fRobotoMedium),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(9.r),
          border: Border.all(color: AppColors.cB3B3B3, width: 1)),
      child: Column(
        children: [
          SizedBox(
            width: 314.w,
            height: 107.w,
            child: Row(
              children: [
                _playerPosition(),
                10.hGap,
                PlayerCardNew(
                  playerId: playerId,
                  width: 67.w,
                  height: 83.w,
                  isMyPlayer: true,
                ),
                14.5.hGap,
                _playerInfo(),
                if (isNew)
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.cF2F2F2,
                    ),
                    child: Column(
                      children: [
                        11.vGap,
                        Text(
                          "OVR",
                          style: 12.w4(color: AppColors.c000000, height: 0.8),
                        ),
                        7.vGap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "+21",
                              style: 26.w4(
                                height: 0.8,
                                color: AppColors.c0FA76C,
                                fontFamily: FontFamily.fOswaldMedium,
                              ),
                            ),
                            5.5.hGap,
                            IconWidget(
                              icon: Assets.commonUiCommonIconSystemArrow,
                              iconWidth: 5.5.w,
                              fit: BoxFit.fitWidth,
                              iconColor: AppColors.c0FA76C,
                              rotateAngle: -90,
                            ),
                            5.hGap
                          ],
                        )
                      ],
                    ),
                  ),
                21.hGap,
              ],
            ),
          ),
          if (isNew)
            Container(
              margin: EdgeInsets.only(bottom: 17.5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 127.w,
                    height: 40.w,
                    text: 'CANCEL',
                    type: ButtonType.cancel,
                    onPressed: () {
                      controller.showExChange = false;
                      controller.update();
                    },
                  ),
                  9.hGap,
                  CustomButton(
                    width: 127.w,
                    height: 40.w,
                    text: 'Substitute'.toUpperCase(),
                    type: ButtonType.confirm,
                    onPressed: () {
                      controller.showExChange = false;
                      controller.update();
                    },
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class PlayerCardNew extends StatelessWidget {
  const PlayerCardNew({
    super.key,
    this.grade,
    required this.width,
    required this.height,
    required this.playerId,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.c000000,
    // this.playerId = 0,
    this.getXRouteId,
    this.tabStr,
    this.level,
    this.canTap = true,
    this.isMyPlayer = false,
  });

  final double width;
  final double height;
  final int playerId;
  final String? grade;
  final int? level;
  final double? radius;
  final double fontSize;
  final Color fontColor;
  // final bool showGrade;

  final int? getXRouteId;
  final String? tabStr;
  final bool canTap;
  final bool isMyPlayer;

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(9.w),
              ),
              child: ImageWidget(
                url: Utils.getPlayUrl(playerId),
                imageFailedPath: Assets.iconUiDefault04,
                borderRadius: BorderRadius.circular(9.w),
                width: width,
                height: height,
              ),
            ),
          ),
          // if (ObjectUtil.isNotEmpty(grade))
          Positioned(
            top: 5.w,
            left: 5.w,
            child: Text(
              Utils.getPlayBaseInfo(playerId).playerScore.toString(),
              style: 16.w4(
                  height: 0.75,
                  fontFamily: FontFamily.fOswaldMedium,
                  color: AppColors.c000000),
            ),
          ),

          ///升星等级
          if (ObjectUtil.isNotEmpty(level))
            Positioned(
              top: 82.w,
              child: PlayerStartWidget(
                grade: level!,
              ),
            ),

          Positioned(
              right: 4.w,
              top: 4.w,
              child: Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: AppColors.cFFFFFF,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.iconUiIconRead,
                  width: 9.w,
                  height: 8.w,
                  color: AppColors.c000000,
                  // fit: BoxFit.fitWidth,
                ),
              )),
        ],
      ),
    );

    return child;
  }
}
