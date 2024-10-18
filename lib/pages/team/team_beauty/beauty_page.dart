/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-12 17:33:59
 * @LastEditTime: 2024-10-17 15:33:27
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-12 17:33:59
 * @LastEditTime: 2024-10-16 17:13:00
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyPage extends GetView<BeautyController> {
  const BeautyPage({super.key});

  Widget _buildView(BuildContext context) {
    return GetBuilder(
        init: BeautyController(),
        builder: (_) {
          return Stack(
            children: [
              Positioned(
                  top: 108.h,
                  left: -30.w,
                  right: 0,
                  bottom: 46.h,
                  child: _beautySwiper()),
              Positioned(
                top: 42.h,
                left: 31.5.h,
                child: beautyInfo(),
              ),
              Positioned(
                top: 42.h,
                right: 37.5.h,
                child: heartAndCard(1),
              ),
            ],
          );
        });
  }

  // var customLayoutOption=

  Widget _beautySwiper() {
    RxInt current = 0.obs;
    var duration = const Duration(milliseconds: 500);
    return Swiper(
      key: Key("${controller.beautyList.length}"),
      // containerWidth: 64.h,
      // containerHeight: 86.h,
      itemWidth: 247.0,
      itemHeight: 375.0,
      // viewportFraction: 247 / 375,
      viewportFraction: 0.5,
      scale: 0.95,
      indicatorLayout: PageIndicatorLayout.COLOR,
      // layout: SwiperLayout.CUSTOM,
      itemCount: controller.beautyList.length,
      outer: false,
      autoplay: false,
      duration: 800, // 动画的过渡时间
      axisDirection: AxisDirection.right,
      onIndexChanged: (value) {
        current.value = value;
      },
      // customLayoutOption:
      //     CustomLayoutOption(startIndex: 0, stateCount: list.length)
      //       ..addTranslate([
      //         new Offset(-247.0, 0),
      //         new Offset(0.0, 0.0),
      //         new Offset(247.0, 0)
      //       ]),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.beautyIndex = index;
            Get.toNamed(RouteNames.teamBeautyDetail);
          },
          child: Obx(() {
            var isCurrent = current.value == index;
            return Container(
              // key: Key(index.toString()),
              // alignment: Alignment.center,
              // color: Colors.amber,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AnimatedContainer(
                    margin: isCurrent
                        ? EdgeInsets.only(left: 5.h, right: 5.h)
                        : null,
                    // alignment: Alignment.bottomCenter,
                    width: isCurrent ? 247.w : 222.w,
                    height: isCurrent ? 400.h : 381.h,
                    decoration: BoxDecoration(
                        color:
                            isCurrent ? AppColors.c262626 : AppColors.cB3B3B3,
                        borderRadius: BorderRadius.circular(16.w)),
                    duration: duration,
                  ),
                  Hero(
                    tag: "beauty$index",
                    child: AnimatedScale(
                      alignment: Alignment.bottomCenter,
                      duration: duration,
                      scale: isCurrent ? 1 : 381 / 481,
                      child: Image.asset(controller.beautyList[index],
                          // height: 481.w,
                          width: 247.w,
                          // width: isCurrent ? 247.w : 222.w,
                          // height: isCurrent ? 481.h : 381.h,
                          fit: BoxFit.fitWidth,
                          // height: 567.h,
                          alignment: Alignment.topCenter),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
        child: BlackAppWidget(
      const AppBarWidget(
        title: "TREASURE",
      ),
      bodyWidget: Expanded(child: _buildView(context)),
    ));
  }
}

///基础信息
Widget beautyInfo({color = AppColors.c000000}) {
  return Hero(
    tag: "info",
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CHARLIZE",
          style: 40.w7(color: color, height: 1),
        ),
        SizedBox(height: 7.h),
        Text(
          "THERON",
          style: 27.w4(color: color, height: 1),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "USA",
              style: 16.w7(color: AppColors.c808080, height: 1),
            ),
            4.hGap,
            IconWidget(
              iconWidth: 17.5.h,
              icon: Assets.uiEnsignUkPng,
            )
          ],
        )
      ],
    ),
  );
}

Widget heartAndCard(type) {
  return Hero(
    tag: "heart",
    child: Column(
      children: [
        IconWidget(iconWidth: 38.h, icon: Assets.uiHeart_01Png),
        SizedBox(height: 5.h),
        Text(
          "999K",
          style: 18.w7(
              color: type == 1 ? AppColors.c262626 : AppColors.cFFFFFF,
              height: 1),
        ),
        SizedBox(height: 17.h),
        IconWidget(iconWidth: 38.h, icon: Assets.uiJigsaw_01Png),
        SizedBox(height: 5.h),
        Text(
          "999K",
          style: 18.w7(
              color: type == 1 ? AppColors.c262626 : AppColors.cFFFFFF,
              height: 1),
        ),
      ],
    ),
  );
}
