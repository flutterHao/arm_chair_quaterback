/*
 * @Description: 球员头像卡片
 * @Author: lihonghao
 * @Date: 2024-11-18 12:23:44
 * @LastEditTime: 2024-11-26 20:34:13
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routers/names.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.playerId,
    this.score,
    this.bgColor,
    this.iconBgColor,
    required this.isMyPlayer,
    this.onTap,
  });

  final int playerId;
  final int? score;
  final Color? bgColor;
  final Color? iconBgColor;
  final bool isMyPlayer;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return MtInkwell(
      onTap: () =>
          onTap?.call() ??
          Get.toNamed(RouteNames.picksPlayerDetail,
              arguments:
                  PlayerDetailPageArguments(playerId, isMyPlayer: isMyPlayer)),
      child: Container(
        width: 74.w,
        height: 93.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: bgColor ?? AppColors.cFFFFFF,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ImageWidget(
              width: 74.w,
              height: 93.w,
              url: Utils.getPlayUrl(playerId),
              imageFailedPath: Assets.iconUiDefault04,
            ),
            if (!ObjectUtil.isEmpty(score))
              Positioned(
                left: 4.4.w,
                top: 5.5.w,
                child: Text(
                  "${Utils.getPlayBaseInfo(playerId).playerScore}",
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
                  icon: Assets.iconUiIconRead,
                  iconColor: AppColors.c262626,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
