/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-22 15:19:24
 * @LastEditTime: 2025-03-13 18:25:40
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/values/values.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/emoji_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmojiWidget extends StatefulWidget {
  const EmojiWidget({
    super.key,
    required this.emojis,
    required this.myEmojis,
    required this.type,
    required this.targetId,
    required this.subgoal,
  });
  final int type; //类型：1：新闻，2：评论，3：竞猜评论
  final Map<String, int> emojis;
  final List<int> myEmojis;
  final int targetId; //新闻id,竞猜Id...
  final int subgoal; //新闻id,评论id
  // final Alignment? alignment;

  @override
  State<EmojiWidget> createState() => _EmojiWidgetState();
}

class _EmojiWidgetState extends State<EmojiWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.w,
      runSpacing: 5.w,
      children: [
        ...widget.emojis.entries.map((e) {
          return MtInkWell(
            onTap: () async {
              // EasyLoading.showToast("Not Open",
              //     duration: const Duration(milliseconds: 200));
              // sendEmoji(e.key);
              await sendEmoji(e.key, widget.myEmojis, widget.emojis,
                  widget.type, widget.targetId, widget.subgoal);
              setState(() {});
            },
            child: Container(
              height: 24.w,
              // alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: 43.w),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: widget.myEmojis.contains(int.parse(e.key))
                    ? AppColors.c262626
                    : AppColors.cE6E6E,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconWidget(iconWidth: 21.w, icon: Constant.emojis[e.key]!),
                  3.hGap,
                  Text(
                    "${e.value}",
                    style: 12.w4(
                      fontFamily: FontFamily.fRobotoRegular,
                      color: widget.myEmojis.contains(int.parse(e.key))
                          ? AppColors.cEFEFEF
                          : AppColors.c262626,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
        // if (emojis.isNotEmpty) 30.hGap,

        MtInkWell(
          onTap: () {
            Get.bottomSheet(EmojiBottomsheet(sendEmoji: (key) async {
              await sendEmoji(key, widget.myEmojis, widget.emojis, widget.type,
                  widget.targetId, widget.subgoal);
              setState(() {});
            }), isScrollControlled: true);
          },
          child: Container(
            height: 24.w,
            width: 24.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(4.w),
              border: Border.all(
                  color: AppColors.c666666.withOpacity(0.3), width: 1.w),
            ),
            child: Image.asset(
              width: 17.w,
              height: 17.w,
              Assets.newsUiIconEmoji,
              color: AppColors.c000000,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}

//类型：1：新闻，2：评论，3：竞猜评论
Future sendEmoji(String key, List<int> myEmojis, Map<String, int> emojis,
    int type, int targetId, int subgoal) async {
  SoundServices.to.playSound(Assets.soundEmojiSend);
  int emojiId = int.tryParse(key) ?? 1;
  if (!myEmojis.contains(emojiId)) {
    await NewsApi.sendEmoji(type, targetId, subgoal, emojiId);
    myEmojis.add(emojiId);
    if (emojis[key] != null) {
      emojis[key] = emojis[key]! + 1;
    } else {
      emojis[key] = 1;
    }
    EmojiAnimationWidget.show(
        context: Get.context!, emojiImg: Constant.emojis[key]!);
  }
}
