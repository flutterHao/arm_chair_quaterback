import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/color_grey_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/select_team.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SeasonPassWidget extends GetView<SeasonPassController> {
  const SeasonPassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeasonPassController>(
      init: SeasonPassController(),
      id: "season_pass",
      builder: (_) {
        return Obx(() {
          controller.battlePassInfo.value.hostTeam;
          bool isselectTeam = controller.battlePassInfo.value.hostTeam != 0;
          return MtInkWell(
              onTap: () {
                isselectTeam
                    ? Get.to(BattlePassPage(), arguments: controller.teamId)
                    : Get.to(SelectTeamPage());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    Container(
                      height: 96.w,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                          color: isselectTeam
                              ? controller.getTeamColor(controller.teamId)
                              : Colors.white,
                          border: isselectTeam
                              ? null
                              : Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(9.w)),
                      child: Row(
                        children: [
                          seasonLogoWidget(isselectTeam),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.vGap,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('BATTLT PASS',
                                      style: 20.w5(
                                          color: isselectTeam
                                              ? AppColors.cFFFFFF
                                              : Colors.black,
                                          fontFamily: FontFamily.fOswaldMedium,
                                          height: 1)),
                                  Spacer(),
                                  IconWidget(
                                    icon: Assets.commonUiCommonIconSystemInfo,
                                    iconWidth: 14.w,
                                    iconHeight: 12.w,
                                    iconColor: isselectTeam
                                        ? AppColors.cFFFFFF
                                        : Colors.black,
                                  )
                                ],
                              ),
                              4.vGap,
                              OutLineProgressWidget(
                                width: 120.w,
                                height: 5.w,
                                progress: .5,
                                progressColor: isselectTeam
                                    ? AppColors.cFFFFFF
                                    : AppColors.c000000,
                                border: Border.all(
                                    color: isselectTeam
                                        ? Colors.white
                                        : AppColors.c7C7C7C,
                                    width: 1),
                              ),
                              8.vGap,
                              _remainingTimeWidget(isselectTeam)
                            ],
                          ))
                        ],
                      ),
                    ),
                    isselectTeam
                        ? Positioned(
                            bottom: -60.w,
                            right: -40.w,
                            child: Opacity(
                              opacity: .05,
                              child: ImageWidget(
                                url: Utils.getTeamUrl(controller.teamId),
                                width: 146.w,
                                height: 146.w,
                              ),
                            ))
                        : SizedBox()
                  ],
                ),
              ));
        });
      },
    );
  }

  Widget seasonLogoWidget(bool isselectTeam) {
    return isselectTeam
        ? ImageWidget(
            url: Utils.getTeamUrl(controller.teamId),
            width: 96.w,
            height: 96.w,
          )
        : Container(
            height: 74.w,
            width: 74.w,
            margin: EdgeInsets.only(right: 20.w),
            decoration: BoxDecoration(
                color: AppColors.cA3A3A3.withOpacity(.5),
                shape: BoxShape.circle),
            child: Opacity(
                opacity: .1,
                child: ColorGreyWidget(
                    child: IconWidget(
                  icon: Assets.common100,
                  iconWidth: 74.w,
                ))),
          );
  }

  Widget _remainingTimeWidget(bool isselectTeam) {
    return Obx(() {
      controller.remaining.value;
      return Row(children: [
        Container(
          width: 24.w,
          height: 27.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: AppColors.cA6A6A6.withOpacity(.1)),
          child: Text(
            controller.days,
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            ':',
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        ),
        Container(
          width: 24.w,
          height: 27.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: AppColors.cA6A6A6.withOpacity(.1)),
          child: Text(
            controller.hours,
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            ':',
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        ),
        Container(
          width: 24.w,
          height: 27.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: AppColors.cA6A6A6.withOpacity(.1)),
          child: Text(
            controller.twoDigitMinutes,
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(':',
              style: 14.w5(
                fontFamily: FontFamily.fOswaldMedium,
                color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
              )),
        ),
        Container(
          width: 24.w,
          height: 27.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: AppColors.cA6A6A6.withOpacity(.1)),
          child: Text(
            controller.twoDigitSeconds,
            style: 14.w5(
              fontFamily: FontFamily.fOswaldMedium,
              color: isselectTeam ? AppColors.cFFFFFF : AppColors.c000000,
            ),
          ),
        )
      ]);
    });
  }
}
