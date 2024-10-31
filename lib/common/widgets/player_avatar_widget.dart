/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-29 17:10:16
 * @LastEditTime: 2024-10-31 15:24:07
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/index.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/29/11:08

class PlayerAvatarWidget extends StatelessWidget {
  const PlayerAvatarWidget({
    super.key,
    this.grade,
    required this.width,
    this.backgroundColor = AppColors.c666666,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.cFFFFFF,
    this.showGrade = true,
    this.playerId = 1284,
    this.getXRouteId,
  });

  final String? grade;
  final int playerId;
  final double width;
  final Color? backgroundColor;
  final double? radius;
  final double fontSize;
  final Color fontColor;
  final bool showGrade;
  final int? getXRouteId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteNames.picksPlayerDetail,
          arguments: PlayerDetailPageArguments(playerId), id: getXRouteId),
      child: ClipRRect(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? (width / 2)),
              child: Container(
                color: backgroundColor,
                height: width,
                width: width,
                child: ExtendedImage.network(
                  Utils.getPlayUrl(playerId),
                  fit: BoxFit.fitHeight,
                  loadStateChanged: (status) {
                    switch (status.extendedImageLoadState) {
                      case LoadState.loading:
                      case LoadState.failed:
                        return IconWidget(
                            iconWidth: width - 10,
                            icon: Assets.uiDefault_04Png);
                      default:
                    }
                  },
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Visibility(
                  visible: showGrade,
                  child: Text(
                    Utils.formatGrade(grade ?? 'SS'),
                    style: 14.w7(color: fontColor),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
