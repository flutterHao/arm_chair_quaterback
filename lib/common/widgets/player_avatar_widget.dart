/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-29 17:10:16
 * @LastEditTime: 2024-11-07 12:52:31
 */

import 'package:arm_chair_quaterback/common/constant/assets.dart';
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
    this.backgroundColor = AppColors.cD9D9D9,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.cFFFFFF,
    // this.showGrade = true,
    this.playerId = 0,
    this.getXRouteId,
    this.tabStr,
    this.level,
    this.canTap = true,
    this.isMyPlayer = false,
  });

  final double width;
  final int playerId;
  final String? grade;
  final String? level;
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
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: width,
              width: width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius ?? (width / 2)),
              ),
              child: ImageWidget(
                url: Utils.getPlayUrl(playerId),
                imageFailedPath: Assets.uiDefault_04Png,
                width: width,
                borderRadius: BorderRadius.circular(32.w),
              )),
          //球员等级
          if (ObjectUtil.isNotEmpty(grade))
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                Utils.formatGrade(grade ?? 'SS'),
                style: 14.w7(color: fontColor),
              ),
            ),

          ///升星等级
          if (ObjectUtil.isNotEmpty(level))
            Positioned(
              top: 1.5.w,
              right: 0.5.w,
              child: IconWidget(
                iconWidth: 17.w,
                icon: Assets.uiIconStar_01Png,
                iconColor: AppColors.cFF7954,
              ),
            ),
          if (ObjectUtil.isNotEmpty(level))
            Positioned(
              right: 6.w,
              top: 6.5.w,
              child: Text(
                level!,
                style: 11.w7(color: AppColors.cFFFFFF, height: 1),
              ),
            ),
        ],
      ),
    );
  }
}


