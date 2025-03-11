import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/controller.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/claim_status.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/widgets/row_reward.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BattleBottomRewardWidget extends GetView<SeasonPassController> {
  const BattleBottomRewardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<String> rewardList = [];
      BattleRewardType type = BattleRewardType.notReceived;
      controller.nowbattleRewardList;
      if (controller.nowbattleRewardList.length > 1) {
        rewardList = controller
            .nowbattleRewardList[controller.nowbattleRewardList.length - 1]
            .fixReward
            .split('|');
        var index = controller.nowbattleRewardList.length - 1;
        controller.battlePassInfo.value.claimedRewardMaps[
            '${controller.nowbattleRewardList[index].level}'];
        type = controller.battlePassInfo.value.value >=
                    controller.nowbattleRewardList[index].threshold &&
                controller.battlePassInfo.value.claimedRewardMaps[
                        '${controller.nowbattleRewardList[index].level}'] ==
                    2
            ? BattleRewardType.received
            : controller.battlePassInfo.value.value >=
                    controller.nowbattleRewardList[index].threshold
                ? BattleRewardType.canReceived
                : BattleRewardType.notReceived;
      }
      return Container(
        height: 94.w + Utils.getPaddingBottom(),
        padding: EdgeInsets.only(right: 16.w),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: AppColors.cDEDEDE, blurRadius: 5, spreadRadius: 5)
        ]),
        child: Row(
          children: [
            Container(
              width: 64.w,
              padding: EdgeInsets.only(left: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.vGap,
                  Container(
                    width: 24.w,
                    height: 24.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.getTeamColor(controller.teamId),
                      borderRadius: BorderRadius.circular(12.w),
                    ),
                    child: Text(
                      '${controller.nowbattleRewardList.length}',
                      style: 14.w5(
                          color: Colors.white,
                          fontFamily: FontFamily.fOswaldRegular),
                    ),
                  )
                ],
              ),
            ),
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
                    type,
                    controller
                        .nowbattleRewardList[
                            controller.nowbattleRewardList.length - 1]
                        .level),
                12.hGap,
              ],
            )),
          ],
        ),
      );
    });
  }
}
