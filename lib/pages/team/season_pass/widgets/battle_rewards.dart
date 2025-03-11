import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/claim_status.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/row_reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class BattleRewardsWidget extends GetView<SeasonPassController> {
  const BattleRewardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        padding: EdgeInsets.only(right: 16.w),
        itemCount: controller.nowbattleRewardList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Obx(() {
            BattleRewardType type = controller.battlePassInfo.value.value >=
                        controller.nowbattleRewardList[index].threshold &&
                    controller.battlePassInfo.value.claimedRewardMaps[
                            '${controller.nowbattleRewardList[index].level}'] ==
                        2
                ? BattleRewardType.received
                : controller.battlePassInfo.value.value >=
                        controller.nowbattleRewardList[index].threshold
                    ? BattleRewardType.canReceived
                    : BattleRewardType.notReceived;
            return Row(
              children: [_leftWidget(index, type), _rightWidget(index, type)],
            );
          });
        }));
  }

  Widget _rightWidget(int index, BattleRewardType type) {
    var rewardList = controller.nowbattleRewardList[index].fixReward.split('|');

    return Expanded(
        child: SizedBox(
            height: 98.w + 1,
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    12.hGap,
                    Expanded(
                        child: Opacity(
                      opacity: type == BattleRewardType.received ? .5 : 1,
                      child: RowRewardWidget(rewardList),
                    )),
                    ClaimStatusWidget(
                        type, controller.nowbattleRewardList[index].level),
                    12.hGap,
                  ],
                )),
                Opacity(
                    opacity: index != controller.nowbattleRewardList.length - 1
                        ? 1
                        : 0,
                    child: Divider(height: 1, color: AppColors.cE6E6E6))
              ],
            )));
  }

  Widget _leftWidget(int index, BattleRewardType type) {
    return Obx(
      () {
        int currentIndex = controller.nowbattleRewardList.lastIndexWhere(
            (e) => e.threshold <= controller.battlePassInfo.value.value);
        return Container(
            width: 64.w,
            height: 98.w + 1,
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: index == 0 ? 0 : 1,
                  child: Container(
                    width: 5.w,
                    decoration: BoxDecoration(
                        color: type != BattleRewardType.notReceived
                            ? AppColors.c000000
                            : AppColors.cE6E6E6,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w))),
                    height: 26.w,
                    margin: EdgeInsets.only(left: 9.w),
                  ),
                ),
                Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: type != BattleRewardType.notReceived
                            ? AppColors.c000000
                            : AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      foregroundDecoration: type == BattleRewardType.notReceived
                          ? BoxDecoration(
                              border: Border.all(
                                  color: AppColors.cD1D1D1, width: 1),
                              borderRadius: BorderRadius.circular(12.w),
                            )
                          : null,
                      child: Text(
                        '${controller.nowbattleRewardList[index].level}',
                        style: 14.w5(
                            color: type == BattleRewardType.canReceived
                                ? AppColors.cFFFFFF
                                : AppColors.cD2D2D2,
                            fontFamily: FontFamily.fOswaldRegular),
                      ),
                    ),
                    Visibility(
                        visible: index == currentIndex,
                        child: Positioned(
                            left: -3.w,
                            top: -3.w,
                            child: Container(
                              width: 30.w,
                              height: 30.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: type != BattleRewardType.notReceived
                                        ? AppColors.c000000
                                        : AppColors.cFFFFFF,
                                    width: 1),
                                borderRadius: BorderRadius.circular(28.w),
                              ),
                            ))),
                  ],
                ),
                Spacer(),
                Opacity(
                  opacity: index == controller.nowbattleRewardList.length - 1
                      ? 0
                      : 1,
                  child: Container(
                    width: 5.w,
                    decoration: BoxDecoration(
                        color: type == BattleRewardType.notReceived ||
                                index == currentIndex
                            ? AppColors.cE6E6E6
                            : AppColors.c000000,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.w),
                            topRight: Radius.circular(5.w))),
                    height: 26.w,
                    margin: EdgeInsets.only(left: 9.w),
                  ),
                )
              ],
            ));
      },
    );
  }
}
