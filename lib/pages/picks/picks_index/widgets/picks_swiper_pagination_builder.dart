import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/9/10/10:25

class PicksSwiperPaginationBuilder extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 6.w,
        width: (12 * (config.itemCount - 1) + 29).w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: config.itemCount,
            itemBuilder: (_, index) {
              return index == config.activeIndex
                  ? Container(
                      width: 23.w,
                      height: 6.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                          color: AppColors.c000000.withOpacity(.6),
                          borderRadius: BorderRadius.circular(3.w)),
                    )
                  : Container(
                      width: 6.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      height: 6.w,
                      decoration: BoxDecoration(
                          color: AppColors.c000000.withOpacity(.3),
                          borderRadius: BorderRadius.circular(3.w)),
                    );
            }),
      ),
    );
  }
}
