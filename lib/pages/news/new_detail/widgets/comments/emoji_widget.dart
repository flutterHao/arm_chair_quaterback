/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-22 15:19:24
 * @LastEditTime: 2025-01-10 15:31:28
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmojiWidget extends StatelessWidget {
  const EmojiWidget({super.key});
  // final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final randow = Random();
    RxInt current = 0.obs;
    List<String> emojiList = [
      Assets.newsUiEmojiJoker,
      Assets.newsUiEmojiArrogance,
      Assets.newsUiEmojiLaugh,
    ];
    return Wrap(
      spacing: 5.w,
      runSpacing: 5.w,
      children: [
        ...emojiList.map((e) {
          int index = emojiList.indexOf(e);
          return Obx(() {
            return GestureDetector(
              onTap: () {
                current.value = index;
                // EasyLoading.showToast("Not Open",
                //     duration: const Duration(milliseconds: 200));
              },
              child: Container(
                height: 24.w,
                constraints: BoxConstraints(minWidth: 43.w),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                decoration: BoxDecoration(
                  color: current.value == index
                      ? AppColors.c262626
                      : AppColors.cE6E6E,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconWidget(iconWidth: 16.w, icon: e),
                    5.hGap,
                    Text(
                      "${randow.nextInt(20)}",
                      style: 12.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: current.value == index
                            ? AppColors.cEFEFEF
                            : AppColors.c262626,
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        }),
        5.hGap,
        // MtInkWell(
        //   onTap: () {},
        //   child: Container(
        //     height: 24.w,
        //     width: 24.w,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       color: AppColors.cFFFFFF,
        //       borderRadius: BorderRadius.circular(4.w),
        //       border: Border.all(
        //           color: AppColors.c666666.withOpacity(0.3), width: 1.w),
        //     ),
        //     child: IconWidget(
        //       iconWidth: 14.w,
        //       icon: Assets.newsUiIconEmoji,
        //       iconColor: AppColors.c262626,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
