import 'dart:ui';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/tab_item_info.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_guess_confirm_dialog_v2.dart';
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
                  Obx(() {
                    var tabIndex = Get.find<HomeController>().tabIndex.value;
                    if(![0,1].contains(tabIndex)){
                      return const SizedBox.shrink();
                    }
                    var picksIndexController = Get.find<PicksIndexController>();
                    var leagueController = Get.find<LeagueController>();
                    var value = picksIndexController.choiceSize.value;
                    value += leagueController.choiceSize.value;
                    return AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        left: 0,
                        right: 0,
                        bottom: value <= 0
                            ? 0.w
                            : 75.w +
                                7.w +
                                MediaQuery.of(context).padding.bottom,
                        child: Center(
                          child: MtInkwell(
                            scaleX: true,
                            minScale: 0.95,
                            onTap: () async {
                              await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: AppColors.cTransparent,
                                  context: Get.context!,
                                  builder: (context) {
                                    return const PicksGuessConfirmDialogV2();
                                  });
                              picksIndexController.batchDeleteOpen.value =
                                  false;
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.circular(16.w),
                                    border: Border.all(
                                        color: AppColors.cFF7954, width: 2.w)),
                                width: 360.w,
                                height: 66.w,
                                padding:
                                    EdgeInsets.only(left: 17.w, right: 10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "CREATE A COMBO",
                                      style: 16.w5(
                                          color: AppColors.cFFFFFF,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    9.vGap,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: List.generate(6, (index) {
                                            Color color = AppColors.c4D4D4D;
                                            if (index + 1 <= value) {
                                              color = AppColors.cFF7954;
                                            }
                                            return IconWidget(
                                              iconWidth: 19.w,
                                              icon:
                                                  Assets.commonUiCommonIconPick,
                                              iconColor: color,
                                            );
                                          }),
                                        ),
                                        Container(
                                          height: 24.w,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.w),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.cFF7954,
                                              borderRadius:
                                                  BorderRadius.circular(12.w)),
                                          child: Text(
                                            "${value > 0 ? picksIndexController.picksDefine.powerBetWin[value - 1] : "0"}x",
                                            style: 16.w5(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ));
                  }),
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
                                    child: MtInkwell(
                                      onTap: () => controller.onTap(2),
                                      child: Container(
                                          height: 66.w,
                                          width: 74.w,
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
                                  child: MtInkwell(
                                    onTap: () => controller.onTap(index),
                                    child: _barItem(e, select, 66.w),
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
      {bool isCenter = false}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isCenter && select
                  ? [AppColors.cFF6A41, AppColors.cFF9071]
                  : [AppColors.cFFFFFF, AppColors.cFFFFFF])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isCenter && select && false)//二期功能
                Expanded(
                    child: SizedBox(
                  width: 4.w,
                )),
              IconWidget(
                iconWidth: 24.w,
                icon: select ? e.tabIconSelected : e.tabIconNormal,
              ),
              if (isCenter && select&& false)//二期功能
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
            style: 12.w4(
                color: select
                    ? AppColors.c000000
                    : AppColors.c000000.withOpacity(0.3),
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          )
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
