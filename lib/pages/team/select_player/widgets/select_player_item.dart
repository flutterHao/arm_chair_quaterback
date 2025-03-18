import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectPlayerItemWidget extends StatelessWidget {
  const SelectPlayerItemWidget(
      {required this.playerId, required this.isSelect, super.key});
  final int playerId;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    NbaPlayerInfosPlayerBaseInfoList player = Utils.getPlayBaseInfo(playerId);
    return Stack(
      children: [
        Container(
          height: 106.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(color: AppColors.cD9D9D9)),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              MtInkWell(
                  onTap: () => Get.toNamed(RouteNames.picksPlayerDetail,
                      arguments: PlayerDetailPageArguments(playerId)),
                  child: Container(
                    width: 106.w,
                    decoration: BoxDecoration(
                      color: Utils.getTeamColor(
                          Utils.getPlayBaseInfo(playerId).teamId),
                    ),
                    child: Center(
                      child: ImageWidget(
                        url: Utils.getPlayUrl(playerId),
                        width: 106.w,
                        height: 106.w,
                        // loadingWidget: const SizedBox.shrink(),
                        errorWidget: const SizedBox.shrink(),
                      ),
                    ),
                  )),
              18.hGap,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.vGap,
                  Text(Utils.getPlayBaseInfo(playerId).ename.toUpperCase(),
                      style: 24
                          .w5(height: 1, fontFamily: FontFamily.fOswaldMedium)),
                  8.vGap,
                  Text(
                      '${Utils.getTeamInfo(player.teamId).shortEname} · ${player.position} ',
                      style: 12.w5(
                          fontFamily: FontFamily.fOswaldRegular,
                          color: AppColors.cB3B3B3)),
                ],
              ))
            ],
          ),
        ),
        Positioned(
            bottom: 10.w,
            right: 10.w,
            child: InkWell(
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: isSelect ? AppColors.c10A86A : AppColors.cB3B3B3,
                  shape: BoxShape.circle,
                ),
                child:
                    IconWidget(icon: Assets.iconUiIconConfirm, iconWidth: 18.w),
              ),
            ))
      ],
    );
  }
}
