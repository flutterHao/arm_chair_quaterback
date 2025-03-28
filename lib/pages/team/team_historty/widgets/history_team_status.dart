import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/support_percent_progress_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';

import 'package:arm_chair_quaterback/pages/team/team_historty/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HistoryTeamStatsWidget extends StatelessWidget {
  HistoryTeamStatsWidget({super.key});

  final TeamHistortyController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return _buildTeamStatsWidget(context);
  }

  Container _buildTeamStatsWidget(BuildContext context) {
    var teamStatsData = controller.getTeamStatsData();
    var expansionList =
        teamStatsData.length > 4 ? teamStatsData.sublist(4) : [];
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          25.vGap,
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LangKey.nbaTeamMeanTeamStats.tr,
                  style: 30.w7(
                      color: AppColors.c000000,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                // Container(
                //   width: 24.w,
                //   height: 24.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(4.w),
                //       border: Border.all(color: AppColors.c666666, width: 1)),
                //   child: IconWidget(
                //     iconWidth: 15.w,
                //     icon: Assets.commonUiCommonIconSystemShare,
                //     iconColor: AppColors.c000000,
                //   ),
                // )
              ],
            ),
          ),
          25.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 29.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.c1F8FE5, width: 1.w),
                          borderRadius: BorderRadius.circular(15.w)),
                      child: ImageWidget(
                        url: Utils.getAvatarUrl(
                            controller.gameSchedule.homeTeamLogo),
                        imageFailedPath: Assets.teamUiHead01,
                        width: 23.w,
                        height: 23.w,
                        borderRadius: BorderRadius.circular(14.w),
                      ),
                    ),
                    7.hGap,
                    Text(
                      controller.gameSchedule.homeTeamName,
                      style: 16.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      controller.gameSchedule.awayTeamName,
                      style: 16.w5(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium),
                    ),
                    7.hGap,
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.cD60D20, width: 1.w),
                          borderRadius: BorderRadius.circular(15.w)),
                      child: ImageWidget(
                        url: Utils.getAvatarUrl(
                            controller.gameSchedule.awayTeamLogo),
                        imageFailedPath: Assets.teamUiHead03,
                        width: 23.w,
                        height: 23.w,
                        borderRadius: BorderRadius.circular(14.w),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          10.vGap,
          const Divider(
            color: AppColors.cD1D1D1,
            height: 1,
          ),
          if (teamStatsData.isEmpty)
            SizedBox(
              height: 300.w,
              child: const Center(
                child: LoadStatusWidget(
                  loadDataStatus: LoadDataStatus.noData,
                ),
              ),
            )
          else
            ...List.generate(min(4, teamStatsData.length), (index) {
              var item = teamStatsData[index];
              return _teamStatsItemWidget(item);
            }),
          if (teamStatsData.length > 4)
            Column(
              children: [
                Obx(() {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    firstChild: const SizedBox.shrink(),
                    secondChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: expansionList
                          .map((e) => _teamStatsItemWidget(e))
                          .toList(),
                    ),
                    crossFadeState: controller.isExpanded.value
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                  );
                }),
                InkWell(
                  onTap: () {
                    controller.isExpanded.value = !controller.isExpanded.value;
                    if (controller.isExpanded.value) {
                      controller.expandedTurns.value += 0.5;
                    } else {
                      controller.expandedTurns.value -= 0.5;
                    }
                  },
                  child: Container(
                    height: 60.w,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LangKey.gameButtonUnfold.tr,
                          style: 16.w7(
                              color: AppColors.c262626,
                              height: 1,
                              fontFamily: FontFamily.fOswaldBold),
                        ),
                        4.vGap,
                        Obx(() {
                          return AnimatedRotation(
                            turns: controller.expandedTurns.value,
                            duration: const Duration(milliseconds: 300),
                            child: IconWidget(
                              iconWidth: 5.w,
                              icon: Assets.commonUiCommonIconSystemJumpto,
                              iconColor: AppColors.c000000,
                              rotateAngle: 90,
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _teamStatsItemWidget(TeamStats item) {
    var leftPercent =
        (item.leftValue + 2) / (item.rightValue + item.leftValue + 4) * 100;
    return Container(
      height: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${item.leftValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              ),
              Text(
                item.name,
                style: 10.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular),
              ),
              Text(
                "${item.rightValue}",
                style: 16.w4(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldRegular),
              )
            ],
          ),
          3.5.vGap,
          SupportPercentProgressWidget(
            height: 12.w,
            leftPercent: leftPercent.toInt(),
            leftColor: AppColors.cB3B3B3,
            rightPercent: (100 - leftPercent).toInt(),
            rightColor: AppColors.c000000,
          )
        ],
      ),
    );
  }
}
