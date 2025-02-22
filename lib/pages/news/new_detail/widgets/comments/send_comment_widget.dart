/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:34:46
 * @LastEditTime: 2025-02-20 17:24:15
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendCommentWidget extends StatefulWidget {
  const SendCommentWidget(
      {super.key,
      required this.detail,
      this.reviewsItem,
      // this.targetId = 0,
      this.isReply = false,
      // this.showKeyboard,
      this.hintText = 'Say something...'});

  final String hintText;
  final NewsListDetail detail;
  final ReviewEntity? reviewsItem;

  // final int targetId;
  final bool isReply;

  // final Function? showKeyboard;

  @override
  State<SendCommentWidget> createState() => _SendCommentWidgetState();
}

class _SendCommentWidgetState extends State<SendCommentWidget> {
  // 使用 MediaQuery 来获取键盘的高度
  var ctrl = TextEditingController();
  var hasText = false.obs;

  // NewsDetail detail =
  //     Get.find<NewsDetailController>(tag: newsId.toString()).state.newDetail;
  // controller.focusNode.requestFocus();    final FocusNode focusNode = FocusNode();

  final FocusNode focusNode = FocusNode();

  // if (isReply) focusNode.requestFocus();

  @override
  void initState() {
    super.initState();
    if (widget.isReply) focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      // duration: Duration(milliseconds: 50),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
      ),
      decoration: BoxDecoration(
          color: MediaQuery.of(context).viewInsets.bottom <= 0
              ? AppColors.cFFFFFF
              : isDarkMode
                  ? AppColors.c262626
                  : AppColors.cFFFFFF,
          boxShadow: [
            BoxShadow(
                color: AppColors.c000000.withOpacity(0.05),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
                  child: Container(
                      alignment: Alignment.center,
                      constraints: BoxConstraints(minHeight: 42.w),
                      decoration: BoxDecoration(
                          color: MediaQuery.of(context).viewInsets.bottom <= 0
                              ? AppColors.cE6E6E6
                              : isDarkMode
                                  ? AppColors.c4D4D4D
                                  : AppColors.cE6E6E6,
                          borderRadius: BorderRadius.circular(24.w)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: ctrl,
                              minLines: 1,
                              maxLines: 10,
                              focusNode: widget.isReply ? focusNode : null,
                              // keyboardAppearance:Brightness.light,
                              cursorColor:
                                  MediaQuery.of(context).viewInsets.bottom <= 0
                                      ? AppColors.c262626
                                      : isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                              scrollPadding: const EdgeInsets.all(0),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.w),
                                hintText: widget.hintText,
                                hintStyle: 14.w4(color: AppColors.cB3B3B3),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              style: 14.w4(
                                  color: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom <=
                                          0
                                      ? AppColors.c262626
                                      : isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626),
                              onChanged: (v) {
                                print('onChanged');
                                hasText.value = ObjectUtil.isNotEmpty(v);
                              },
                            ),
                          ),
                          Obx(() {
                            return AnimatedOpacity(
                              opacity: hasText.value ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 200),
                              child: IconButton(
                                icon: Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                      color: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom <=
                                              0
                                          ? AppColors.c262626
                                          : isDarkMode
                                              ? AppColors.cF2F2F2
                                              : AppColors.c262626,
                                      borderRadius:
                                          BorderRadius.circular(15.w)),
                                  child: Transform.rotate(
                                    angle: 90 * (pi / 180),
                                    child: IconWidget(
                                      iconWidth: 15.w,
                                      icon: Assets.iconIconBack,
                                      iconColor: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom <=
                                          0
                                          ? AppColors.cF2F2F2:!isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      // iconColor: AppColors.c262626,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  String content = ctrl.text;
                                  ctrl.text = "";
                                  hasText.value = false;
                                  FocusScope.of(context).unfocus();
                                  Get.find<CommentController>(
                                          tag: widget.detail.id.toString())
                                      .sendReviews(
                                    context,
                                    widget.detail,
                                    // targetId: targetId,
                                    reviews: widget.reviewsItem,
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
            ],
          ),
        ],
      ),
    );
  }
}

Future showCommentBottomSheet(BuildContext context,
    {required NewsListDetail detail,
    required ReviewEntity reviewsItem,
    // int targetId = 0,
    String hintText = "Say something..."}) async {
  await BottomTipDialog.showWithSound(
    context: Get.context!,
    isScrollControlled: true, // 设置为 true，允许内容随着键盘升起而调整
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SendCommentWidget(
        detail: detail,
        reviewsItem: reviewsItem,
        // targetId: targetId,
        isReply: true,
        hintText: hintText,
        key: UniqueKey(),
        // showKeyboard: () {
        // if (!hasFocus) {
        //   CommentController controller = Get.find();
        //   controller.focusNode.requestFocus();
        //   // FocusScope.of(context).requestFocus(controller.focusNode);
        // }
        // },
      );
    },
  );
}
