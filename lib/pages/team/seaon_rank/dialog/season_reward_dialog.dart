import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
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
        child: Container(
      height: 650.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 8.5.w, bottom: 17.5.w),
            width: 44.w,
            height: 4.w,
            decoration: BoxDecoration(
                color: AppColors.c000000.withOpacity(0.2),
                borderRadius: BorderRadius.circular(2.w)),
          ),
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
              child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: 20,
            itemBuilder: (context, index) {
              return _rewardsItemWidget();
            },
            separatorBuilder: (context, index) =>
                const Divider(height: 1, color: AppColors.cD4D4D4),
          ))
        ],
      ),
    ));
  }

  Widget _rewardsItemWidget() {
    return Container(
      padding: EdgeInsets.all(13.w),
      // decoration: BoxDecoration(
      //     color: AppColors.cF2F2F2, borderRadius: BorderRadius.circular(9.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'This season reached: Legendary Manager 4',
            style: 12.w5(fontFamily: FontFamily.fRobotoRegular),
          ),
          10.vGap,
          Row(
            children: [
              ...List.generate(
                  3,
                  (index) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 2.w),
                        height: 57.w,
                        child: Column(
                          children: [
                            Expanded(
                                child: IconWidget(
                                    iconWidth: 41.w,
                                    iconHeight: 38.w,
                                    icon: Assets.managerUiManagerGift01)),
                            Text('$index k',
                                style: 14
                                    .w5(fontFamily: FontFamily.fOswaldRegular))
                          ],
                        ),
                      )),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 7.w),
                child: MtInkWell(
                    child: Container(
                  width: 59.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: Border.all(color: AppColors.c666666)),
                  child: IconWidget(
                      iconWidth: 29.w,
                      icon: Assets.managerUiManagerMissionReward),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
