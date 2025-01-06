import 'dart:ui';

import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/tab_item_info.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        controller.getCurrentTabGlobalKey()?.currentState?.maybePop();
      },
      child: GetBuilder<HomeController>(
        assignId: true,
        builder: (logic) {
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: controller.pageController,
                          children: controller.tabItems
                              .map((e) => Center(child: e.tabPage))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 66.w + MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                  // 竞猜选择结果底部弹框
                  const BottomGuessTipWidget(),
                  // 底部tabBar
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.ce5e5e5.withOpacity(0.6),
                            offset: Offset(0, -5.w),
                            blurRadius: 9.w,
                            spreadRadius: 0.w,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: controller.tabItems.map((e) {
                              int index = controller.tabItems.indexOf(e);
                              bool select = index == controller.tabIndex.value;
                              if (index == 2) {
                                return Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.cFFFFFF,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(9.w))),
                                    child: MtInkWell(
                                      onTap: () => controller.onTap(2),
                                      child: Container(
                                          height: 66.w,
                                          padding: EdgeInsets.all(4.w),
                                          decoration: BoxDecoration(
                                              color: select
                                                  ? AppColors.cFFDAD0
                                                  : AppColors.cFFFFFF,
                                              borderRadius:
                                                  BorderRadius.circular(9.w)),
                                          margin: EdgeInsets.only(bottom: 9.w),
                                          child: Container(
                                              height: 58.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.w),
                                                  border: Border.all(
                                                      color: AppColors.cE6E6E6,
                                                      width: 1)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4.w),
                                                child: _barItem(
                                                    controller.tabItems[2],
                                                    select,
                                                    58.w,
                                                    isCenter: true),
                                              ))),
                                    ),
                                  ),
                                );
                              }
                              return Flexible(
                                flex: 1,
                                child: Container(
                                  color: AppColors.cFFFFFF,
                                  child: MtInkWell(
                                    onTap: () => controller.onTap(index),
                                    child: _barItem(e, select, 66.w,
                                        showMessageCount: index == 4),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          Container(
                            height: MediaQuery.of(context).padding.bottom,
                            width: double.infinity,
                            color: AppColors.cFFFFFF,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _barItem(TabItemInfo e, bool select, double height,
      {bool isCenter = false, bool showMessageCount = false}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isCenter && select
                  ? [AppColors.cFF6A41, AppColors.cFF9071]
                  : [AppColors.cFFFFFF, AppColors.cFFFFFF])),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isCenter && select && false) //二期功能
                    Expanded(
                        child: SizedBox(
                      width: 4.w,
                    )),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 3.w),
                        child: IconWidget(
                          iconWidth: 24.w,
                          icon: select ? e.tabIconSelected : e.tabIconNormal,
                          iconColor: select
                              ? null
                              : AppColors.c000000.withOpacity(0.3),
                        ),
                      ),
                      if (showMessageCount && false)
                        /// 消息数量
                        Positioned(
                          top: 0.w,
                          right: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                                color: AppColors.cFF7954,
                                borderRadius: BorderRadius.circular(8.w)),
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "99",
                                  style: 10.w5(
                                    color: AppColors.cFFFFFF,
                                    height: 0.5,
                                    fontFamily: FontFamily.fOswaldMedium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  if (isCenter && select && false) //二期功能
                    Expanded(
                      child: Column(
                        children: [
                          IconWidget(
                            iconWidth: 4.w,
                            icon: Assets.commonUiCommonIconSystemArrow,
                            iconColor: AppColors.c000000,
                            rotateAngle: -90,
                          ),
                          IconWidget(
                            iconWidth: 4.w,
                            icon: Assets.commonUiCommonIconSystemArrow,
                            iconColor: AppColors.c000000,
                            rotateAngle: 90,
                          )
                        ],
                      ),
                    )
                ],
              ),
              5.vGap,
              Text(
                e.label,
                style: select
                    ? 12.w5(
                        color: AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular)
                    : 12.w4(
                        color: AppColors.c000000.withOpacity(0.3),
                        height: 1,
                        fontFamily: FontFamily.fRobotoMedium),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// class HomePage extends GetView<HomeController> {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {

//   }
// }
