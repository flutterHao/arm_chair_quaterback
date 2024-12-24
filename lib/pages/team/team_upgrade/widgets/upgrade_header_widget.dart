import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/24/10:14

class UpgradeHeaderWidget extends GetView<TeamUpgradeController> {
  const UpgradeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._buildHeader(context),
      ],
    );
  }

  List<Widget> _buildHeader(BuildContext context) {
    return [
      Container(
        height: 117.w,
        width: double.infinity,
        color: Utils.getTeamColor(controller.playerBaseInfo.teamId),
        child: Stack(
          children: [
            Row(
              children: [
                20.hGap,
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 116.w,
                      width: 144.w,
                      child: ImageWidget(
                        url: Utils.getPlayUrl(controller.player.playerId),
                        imageFailedPath: Assets.iconUiDefault04,
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Positioned(
                      right: 2.w,
                      top: 18.w,
                      child: Container(
                        width: 29.w,
                        height: 16.w,
                        margin: EdgeInsets.only(right: 3.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(2.w)),
                        child: Text(
                          controller.player.position > 0
                              ? "MAIN"
                              : "SUB",
                          style: 10.w5(
                            color: AppColors.cFFFFFF,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                8.hGap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 16.w4(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                        ),
                      ),
                      4.vGap,
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          controller.getLastName(),
                          style: 24.w5(
                              color: AppColors.cFFFFFF,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium),
                        ),
                      ),
                      11.vGap,
                      Row(
                        children: [
                          Text(
                            "${Utils.getTeamInfo(controller.playerBaseInfo.teamId).shortEname} · ${controller.playerBaseInfo.position}",
                            style: 12.w4(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular),
                          ),
                          10.hGap,
                          IconWidget(
                              iconWidth: 16.w,
                              icon: Utils.getStatusUrl(
                                  controller.player.playerStatus)),
                          6.hGap,
                          if (controller.playerBaseInfo.injuries)
                            IconWidget(
                                iconWidth: 16.w,
                                icon: Assets.commonUiCommonIconInjury),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                top: 18.w,
                left: 16.w,
                bottom: 8.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Text(
                          controller.playerBaseInfo.grade,
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.w
                              ..color = AppColors.cFFFFFF,
                          ),
                        ),
                        Text(
                          controller.playerBaseInfo.grade,
                          style: TextStyle(
                            fontSize: 30.sp,
                            height: 1,
                            color: AppColors.c000000,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        IconWidget(
                            iconWidth: 22.w,
                            icon: Assets.managerUiManagerPlayerstar),
                        Text(
                          "${controller.player.getBreakThroughGrade()}",
                          style: 13.w5(
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fRobotoMedium,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "${controller.playerBaseInfo.playerScore}",
                          style: 19.w7(
                              height: 1,
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                        Text(
                          "OVR",
                          style: 10.w4(
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
      Container(
        height: 37.w,
        width: double.infinity,
        color: AppColors.cFFFFFF,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.hGap,
            Expanded(
              flex: 114,
              child: Container(
                width: 114.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "POWER",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Text(
                      controller.teamPlayerUpStarVoEntity.playerStrength.format(),
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 139,
              child: Container(
                width: 139.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SALARY",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                    Row(
                      children: [
                        IconWidget(
                            iconWidth: 16.w, icon: Assets.commonUiCommonProp05),
                        4.hGap,
                        Text(
                          Utils.formatMoney(controller.playerBaseInfo.salary),
                          style: 12.w4(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            4.hGap,
            Expanded(
              flex: 82,
              child: Container(
                width: 82.w,
                height: 25.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: AppColors.cF2F2F2,
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconWidget(
                        iconWidth: 11.w,
                        icon: Assets.managerUiManagerIconRecover),
                    7.hGap,
                    Text(
                      "${controller.player.power}",
                      style: 12.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
              ),
            ),
            16.hGap
          ],
        ),
      )
    ];
  }
}
