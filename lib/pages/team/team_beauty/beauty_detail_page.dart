/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-16 17:13:31
 * @LastEditTime: 2024-10-21 16:43:51
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyDetailPage extends GetView<BeautyController> {
  const BeautyDetailPage({super.key});

  Widget _buildView(BuildContext context) {
    RxDouble dressBottom = (-254.w).obs;
    Future.delayed(const Duration(milliseconds: 100), () {
      dressBottom.value = 0;
    });
    
        RxDouble tabRight = (-92.w).obs;
    Future.delayed(const Duration(milliseconds: 100), () {
      tabRight.value = 16;
    });
    return Stack(
      children: [
        Positioned(
          top: 5.w,
          right: 0,
          // bottom: 46.w,
          child: Hero(
            tag: "beauty${controller.beautyIndex}",
            child: Image.asset(controller.beautyList[controller.beautyIndex],
                fit: BoxFit.fitHeight,
                height: 567.w,
                // width: 232.w,
                alignment: Alignment.topLeft),
          ),
        ),
        Positioned(
          top: 28.w,
          left: 21.w,
          child: heartAndCard(2),
        ),
        Positioned(
          bottom: 275.w,
          left: 31.5.w,
          child: beautyInfo(color: AppColors.cF2F2F2),
        ),
      Obx(() {
            return AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
              bottom: 275.w,
              right:tabRight.value,
              child: _tabButtom(),
            );
          }
        ),
        Obx(() {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            bottom: dressBottom.value,
            left: 0,
            right: 0,
            child: _dressUpView(),
          );
        })
      ],
    );
  }

  Widget _tabButtom() {
    return Container(
      width: 92.w,
      height: 24.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cE6E6E,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Text(
        "Dress Up",
        style: 13.w4(color: AppColors.c262626),
      ),
    );
  }

  ///换装
  Widget _dressUpView() {
    return BorderWidget(
      offset: Offset(0, 3.w),
      width: 375.w,
      height: 254.w,
      backgroudColor: AppColors.cE6E6E,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.w),
        topRight: Radius.circular(16.w),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 186.w,
          width: 375.w,
          alignment: Alignment.center,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              bool isCurrent = index == controller.clothingIndex;
              return InkWell(
                onTap: () => controller.onClothingTap(index),
                child: Container(
                  width: 121.w,
                  height: 186.w,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(3.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.w),
                    color: isCurrent ? AppColors.c10A86A : null,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 117.w,
                        height: 166.w,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(12.w),
                            image: DecorationImage(
                              image: AssetImage(controller.clothingList[index]),
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      if (index == controller.clothingIndex)
                        Expanded(
                          child: Align(
                            // margin: EdgeInsets.only(top: 5.w),
                            alignment: Alignment.center,
                            child: Text(
                              "WERING",
                              style: 12.w4(color: AppColors.cFFFFFF, height: 1),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return 4.hGap;
            },
            itemCount: controller.clothingList.length,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeautyController>(builder: (_) {
      return BlackAppWidget(
        backgroundColor: AppColors.c262626,
        const AppBarWidget(
          title: "TREASURE",
        ),
        bodyWidget: Expanded(child: _buildView(context)),
      );
    });
  }
}
