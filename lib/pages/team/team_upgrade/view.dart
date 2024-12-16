import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamUpgradePage extends GetView<TeamUpgradeController> {
  const TeamUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    var playerId = Get.arguments['playerId'];
    return GetBuilder<TeamUpgradeController>(
      init: TeamUpgradeController(playerId),
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            showPop: true,
          ),
          bodyWidget: Expanded(
            child: Obx(() {
              if (controller.loadStatus.value != LoadDataStatus.success) {
                return Center(
                  child: LoadStatusWidget(
                    loadDataStatus: controller.loadStatus.value,
                  ),
                );
              }
              return Column(
                children: [
                  Container(
                    height: 117.w,
                    width: double.infinity,
                    color: Utils.getTeamColor(controller.playerBaseInfo.teamId),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            36.hGap,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                18.vGap,
                                Container(
                                  width: 29.w,
                                  height: 16.w,
                                  margin: EdgeInsets.only(right: 3.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.c000000,
                                      borderRadius: BorderRadius.circular(2.w)),
                                  child: Text(
                                    controller.teamPlayerInfo.position > 0
                                        ? "MAIN"
                                        : "SUB",
                                    style: 10.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium,
                                    ),
                                  ),
                                ),
                                ImageWidget(
                                  url: Utils.getPlayUrl(playerId),
                                  imageFailedPath: Assets.iconUiDefault04,
                                  height: 82.w,
                                  fit: BoxFit.fitWidth,
                                )
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
                                          fontFamily:
                                              FontFamily.fRobotoRegular),
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
                                            fontFamily:
                                                FontFamily.fRobotoRegular),
                                      ),
                                      10.hGap,
                                      IconWidget(
                                          iconWidth: 16.w,
                                          icon: Utils.getStatusUrl(controller
                                              .teamPlayerInfo.playerStatus)),
                                      6.hGap,
                                      IconWidget(
                                          iconWidth: 16.w,
                                          icon:
                                              Assets.commonUiCommonIconInjury),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                            top: 18.w,
                            left: 19.w,
                            bottom: 8.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    Text(
                                      "S",
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
                                      "S",
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
                                        icon:
                                            Assets.managerUiManagerPlayerstar),
                                    Text(
                                      "${controller.teamPlayerInfo.getBreakThroughGrade()}",
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
                  )
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
