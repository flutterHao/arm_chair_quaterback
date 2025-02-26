import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_gift/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomGiftWidget extends GetView<TeamGiftController> {
  const BottomGiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Container(height: 294.h + Utils.getPaddingBottom()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 252.h + Utils.getPaddingBottom(),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 62.h),
                  Container(
                    height: 152.h,
                    child: Obx(() => ListView.separated(
                          itemCount: controller.girlGiftDefineList.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemBuilder: (context, index) {
                            List<String> costList = controller.girlGiftDefineList[index].cost.split('_').toList();
                            return MtInkWell(
                                child: Container(
                              width: 100.h,
                              decoration:
                                  BoxDecoration(color: AppColors.c000000, borderRadius: BorderRadius.circular(9.h)),
                              child: Column(
                                children: [
                                  Container(
                                    height: 128.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.cFFFFFF,
                                        borderRadius: BorderRadius.circular(9.h),
                                        border: Border.all(color: AppColors.c666666, width: 1)),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 2.h),
                                        Text(
                                          controller.girlGiftDefineList[index].desc,
                                        ),
                                        Spacer(),
                                        IconWidget(
                                          icon: Utils.getPropIconUrl(controller.girlGiftDefineList[index].id),
                                          iconHeight: 50.h,
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            IconWidget(
                                              iconWidth: 21.h,
                                              icon: Assets.cheerleadersUiCheerleadersIconIntimacy,
                                            ),
                                            Text(
                                              '+${controller.girlGiftDefineList[index].addIntimacy[0]}~${controller.girlGiftDefineList[index].addIntimacy[1]}',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconWidget(
                                        icon: Utils.getPropIconUrl(int.tryParse(costList[1])),
                                        iconHeight: 20.h,
                                      ),
                                      Text('${costList[2]}${costList[1] == "102" ? "K" : ""}',
                                          style: 16.w5(color: Colors.white))
                                    ],
                                  ))
                                ],
                              ),
                            ));
                          },
                          separatorBuilder: (context, index) => SizedBox(width: 16.w),
                        )),
                  )
                ],
              ),
            ),
          ),
          Positioned(top: 0, left: 16.w, right: 16.w, child: _deepAffectionWidget())
        ],
      ),
    );
  }

  Widget _deepAffectionWidget() {
    return Container(
      height: 84.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(color: AppColors.c000000, borderRadius: BorderRadius.circular(9.w)),
      child: Row(
        children: [
          Container(
            height: 56.h,
            width: 56.h,
            decoration: BoxDecoration(color: AppColors.cB3B3B3, borderRadius: BorderRadius.circular(6.h)),
          ),
          SizedBox(width: 10.h),
          Expanded(
              child: Container(
            height: 64.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'deep affeation'.toUpperCase(),
                      style: 16.w5(
                        height: 1,
                        color: AppColors.cFFFFFF,
                        fontFamily: FontFamily.fOswaldMedium,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'invalid'.toUpperCase(),
                      style: 12.w5(color: AppColors.cE34D4D, fontFamily: FontFamily.fOswaldRegular),
                    )
                  ],
                ),
                Flexible(
                    child: Text(
                  'In a state of deep affection,the girl’s charm  is increased by 70%',
                  style: 12.w5(
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
