import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
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
        return MtInkWell(
            onTap: () {
              Get.to(SelectTeamPage());
            },
            child: Container(
              height: 96.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(9.w)),
              child: Row(
                children: [
                  ImageWidget(
                    url: Utils.getTeamUrl(105),
                    width: 96.w,
                    height: 96.w,
                  ),
                  4.hGap,
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
                                  fontFamily: FontFamily.fOswaldMedium,
                                  height: 1)),
                          Spacer(),
                          IconWidget(
                            icon: Assets.commonUiCommonIconSystemInfo,
                            iconWidth: 14.w,
                            iconHeight: 12.w,
                            iconColor: Colors.black,
                          )
                        ],
                      ),
                      4.vGap,
                      OutLineProgressWidget(
                        width: 120.w,
                        height: 5.w,
                        progress: .2,
                        progressColor: AppColors.c000000,
                        border: Border.all(color: AppColors.c000000, width: 1),
                      ),
                      8.vGap,
                      Row(children: [
                        Container(
                          width: 24.w,
                          height: 27.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              color: AppColors.cA6A6A6.withOpacity(.1)),
                          child: Text(
                            '00',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            ':',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
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
                            '00',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            ':',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
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
                            '00',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            ':',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
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
                            '00',
                            style: 14.w5(fontFamily: FontFamily.fOswaldMedium),
                          ),
                        )
                      ])
                    ],
                  ))
                  // IconWidget(icon: )
                ],
              ),
            ));
      },
    );
  }
}
