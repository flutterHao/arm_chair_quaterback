import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/controller.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SeasonRankDialog extends GetView<SeaonRankController> {
  const SeasonRankDialog({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          _seasonRankHeaderWidget(),
          5.vGap,
          const Divider(
            height: 1,
            color: AppColors.cD4D4D4,
          ),
          Expanded(child: _seasonRankBodyWidget())
        ],
      ),
    ));
  }

  Widget _seasonRankHeaderWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Obx(() => Row(
            children: [
              Text(
                'Season Ranks',
                style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
              const Spacer(),
              MtInkWell(
                  onTap: () async {
                    await controller.seaDialogPageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    controller.pageviewIndex.value =
                        (controller.seaDialogPageController.page ?? 0).toInt();
                  },
                  child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: controller.pageviewIndex.value != 0
                                  ? AppColors.cB3B3B3
                                  : AppColors.cE6E6E,
                              width: 1)),
                      child: Transform.rotate(
                          angle: pi,
                          child: IconWidget(
                              iconWidth: 5.w,
                              iconColor: controller.pageviewIndex.value != 0
                                  ? AppColors.c000000
                                  : AppColors.cB3B3B3,
                              icon: Assets.commonUiCommonIconSystemJumpto)))),
              5.hGap,
              Container(
                  height: 28.w,
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      border: Border.all(color: AppColors.cB3B3B3, width: 1)),
                  alignment: Alignment.center,
                  child: Text(
                    'dec 12 - dec 14',
                    style: 12.w5(fontFamily: FontFamily.fOswaldRegular),
                  )),
              5.hGap,
              MtInkWell(
                  onTap: () async {
                    await controller.seaDialogPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                    controller.pageviewIndex.value =
                        (controller.seaDialogPageController.page ?? 0).toInt();
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: controller.pageviewIndex.value !=
                                    controller.seasonRankList.length - 1
                                ? AppColors.cB3B3B3
                                : AppColors.cE6E6E,
                            width: 1)),
                    child: IconWidget(
                        iconWidth: 5.w,
                        iconColor: controller.pageviewIndex.value !=
                                controller.seasonRankList.length - 1
                            ? AppColors.c000000
                            : AppColors.cB3B3B3,
                        icon: Assets.commonUiCommonIconSystemJumpto),
                  ))
            ],
          )),
    );
  }

  Widget _seasonRankBodyWidget() {
    return PageView.builder(
        itemCount: controller.seasonRankList.length,
        controller: controller.seaDialogPageController,
        itemBuilder: (context, pageIndex) {
          return Obx(() => Stack(
                children: [
                  Container(
                    child: ListView.separated(
                      // controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return VisibilityDetector(
                            key: Key('item_$index'),
                            onVisibilityChanged:
                                (VisibilityInfo visibilityInfo) {
                              controller.onVisibilityChanged(
                                  visibilityInfo, index);
                            },
                            child: _seasonRankItemWidget(index));
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(color: AppColors.cD4D4D4, height: 1),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      bottom: controller.isShow.value ? 0 : -100,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 2.w),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.cDEDEDE,
                                blurRadius: 10,
                              )
                            ]),
                        child: _seasonRankItemWidget(
                            controller.seasonRankList.length - 1,
                            AppColors.cFF7954),
                      ))
                ],
              ));
        });
  }

  Widget _seasonRankItemWidget(int index, [Color color = AppColors.c000000]) {
    return Obx(() {
      // controller.seasonRankList[controller.pageviewIndex.value];
      return Container(
          color: index == 3 ? AppColors.cFF7954 : Colors.white,
          padding: EdgeInsets.symmetric(vertical: 17.w),
          child: Row(
            children: [
              Text(
                '${index + 1}',
                style: 19.w5(fontFamily: FontFamily.fOswaldMedium),
              ),
              20.hGap,
              ClipOval(
                child: IconWidget(iconWidth: 39.w, icon: Assets.teamUiHead01),
              ),
              6.hGap,
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'G Cleavinger',
                      style: 14.w5(
                          fontFamily: FontFamily.fOswaldMedium, color: color),
                    ),
                    Text(
                      'Win Rate  ${controller.pageviewIndex.value}%',
                      style: 12.w4(
                          color: AppColors.c4D4D4D,
                          fontFamily: FontFamily.fRobotoRegular),
                    ),
                  ],
                ),
              )),
              SizedBox(
                width: 100.w,
                child: Row(
                  children: [
                    IconWidget(
                        iconWidth: 22.w,
                        icon: Assets.managerUiManagerGameGrade01),
                    const Spacer(),
                    IconWidget(
                        iconWidth: 17.w,
                        icon: Assets.managerUiManagerIconCurrency04),
                    Text('+999w',
                        style: 14.w5(fontFamily: FontFamily.fOswaldMedium))
                  ],
                ),
              )
            ],
          ));
    });
  }
}
