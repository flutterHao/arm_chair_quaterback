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
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/29/11:08

class PlayerAvatarWidget extends StatelessWidget {
  const PlayerAvatarWidget({
    super.key,
    required this.playerBaseInfo,
    required this.width,
    this.height,
    this.backgroundColor = AppColors.c666666,
    this.radius,
    this.fontSize = 14,
    this.fontColor = AppColors.cFFFFFF,
    this.imageWidth,
    this.imageHeight,
    this.showGrade = true,
  });

  final NbaPlayerInfosPlayerBaseInfoList? playerBaseInfo;
  final double width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final Color? backgroundColor;
  final double? radius;
  final double fontSize;
  final Color fontColor;
  final bool showGrade;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteNames.picksPlayerDetail,arguments: PlayerDetailPageArguments(1284)),//todo 添加真实的参数
      child: Container(
        width: width,
        height: height ?? width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius??width / 2)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius??width / 2),
                  child: ExtendedImage.network(
                    Utils.getPlayUrl(playerBaseInfo?.playerId),
                    fit: BoxFit.fitWidth,
                    width: imageWidth ?? width - 5,
                    loadStateChanged: (status) {
                      switch (status.extendedImageLoadState) {
                        case LoadState.loading:
                        case LoadState.failed:
                          return IconWidget(
                              iconWidth: imageWidth ?? width - 5,
                              icon: Assets.testTeamLogoPng);
                        default:
                      }
                    },
                  ),
                )),
            Positioned(
                top: 0,
                left: 0,
                child: Visibility(
                  visible: showGrade,
                  child: Text(
                    playerBaseInfo?.grade ?? 'SS',
                    style: 14.w7(color: fontColor),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
