import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
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
      {super.key,
      this.backgroudColor,
      required this.player,
      required this.isCurrent});

  final Color? backgroudColor;
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
      child: Stack(
        children: [
          Container(
            width: isCurrent ? 66.w : 64.w,
            height: isCurrent ? 66.w : 64.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: isCurrent
                  ? Border.all(color: AppColors.cFF7954, width: 2)
                  : null,
              color: backgroudColor ?? AppColors.c262626,
              borderRadius: BorderRadius.circular(32.w),
            ),
          ),
          Positioned(
            child: ImageWidget(
              url: Utils.getPlayUrl(player.playerId),
              imageFailedPath: Assets.head_0000Png,
              width: 64.w,
              height: 64.w,
              borderRadius: BorderRadius.circular(32.w),
            ),
          ),
          Positioned(
            top: 1.5.w,
            right: 0.5.w,
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
    );
  }
}
