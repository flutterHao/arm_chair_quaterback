/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-30 11:43:53
 * @LastEditTime: 2024-12-03 10:44:20
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

///球员头像
class TrainingAvater extends GetView<TrainingController> {
  const TrainingAvater(
      {super.key, required this.player, required this.isCurrent});

  final TeamPlayerInfoEntity player;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    ///头像
    return Container(
      width: 55.w,
      height: 74.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      alignment: Alignment.center,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: 55.w,
            height: 74.w,
            // width: isCurrent ? 46.w * scale : 46.w,
            // height: isCurrent ? 61.w * scale : 61.w,
            alignment: Alignment.center,
            // color: Colors.red,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(9.w),
            ),
            child: ImageWidget(
              url: Utils.getPlayUrl(player.playerId),
              imageFailedPath: Assets.iconUiDefault04,
              borderRadius: BorderRadius.circular(7.w),
              width: 55.w,
              height: 74.w,
              fit: BoxFit.cover,
            ),
          ),
          if (!isCurrent && controller.playerScrollerEnd)
            Container(
              width: 55.w,
              height: 74.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(9.w),
              ),
            ),
        ],
      ),
    );
  }
}
