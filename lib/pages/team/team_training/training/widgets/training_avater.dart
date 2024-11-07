/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-30 11:43:53
 * @LastEditTime: 2024-11-07 11:00:59
 */

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///球员头像
class TrainingAvater extends StatelessWidget {
  const TrainingAvater(
      {super.key, required this.player, required this.isCurrent});

  final TeamPlayerInfoEntity player;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    ///头像
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.picksPlayerDetail,
            arguments: PlayerDetailPageArguments(player.playerId));
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        // scale: isCurrent ? 1 : 0.9,
        scale: 0.9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              // width: isCurrent ? 66.w : 64.w,
              // height: isCurrent ? 66.w : 64.w,
              width: 64.w,
              height: 64.w,
              alignment: Alignment.center,
              // color: Colors.red,
              decoration: BoxDecoration(
                // border: isCurrent
                //     ? Border.all(color: AppColors.cFFFFFF, width: 2)
                //     : null,
                color: AppColors.c666666,
                borderRadius: BorderRadius.circular(32.w),
              ),
              child: ImageWidget(
                url: Utils.getPlayUrl(player.playerId),
                imageFailedPath: Assets.uiDefault_04Png,
                width: 64.w,
                height: 64.w,
                borderRadius: BorderRadius.circular(32.w),
              ),
            ),
            if (CacheApi.playerStatusMap[player.playerStatus]?.statsId != null)
              Positioned(
                top: 4.w,
                right: 2.w,
                child: Container(
                  width: 19.w,
                  height: 19.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: IconWidget(
                    iconWidth: 17.w,
                    icon: Assets.uiStateBestPng,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
