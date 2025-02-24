/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-28 20:22:47
 * @LastEditTime: 2025-02-24 21:13:35
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/slide_transition_x.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/dialog/fire_dialog.dart';
import 'package:flutter/material.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:common_utils/common_utils.dart';

class PlayerItemNew extends GetView<TeamController> {
  const PlayerItemNew({
    super.key,
    required this.item,
  });

  // final bool isMain;
  final TeamPlayerInfoEntity item;

  ///球员操作
  Widget _playerInfo() {
    var showArrow = item.position >= 0 && !controller.isShowDialog.value;
    NbaPlayerInfosPlayerBaseInfoList palyer =
        Utils.getPlayBaseInfo(item.playerId);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150.w,
            child: Text(
              palyer.ename,
              style: 21.w7(
                  height: 1,
                  color: AppColors.cF2F2F2,
                  overflow: TextOverflow.ellipsis),
            ),
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
                    color: AppColors.cD9D9D9),
              ),
              9.hGap,
              if (CacheApi.playerStatusMap[item.playerStatus]?.statsId != null)
                IconWidget(
                  iconWidth: 20.w,
                  iconHeight: 20.w,
                  icon: Utils.getStatusUrl(
                      CacheApi.playerStatusMap[item.playerStatus]?.statsId),
                ),
              4.hGap,
              Visibility(
                visible: Utils.getPlayBaseInfo(item.playerId).injuries,
                child: IconWidget(
                  iconWidth: 16.w,
                  iconHeight: 16.w,
                  icon: Assets.commonUiCommonIconInjury,
                ),
              )
            ],
          ),
          14.5.vGap,
          Row(
            children: [
              Container(
                width: 45.w,
                height: 29.w,
                padding: EdgeInsets.only(left: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: AppColors.cFFFFFF.withOpacity(0.1),
                  // border: Border.all(width: 1.w, color: AppColors.cE6E6E),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LangKey.gameNamePow.tr,
                      style: 8.w4(
                          height: 0.8,
                          fontFamily: FontFamily.fRobotoRegular,
                          color: AppColors.cFFFFFF),
                    ),
                    3.5.vGap,
                    Text(
                      "${palyer.playerStrength}",
                      style: 12.w4(
                          height: 0.8,
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.cFFFFFF),
                    ),
                  ],
                ),
              ),
              4.hGap,
              Container(
                width: 45.w,
                height: 29.w,
                padding: EdgeInsets.only(left: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: AppColors.cFFFFFF.withOpacity(0.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LangKey.playerNameSalary.tr,
                      style: 8.w4(
                          height: 0.8,
                          fontFamily: FontFamily.fRobotoRegular,
                          color: AppColors.cFFFFFF),
                    ),
                    3.5.vGap,
                    Text(
                      Utils.formatMoney(palyer.salary),
                      style: 12.w4(
                          height: 0.8,
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.cFFFFFF),
                    ),
                  ],
                ),
              ),
              4.hGap,
            ],
          )
        ],
      ),
    );
  }

  Widget _centerInfo(BuildContext context) {
    return Row(
      children: [
        PlayerCardNew(
          backgroundColor: AppColors.cE1E1E1,
          playerId: item.playerId,
          player: item,
          width: 73.w,
          height: 93.w,
          isMyPlayer: true,
          grade: Utils.formatGrade(Utils.getPlayBaseInfo(item.playerId).grade),
          level: item.breakThroughGrade,
        ),
        11.hGap,
        _playerInfo(),
        9.hGap,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.w,
      width: 343.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          border: Border.all(color: AppColors.c2B82E4)),
      child: _centerInfo(context),
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
    this.player,
    this.backgroundColor = AppColors.cD9D9D9,
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
  final TeamPlayerInfoEntity? player;
  final String? grade;
  final int? level;
  final Color? backgroundColor;
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
    Widget child = Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
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
        //球员等级
        if (ObjectUtil.isNotEmpty(grade))
          Positioned(
            top: 5.5.w,
            left: 5.w,
            child: OutlinedText(
              text: Utils.formatGrade(grade ?? 'S'),
              textStyle:
                  26.w4(height: 0.75, fontFamily: FontFamily.fRobotoBlack),
            ),
          ),

        ///升星等级
        if (ObjectUtil.isNotEmpty(level))
          Positioned(
            bottom: -2.w,
            left: 0.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconWidget(
                  iconWidth: 22.5.w,
                  icon: Assets.managerUiManagerPlayerstar,
                ),
                Positioned(
                  // top: 7.w,
                  child: Text(
                    "$level",
                    style: 12.w4(
                        color: AppColors.cFFFFFF,
                        height: 0.75,
                        fontFamily: FontFamily.fRobotoMedium),
                  ),
                ),
              ],
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
                color: AppColors.c000000,
              ),
            )),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 41.w,
              height: 18.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.w),
                    bottomRight: Radius.circular(9.w)),
              ),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "OVR",
                  style: 9.w4(
                      color: AppColors.cFFFFFF,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ),
                TextSpan(
                  text: " ${Utils.getPlayBaseInfo(playerId).playerScore}",
                  style: 12.w4(
                      color: AppColors.cFFFFFF,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                )
              ])),
            ))
      ],
    );
    if (canTap && player != null) {
      child = InkWell(
        onTap: () {
          if (canTap && player != null) {
            Get.toNamed(RouteNames.teamTeamUpgrade,
                arguments: {"playerUuid": player?.uuid});
          }
        },
        child: child,
      );
    }
    return child;
  }
}
