import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog_top_btn.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeasonRewardDialog extends GetView<SeaonRankController> {
  const SeasonRewardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDragBackWidget(
      child: GetBuilder<SeaonRankController>(builder: (controller) {
        return Container(
          height: 650.h,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
          child: Column(
            children: [
              const DialogTopBtn(),
              10.vGap,
              Container(
                padding: EdgeInsets.only(left: 16.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Season Rewards',
                  style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
              10.vGap,
              const Divider(
                height: 1,
                color: AppColors.cD4D4D4,
              ),
              Expanded(
                  child: Obx(() => ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: controller.cupDefineList.length,
                        itemBuilder: (context, index) {
                          return _rewardsItemWidget(index);
                        },
                        separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.cD4D4D4),
                      )))
            ],
          ),
        );
      }),
    );
  }

  Widget _rewardsItemWidget(int index) {
    ///判断是否满足领取条件
    ///满足领取条件段位id <= 当前段位id
    bool isShowReceive = controller.cupDefineList[index].cupNumId <= controller.teamSimpleEntity.value.cupRankId;

    /// 判断是否已经领取
    RxBool haveReceive = controller.teamSimpleEntity.value.receivedRewards
        .split(',')
        .toList()
        .contains(controller.cupDefineList[index].cupNumId.toString())
        .obs;

    ///赛季奖励数据转list
    List<String> cupRewardList = controller.cupDefineList[index].cupReward.split('|');
    Widget cupRewardWidget = Container(
      padding: EdgeInsets.all(13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This season reached:${controller.cupDefineList[index].backUp}',
            style: 12.w5(fontFamily: FontFamily.fRobotoRegular),
          ),
          10.vGap,
          Row(
            children: [
              ...cupRewardList.map((cupItem) {
                int propId = int.tryParse(cupItem.split('_')[1]) ?? 0;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.w),
                  height: 57.w,
                  child: Column(
                    children: [
                      Expanded(
                          child: IconWidget(
                              iconWidth: 41.w,
                              iconHeight: 41.w,
                              fit: BoxFit.contain,
                              fieldPath: Assets.managerUiManagerGift00,
                              icon: Utils.getPropIconUrl(propId))),
                      Text(controller.formatToK(int.parse(cupItem.split('_')[2])),
                          style: 14.w5(fontFamily: FontFamily.fOswaldRegular))
                    ],
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );

    return Stack(
      children: [
        if (isShowReceive && haveReceive.value)
          ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.cF2F2F2.withOpacity(.4),
                    AppColors.cF2F2F2.withOpacity(.4),
                  ],
                ).createShader(bounds);
              },
              child: cupRewardWidget)
        else
          cupRewardWidget,
        if (isShowReceive && haveReceive.value)
          Positioned(
              right: 18.w,
              bottom: 32.w,
              child: MtInkWell(
                  child: Container(
                width: 59.w,
                height: 40.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.w), border: Border.all(color: AppColors.cE6E6E)),
                child: IconWidget(
                    iconWidth: 21.w, iconColor: AppColors.c10A86A, icon: Assets.commonUiCommonStatusBarMission02),
              )))
        else if (isShowReceive)
          Positioned(
              right: 18.w,
              bottom: 32.w,
              child: MtInkWell(
                  onTap: () {
                    haveReceive.value = true;
                    controller.receiveReward(controller.cupDefineList[index].cupNumId);
                  },
                  child: Container(
                    width: 59.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.w), color: AppColors.c000000),
                    child: Text('claim'.toUpperCase(),
                        style: 16.w5(color: Colors.white, fontFamily: FontFamily.fOswaldMedium)),
                  )))
      ],
    );
  }
}
