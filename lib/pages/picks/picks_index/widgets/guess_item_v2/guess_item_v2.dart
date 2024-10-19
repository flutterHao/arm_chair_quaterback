import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_controller_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:43

class GuessItemV2 extends StatefulWidget {
  const GuessItemV2({super.key, required this.index});

  final int index;
  @override
  State<GuessItemV2> createState() => _GuessItemV2State();
}

class _GuessItemV2State extends State<GuessItemV2> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuessItemControllerV2>(
        init: GuessItemControllerV2(widget.index),
        tag: widget.index.toString(),
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageWidget(
                      url: "", //todo
                      width: 42.w,
                      color: AppColors.cE6E6E6,
                    ),
                    5.hGap,
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Player Name",
                            style: 14.w4(color: AppColors.c262626, height: 1),
                            overflow: TextOverflow.ellipsis,
                          ),
                          7.vGap,
                          Text(
                            "VS NOP   8:05 AM",
                            style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 37.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      border: Border.all(color: AppColors.ccccccc, width: 1)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                              child: Text(
                                "25.6",
                                style: 18.w7(
                                    color: AppColors.c262626, height: 1),
                              ))),
                      Container(
                        height: 18.w,
                        width: 1,
                        decoration:
                        const BoxDecoration(color: AppColors.cC4C4C4),
                      ),
                      Expanded(
                          child: Center(
                              child: Text(
                                "Points less",
                                style: 12.w4(
                                    color: AppColors.cB3B3B3, height: 1),
                                textAlign: TextAlign.center,
                              )))
                    ],
                  ),
                ),
                Obx(() {
                  return Container(
                    height: 46.w,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.cFF7954, width: 1),
                        borderRadius: BorderRadius.circular(8.w)),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () => controller.guessItemTap(0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.currentIndex.value == 0
                                      ? AppColors.cFF7954
                                      : AppColors.cTransparent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7.w),
                                      bottomLeft: Radius.circular(7.w))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconWidget(
                                    iconWidth: 15.w,
                                    icon: Assets.uiIconUpPng,
                                    iconColor: controller.currentIndex.value == 0
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954,
                                  ),
                                  5.vGap,
                                  Text(
                                    "MORE",
                                    style: 12
                                        .w7(color: controller.currentIndex.value == 0
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954, height: 1),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: 1,
                          color: AppColors.cFF7954,
                        ),
                        Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () => controller.guessItemTap(1),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: controller.currentIndex.value == 1
                                      ? AppColors.cFF7954
                                      : AppColors.cTransparent,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7.w),
                                      bottomRight: Radius.circular(7.w))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconWidget(
                                    iconWidth: 15.w,
                                    icon: Assets.uiIconUpPng,
                                    iconColor: controller.currentIndex.value == 1
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954,
                                    rotateAngle: 180,
                                  ),
                                  5.vGap,
                                  Text(
                                    "LESS",
                                    style:
                                    12.w7(color: controller.currentIndex.value == 1
                                        ? AppColors.cF2F2F2
                                        : AppColors.cFF7954, height: 1),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          );
        });
  }
}
