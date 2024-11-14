/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-30 11:43:53
 * @LastEditTime: 2024-11-12 14:42:35
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///球员头像
class TrainingAvater extends StatelessWidget {
  const TrainingAvater(
      {super.key, required this.player, required this.isCurrent});

  final TeamPlayerInfoEntity player;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    ///头像
    return AnimatedScale(
      duration: const Duration(milliseconds: 100),
      // scale: isCurrent ? 1 : 0.9,
      scale: 1,
      child: Container(
        width: 46.w,
        height: 61.w,
        alignment: Alignment.center,
        // color: Colors.red,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.cFF7954, width: 2),
          color: AppColors.cF2F2F2,
          borderRadius: BorderRadius.circular(9.w),
        ),
        child: ImageWidget(
          url: Utils.getPlayUrl(player.playerId),
          imageFailedPath: Assets.iconUiDefault04,
          borderRadius: BorderRadius.circular(7.w),
          width: 46.w,
          height: 61.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
