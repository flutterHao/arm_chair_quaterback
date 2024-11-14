/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-22 15:19:24
 * @LastEditTime: 2024-10-29 20:45:41
 */
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
            return InkWell(
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
                      "99",
                      style: 12.w4(
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
        InkWell(
          onTap: () {},
          child: Container(
            height: 24.w,
            width: 43.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
            decoration: BoxDecoration(
              color: AppColors.cE6E6E,
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: IconWidget(
              iconWidth: 16.w,
              icon: Assets.newsUiIconEmoji,
              iconColor: AppColors.c262626,
            ),
          ),
        )
      ],
    );
  }
}
