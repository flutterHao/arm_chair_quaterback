import 'dart:ui';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/buble_box.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_parent_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/tab_item_info.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/scroll_hide_bottom_bar.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/foundation.dart';
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
      onPopInvokedWithResult: (pop, result) async {
        if (!kIsWeb && GetPlatform.isAndroid) {
          const AndroidIntent(
            action: "android.intent.action.MAIN",
            category: 'android.intent.category.HOME',
            flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
          ).launch();
        }
      },
      child: HorizontalDragBackParentWidget(
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
              child: AbsorbPointer(
                absorbing: logic.isAbsorbPointer.value,
                child: ScrollHideBottomBar(
                  controller: logic.scrollHideBottomBarController,
                  bottomBar: Column(
                    children: [
                      const NewPlayerTip(),
                      Container(
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
                                bool select =
                                    index == controller.tabIndex.value;
                                if (index == 2) {
                                  return Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.cFFFFFF,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(9.w))),
                                      child: MtInkWell(
                                        onTap: () {
                                          IllustratiionsController illuCtrl =
                                              Get.find();
                                          if (index == 2 &&
                                              illuCtrl.hasNewPlayer.value) {
                                            TeamIndexController ctrl =
                                                Get.find();
                                            ctrl.goToIllustraction();
                                          } else {
                                            controller.onTap(2);
                                          }
                                        },
                                        child: Container(
                                            height: 66.w,
                                            padding: EdgeInsets.all(4.w),
                                            decoration: BoxDecoration(
                                                color: select
                                                    ? AppColors.cFFFFFF
                                                    : AppColors.cFFFFFF,
                                                borderRadius:
                                                    BorderRadius.circular(9.w)),
                                            margin:
                                                EdgeInsets.only(bottom: 9.w),
                                            child: Container(
                                                height: 58.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.w),
                                                    border: Border.all(
                                                        color:
                                                            AppColors.cE6E6E6,
                                                        width: 1)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.w),
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
                              height: MediaQuery.of(context).padding.bottom > 0
                                  ? MediaQuery.of(context).padding.bottom / 2
                                  : 0,
                              width: double.infinity,
                              color: AppColors.cFFFFFF,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  child: BlackAppWidget(
                    const UserInfoBar(),
                    bodyWidget: Expanded(
                      child: Stack(
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
                              // Obx(() {
                              //   return Container(
                              //     height: controller.bottomBarY.value.abs() +
                              //         MediaQuery.of(context).padding.bottom,
                              //   );
                              // })
                            ],
                          ),
                          // 竞猜选择结果底部弹框
                          const BottomGuessTipWidget(
                            needCheckHomeTab: true,
                          ),
                          // 底部tabBar
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
                  ? [AppColors.c272727, AppColors.c272727]
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
                          iconWidth: isCenter ? 26.w : 24.w,
                          icon: select ? e.tabIconSelected : e.tabIconNormal,
                          iconColor: select
                              ? (isCenter ? AppColors.cFFFFFF : null)
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
              isCenter ? 3.hGap : 5.vGap,
              Text(
                e.label.tr,
                style: select
                    ? 12.w5(
                        color: isCenter ? AppColors.cFFFFFF : AppColors.c000000,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular)
                    : 12.w4(
                        color: isCenter && select
                            ? AppColors.cFFFFFF
                            : AppColors.c000000.withOpacity(0.3),
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

class NewPlayerTip extends StatelessWidget {
  const NewPlayerTip({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
        init: IllustratiionsController(),
        builder: (ctrl) {
          return Obx(() {
            return AnimatedScale(
              duration: 300.milliseconds,
              scale: ctrl.hasNewPlayer.value ? 1 : 0,
              child: BubbleBox(
                arrowOffset: 75.w,
                color: AppColors.c000000,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 9.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Get new player:  ",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.cFFFFFF,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.5.w),
                        child: AnimatedNum(
                          milliseconds: 100,
                          textStyle: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.cFFFFFF,
                              fontFamily: FontFamily.fRobotoMedium),
                          number: ctrl.getPlayerCards.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
