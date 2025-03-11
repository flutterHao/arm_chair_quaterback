/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-22 15:19:24
 * @LastEditTime: 2025-03-06 16:41:03
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
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
  void _sendEmoji(String key) {
    SoundServices.to.playSound(Assets.soundEmojiSend);
    int emojiId = int.tryParse(key) ?? 1;
    if (!widget.myEmojis.contains(emojiId)) {
      NewsApi.sendEmoji(widget.type, widget.targetId, widget.subgoal, emojiId);
      widget.myEmojis.add(emojiId);
      if (widget.emojis[key] != null) {
        widget.emojis[key] = widget.emojis[key]! + 1;
      } else {
        widget.emojis[key] = 1;
      }
      setState(() {});
      EmojiAnimationWidget.show(context: context, emojiImg: _emojis[key]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.w,
      runSpacing: 5.w,
      children: [
        ...widget.emojis.entries.map((e) {
          return MtInkWell(
            onTap: () {
              // EasyLoading.showToast("Not Open",
              //     duration: const Duration(milliseconds: 200));
              _sendEmoji(e.key);
            },
            child: Container(
              height: 24.w,
              constraints: BoxConstraints(minWidth: 43.w),
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
              decoration: BoxDecoration(
                color: widget.myEmojis.contains(int.parse(e.key))
                    ? AppColors.c262626
                    : AppColors.cE6E6E,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconWidget(iconWidth: 16.w, icon: _emojis[e.key]!),
                  5.hGap,
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
            showDialog(
                context: context,
                builder: (context) {
                  return Align(
                    child: Container(
                      width: 200.w,
                      height: 140.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          color: AppColors.c262626),
                      child: GridView.builder(
                          padding: EdgeInsets.all(20.w),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20.w,
                                  mainAxisSpacing: 20.w,
                                  crossAxisCount: 3),
                          itemCount: _emojis.length,
                          itemBuilder: (context, index) {
                            var item = _emojis.entries.elementAt(index);
                            return MtInkWell(
                              onTap: () {
                                _sendEmoji(item.key);
                                Get.back();
                              },
                              child: Image.asset(item.value,
                                  width: 46.w,
                                  height: 46.w,
                                  fit: BoxFit.fitWidth),
                            );
                          }),
                    ),
                  );
                });
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
            child: IconWidget(
              iconWidth: 14.w,
              icon: Assets.newsUiIconEmoji,
              iconColor: AppColors.c262626,
            ),
          ),
        )
      ],
    );
  }
}

Map<String, String> _emojis = {
  "1": Assets.newsUiEmojiJoker,
  "2": Assets.newsUiEmojiArrogance,
  "3": Assets.newsUiEmojiLaugh,
};
