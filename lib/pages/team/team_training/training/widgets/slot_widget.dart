/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-12 14:47:24
 * @LastEditTime: 2024-11-13 18:52:44
 */
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SlotMachine extends GetView<TrainingController> {
  const SlotMachine({super.key});

  Widget _buildSlotItem(int realIndex) {
    return SizedBox(
        width: 50.w,
        height: 68.w,
        child: IconWidget(
          iconWidth: 30.w,
          icon: Utils.getPropIconUrl(controller.propList[realIndex]),
          iconColor: Colors.black,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return Expanded(
                child: Center(
                    child: Container(
                        width: 50.w,
                        height: 68.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9.w),
                        ),
                        child: Stack(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              controller: controller.scrollerCtrlList[index],
                              itemCount: controller.propList.length * 10,
                              itemBuilder: (context, itemIndex) {
                                int realIndex =
                                    itemIndex % controller.propList.length;
                                return _buildSlotItem(realIndex);
                              },
                            ),
                            Obx(() {
                              return Visibility(
                                visible: !controller.slotCard[index].value,
                                child: Container(
                                  width: 50.w,
                                  height: 68.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9.w),
                                  ),
                                  child: IconWidget(
                                    iconWidth: 16.w,
                                    icon: Assets.managerUiManagerTrainingUnknown,
                                    iconColor: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                              );
                            })
                          ],
                        ))),
              );
            }),
          ),
        ),
        22.vGap,
        Row(
          children: [
            Text(
              "COST:",
              style: 16.w7(
                  color: AppColors.c262626,
                  fontFamily: FontFamily.fOswaldMedium,
                  height: 0.7),
            ),
            7.hGap,
            IconWidget(iconWidth: 21.w, icon: Assets.teamUiIconBasketball),
            4.hGap,
            Text(
              "1",
              style: 16.w7(color: AppColors.c262626),
            )
          ],
        ),
        5.vGap,
        MtInkwell(
          onTap: () => controller.startSlot(),
          child: Container(
            width: 188.w,
            height: 41.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.c000000,
                borderRadius: BorderRadius.circular(9.w)),
            child: Text(
              "Start",
              style: 19.w4(
                color: AppColors.cFFFFFF,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
