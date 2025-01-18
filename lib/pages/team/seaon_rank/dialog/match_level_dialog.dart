import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MatchLevelDialog extends GetView<SeaonRankController> {
  const MatchLevelDialog({super.key});

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
              'Match Level',
              style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
            ),
          ),
          10.vGap,
          const Divider(
            height: 1,
            color: AppColors.cD4D4D4,
          ),
          Expanded(
              child: Obx(() => ListView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                    itemCount: controller.cupDefineList.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return _matchLevelItemWidget(index);
                    },
                  )))
        ],
      ),
    ));
  }

  Widget _matchLevelItemWidget(int index) {
    return Stack(
      children: [
        index != controller.cupDefineList.length - 1 && index != 0
            ? Positioned(
                left: 22.w,
                top: 0,
                bottom: 0,
                child: Container(width: 2.w, color: AppColors.cB3B3B3),
              )
            : Positioned(
                left: 22.w,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 2.w,
                  child: Column(
                    children: [
                      if (index == controller.cupDefineList.length - 1)
                        const Spacer(),
                      Expanded(
                        child: Container(
                            width: 2.w,
                            height: double.infinity,
                            color: AppColors.cB3B3B3),
                      ),
                      if (index == 0) const Spacer(),
                    ],
                  ),
                ),
              ),
        Container(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.hGap,
              Container(
                width: 26.w,
                height: 26.w,
                color: AppColors.cFFFFFF,
                alignment: Alignment.center,
                child: Container(
                  width: 15.w,
                  height: 15.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: AppColors.c4D4D4D, shape: BoxShape.circle),
                  child: Container(
                    width: 9.w,
                    height: 9.w,
                    decoration: const BoxDecoration(
                        color: AppColors.cF2F2F2, shape: BoxShape.circle),
                  ),
                ),
              ),
              30.hGap,
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                child: Row(
                  children: [
                    IconWidget(
                        iconWidth: 46.w,
                        icon:
                            'assets/images/manager/${controller.cupDefineList[index].cupPicId}.png',
                        fieldPath: Assets.managerUiManagerGameGrade01),
                    16.hGap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.cupDefineList[index].backUp,
                            style: 16.w5(fontFamily: FontFamily.fOswaldRegular),
                          ),
                          Container(
                              child: Row(
                            children: [
                              IconWidget(
                                  iconWidth: 15.w,
                                  icon: Assets.managerUiManagerIconCurrency04),
                              5.hGap,
                              Text(
                                ' ${controller.cupDefineList[index].cupNum[1].toInt()}',
                                style:
                                    14.w5(fontFamily: FontFamily.fOswaldMedium),
                              ),
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }
}
