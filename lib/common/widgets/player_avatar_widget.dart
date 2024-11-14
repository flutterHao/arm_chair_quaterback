/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-29 17:10:16
 * @LastEditTime: 2024-11-07 14:51:51
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/index.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayerAvatarWidget extends StatelessWidget {
  const PlayerAvatarWidget({
    super.key,
    this.grade,
    required this.width,
    this.height,
    this.backgroundColor = AppColors.cD9D9D9,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.c262626,
    // this.showGrade = true,
    this.playerId = 0,
    this.getXRouteId,
    this.tabStr,
    this.level,
    this.canTap = true,
    this.isMyPlayer = false,
  });

  final double width;
  final double? height;
  final int playerId;
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
    return InkWell(
      onTap: () => canTap
          ? Get.toNamed(RouteNames.picksPlayerDetail,
              arguments: PlayerDetailPageArguments(playerId,isMyPlayer: isMyPlayer, tabStr: tabStr),
              id: getXRouteId)
          : null,
      child: Stack(
        children: [
          Container(
              height: height??width,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius ?? (width / 2)),
              ),
              child: ImageWidget(
                url: Utils.getPlayUrl(playerId),
                imageFailedPath: Assets.iconUiDefault04,
                width: width,
                height: height??width,
                borderRadius: BorderRadius.circular(radius??32.w),
              )),
          //球员等级
          if (ObjectUtil.isNotEmpty(grade))
            Positioned(
              top: 4.5.w,
              left: 0.w,
              child: Text(
                Utils.formatGrade(grade ?? 'SS'),
                style: 14.w7(color: fontColor, height: 1),
              ),
            ),

          ///升星等级
          if (ObjectUtil.isNotEmpty(level))
            Positioned(
              top: 1.5.w,
              right: 0.5.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  IconWidget(
                    iconWidth: 18.w,
                    icon: Assets.playerUiIconStar01,
                    iconColor: AppColors.cFF7954,
                  ),
                  Positioned(
                    top: 5.w,
                    child: Text(
                      "$level",
                      style: 11.w7(color: AppColors.cFFFFFF, height: 1),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


