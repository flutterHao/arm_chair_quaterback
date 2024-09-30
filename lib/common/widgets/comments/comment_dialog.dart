/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:34:46
 * @LastEditTime: 2024-09-30 16:00:53
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentDialog extends GetView<CommentController> {
  const CommentDialog(
      {super.key,
      required this.newsId,
      this.parentId = 0,
      this.targetId = 0,
      this.isReply = false,
      this.showKeyboard,
      this.hintText = 'Say something...'});
  final String hintText;
  final int newsId;
  final int parentId;
  final int targetId;
  final bool isReply;
  final Function? showKeyboard;

  @override
  Widget build(BuildContext context) {
    // 使用 MediaQuery 来获取键盘的高度
    var ctrl = TextEditingController();
    var hasText = false.obs;
    NewsDetail detail =
        Get.find<NewsDetailController>(tag: newsId.toString()).state.newDetail;
    // controller.focusNode.requestFocus();    final FocusNode focusNode = FocusNode();
    final FocusNode focusNode = FocusNode();
    if (isReply) focusNode.requestFocus();
    // if (showKeyboard != null) {
    //   showKeyboard!(context);
    // }
    return GetBuilder<CommentController>(
        id: "commentDialog",
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
            ),
            child: Container(
              color: AppColors.c262626,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              alignment: Alignment.center,
                              constraints: BoxConstraints(minHeight: 42.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.w, color: AppColors.cFF7954),
                                  color: AppColors.cE6E6E6,
                                  borderRadius: BorderRadius.circular(24.w)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: ctrl,
                                      minLines: 1,
                                      maxLines: 10,
                                      focusNode: focusNode,
                                      // focusNode: controller.focusNode,
                                      cursorColor: AppColors.cFF7954,
                                      scrollPadding: const EdgeInsets.all(0),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.w),
                                        hintText: hintText,
                                        hintStyle:
                                            14.w4(color: AppColors.cB3B3B3),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                      onChanged: (v) {
                                        hasText.value =
                                            ObjectUtil.isNotEmpty(v);
                                      },
                                    ),
                                  ),
                                  Obx(() {
                                    return AnimatedOpacity(
                                      opacity: hasText.value ? 1.0 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: IconButton(
                                        icon: Container(
                                          width: 30.w,
                                          height: 30.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.cFF7954,
                                              borderRadius:
                                                  BorderRadius.circular(15.w)),
                                          child: Transform.rotate(
                                            angle: 90 * (pi / 180),
                                            child: IconWidget(
                                              iconWidth: 15.w,
                                              icon: Assets.iconBackPng,
                                              iconColor: AppColors.c262626,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          String content = ctrl.text;
                                          ctrl.text = "";
                                          FocusScope.of(context).unfocus();
                                          controller.sendReviews(
                                            context,
                                            newsId,
                                            targetId: targetId,
                                            parentReviewId: parentId,
                                            content,
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                ],
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          detail.isLike?.value == true
                              ? controller.unLikeNews(detail)
                              : controller.likeNews(detail);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconWidget(
                                iconWidth: 30.w,
                                icon: detail.isLike?.value == true
                                    ? Assets.uiIconLike_01Png
                                    : Assets.uiIconLike_02Png,
                                iconColor: detail.isLike?.value == true
                                    ? AppColors.cFF7954
                                    : AppColors.cB3B3B3,
                              ),
                              // if ((detail.likes ?? 0) > 0)
                              Text(
                                "${detail.likes}",
                                style: 14.w4(
                                  color: detail.isLike?.value == true
                                      ? AppColors.cFF7954
                                      : AppColors.cB3B3B3,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}

void showCommentBottomSheet(BuildContext context,
    {required int newsId,
    int parentId = 0,
    int targetId = 0,
    String hintText = "Say something..."}) {
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true, // 设置为 true，允许内容随着键盘升起而调整
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CommentDialog(
        newsId: newsId,
        parentId: parentId,
        targetId: targetId,
        isReply: true,
        hintText: hintText,
        showKeyboard: () {
          // if (!hasFocus) {
          //   CommentController controller = Get.find();
          //   controller.focusNode.requestFocus();
          //   // FocusScope.of(context).requestFocus(controller.focusNode);
          // }
        },
      );
    },
  );
}
