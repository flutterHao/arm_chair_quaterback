import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyList extends GetView<BeautyController> {
  const BeautyList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeautyController>(builder: (context) {
      return Visibility(
        visible: !controller.expandedGirl,
        child: Container(
          height: 192.h,
          color: AppColors.cFFFFFF,
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 112.h + 15.h,
            margin: EdgeInsets.only(bottom: 16.h),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // if (index == 3) return;
                    controller.beautyIndex.value = index;
                    controller.update();
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Opacity(
                        opacity: index == controller.beautyIndex.value ? 1 : 0,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 3.h),
                          height: 112.h + 15.h,
                          width: 79.h,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: AppColors.cFF7954,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Text(
                            "In Progress",
                            style: TextStyle(
                                color: AppColors.cFFFFFF,
                                fontSize: 10.h,
                                height: 0.9),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 112.h,
                                  width: 79.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.circular(9.r),
                                    border:
                                        Border.all(color: AppColors.c666666),
                                  ),
                                  // padding: EdgeInsets.only(top: 5.h),
                                  child: Image.asset(
                                    width: 200.h,
                                    controller.beautyList[index],
                                    alignment: Alignment.topCenter,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    top: 6.h,
                                    left: 5.h,
                                    child: OutlinedText(
                                        text: controller.gradeList[index],
                                        textStyle: TextStyle(
                                          fontSize: 21.h,
                                          fontFamily: FontFamily.fRobotoBlack,
                                          height: 0.9,
                                        ))),
                              ],
                            ),
                            if (index == 3)
                              Container(
                                height: 112.h,
                                width: 79.h,
                                decoration: BoxDecoration(
                                  color: AppColors.cF2F2F2.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(9.r),
                                ),
                                child: Center(
                                  child: IconWidget(
                                    iconWidth: 21.h,
                                    icon: Assets.iconUiIconLock,
                                    iconColor: AppColors.c000000,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => 9.hGap,
              itemCount: controller.beautyList.length,
            ),
          ),
        ),
      );
    });
  }
}
