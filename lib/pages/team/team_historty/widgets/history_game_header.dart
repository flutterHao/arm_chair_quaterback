import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_historty/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryGameHeaderWidget extends GetView<TeamHistortyController> {
  const HistoryGameHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.w,
      margin: EdgeInsets.only(bottom: 1.w),
      decoration: BoxDecoration(color: AppColors.cFFFFFF, boxShadow: [
        BoxShadow(
            color: AppColors.cDEDEDE,
            offset: Offset(0, 9.w),
            blurRadius: 9.w,
            spreadRadius: -5.w)
      ]),
      child: Column(
        children: [
          12.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              children: [
                16.hGap,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.w),
                      border: Border.all(color: AppColors.c1F8FE5, width: 1.w)),
                  child: ImageWidget(
                    url: Utils.getAvatarUrl(
                        controller.gameSchedule.homeTeamLogo),
                    imageFailedPath: Assets.teamUiHead01,
                    width: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                ),
                10.hGap,
                Container(
                  width: 45.w,
                  alignment: Alignment.centerLeft,
                  child: AnimatedNum(
                    number: controller.gameSchedule.homeScore,
                    milliseconds: 300,
                    textStyle: 24.w7(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                ),
                Expanded(
                    child: Center(
                        child: Text(
                  "FINAL",
                  style: 12.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoRegular),
                ))),
                Container(
                  width: 45.w,
                  alignment: Alignment.centerRight,
                  child: AnimatedNum(
                    number: controller.gameSchedule.awayScore,
                    milliseconds: 300,
                    textStyle: 24.w7(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fOswaldBold),
                  ),
                ),
                10.hGap,
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19.w),
                      border: Border.all(color: AppColors.cD60D20, width: 1.w)),
                  child: ImageWidget(
                    url: Utils.getAvatarUrl(
                        controller.gameSchedule.awayTeamLogo),
                    imageFailedPath: Assets.teamUiHead03,
                    width: 36.w,
                    borderRadius: BorderRadius.circular(18.w),
                  ),
                ),
                16.hGap,
              ],
            ),
          ),
          5.vGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.hGap,
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 118.w,
                    child: Center(
                      child: Text(
                        controller.gameSchedule.homeTeamName,
                        style: 12.w5(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                  5.vGap,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.5.w),
                    child: SizedBox(
                        width: 118.w,
                        height: 9.w,
                        child: _buildPrePercentWidget(controller
                            .gameResultInfoEntity.homeTeamResult.strength)),
                  ),
                  5.vGap,
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 118.w,
                    child: Center(
                      child: Text(
                        controller.gameSchedule.awayTeamName,
                        style: 12.w5(
                            color: AppColors.c000000,
                            height: 1,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                  ),
                  5.vGap,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.5.w),
                    child: SizedBox(
                        width: 118.w,
                        height: 9.w,
                        child: _buildPrePercentWidget(controller
                            .gameResultInfoEntity.awayTeamResult.strength)),
                  ),
                  5.vGap,
                ],
              ),
              24.hGap,
            ],
          )
        ],
      ),
    );
  }

  Stack _buildPrePercentWidget(double v) {
    print('value:$v');
    double value = max(0, v);
    var firstMaxValue = 1.44;
    var secondMaxValue = 0.06;
    return Stack(
      children: [
        Container(
          width: 118.w,
          height: 7.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.c666666, width: 1.w),
            borderRadius: BorderRadius.circular(4.5.w),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 118.w * min(1, (value / firstMaxValue)),
              height: 7.w,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(3.5.w)),
                  gradient: const LinearGradient(
                      colors: [AppColors.cB3B3B3, AppColors.c000000])),
            ),
          ),
        ),
        if (value > firstMaxValue)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.rotate(
                angle: pi / 180 * 180,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 118.w *
                      (min(secondMaxValue, (value - firstMaxValue)) /
                          secondMaxValue),
                  height: 7.w,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(3.5.w)),
                    color: AppColors.c10A86A,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
