import 'dart:math';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendCommentView extends StatefulWidget {
  const SendCommentView(
      {super.key,
      // this.targetId = 0,
      this.isReply = false,
      // this.showKeyboard,
      this.hintText = 'Say something...',
      required this.onSend});
  final String hintText;
  // final int targetId;
  final bool isReply;
  final Function onSend;
  // final Function? showKeyboard;

  @override
  State<SendCommentView> createState() => _SendCommentViewState();
}

class _SendCommentViewState extends State<SendCommentView> {
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
      color: isDarkMode ? AppColors.c262626 : AppColors.cFFFFFF,
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
                          color: isDarkMode
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
                              cursorColor: isDarkMode
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
                                  color: isDarkMode
                                      ? AppColors.cF2F2F2
                                      : AppColors.c262626),
                              onChanged: (v) {
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
                                      color: isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      borderRadius:
                                          BorderRadius.circular(15.w)),
                                  child: Transform.rotate(
                                    angle: 90 * (pi / 180),
                                    child: IconWidget(
                                      iconWidth: 15.w,
                                      icon: Assets.iconIconBack,
                                      iconColor: !isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      // iconColor: AppColors.c262626,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (ctrl.text.trim().isEmpty) return;
                                  widget.onSend(ctrl.text);
                                  ctrl.text = "";
                                  FocusScope.of(context).unfocus();
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
