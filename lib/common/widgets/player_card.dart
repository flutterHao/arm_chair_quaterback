/*
 * @Description: 球员头像卡片
 * @Author: lihonghao
 * @Date: 2024-11-18 12:23:44
 * @LastEditTime: 2025-02-15 15:32:16
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
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
    this.status,
  });

  final int playerId;
  final int? score;
  final Color? bgColor;
  final Color? iconBgColor;
  final bool isMyPlayer;
  final Function? onTap;
  final int? status;

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
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
                left: 3.5.w,
                top: 4.w,
                child: OutlinedText(
                  text: Utils.getPlayBaseInfo(playerId).grade,
                  textStyle: 21.w4(
                    color: AppColors.c262626,
                    height: 0.8,
                    fontFamily: FontFamily.fRobotoBlack,
                  ),
                ),
              ),
            // Positioned(
            //   top: 4.w,
            //   right: 4.w,
            //   child: Container(
            //     width: 16.w,
            //     height: 16.w,
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(4.w),
            //         color: AppColors.cF2F2F2),
            //     child: IconWidget(
            //       iconWidth: 10.w,
            //       icon: Assets.iconUiIconRead,
            //       iconColor: AppColors.c262626,
            //     ),
            //   ),
            // ),
            if (!ObjectUtil.isEmpty(status))
              Positioned(
                  top: 2.5.w,
                  right: 2.5.w,
                  child: Column(
                    children: [
                      IconWidget(
                          iconWidth: 13.5.w, icon: Utils.getStatusUrl(status)),
                      2.vGap,
                      if (Utils.getPlayBaseInfo(playerId).injuries)
                        IconWidget(
                          iconWidth: 11.w,
                          icon: Assets.commonUiCommonIconInjury,
                        )
                    ],
                  )),
            // if (Utils.getPlayBaseInfo(playerId).injuries)
          ],
        ),
      ),
    );
  }
}
