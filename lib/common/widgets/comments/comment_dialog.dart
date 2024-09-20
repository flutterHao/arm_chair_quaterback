/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:34:46
 * @LastEditTime: 2024-09-20 10:21:07
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CommentDialog extends GetView<CommentController> {
  const CommentDialog(
      {super.key,
      required this.newsId,
      this.parentId = 0,
      this.targetId = 0,
      this.hintText = 'Say something...'});
  final String hintText;
  final int newsId;
  final int parentId;
  final int targetId;

  @override
  Widget build(BuildContext context) {
    // 使用 MediaQuery 来获取键盘的高度
    var ctrl = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: 42.w),
                  decoration: BoxDecoration(
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
                          cursorColor: AppColors.cFF7954,
                          scrollPadding: const EdgeInsets.all(0),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.w),
                            hintText: hintText,
                            hintStyle: 14.w4(color: AppColors.cB3B3B3),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                              color: AppColors.c666666,
                              borderRadius: BorderRadius.circular(15.w)),
                          child: Transform.rotate(
                            angle: 90 * (pi / 180),
                            child: IconWidget(
                              iconWidth: 15.w,
                              icon: Assets.iconBackPng,
                              iconColor: AppColors.cE6E6E,
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.sendReviews(
                            context,
                            newsId,
                            targetId: targetId,
                            parentReviewId: parentId,
                            ctrl.text,
                          );
                        },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   color: Colors.white,
    //   margin: EdgeInsets.only(
    //     bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
    //   ),
    //   alignment: Alignment.center,
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Container(
    //         margin: const EdgeInsets.all(8.0),
    //         alignment: Alignment.center,
    //         constraints: BoxConstraints(
    //           minHeight: 42.w, // 确保有最小高度
    //           // maxHeight: constraints.maxHeight * 0.5, // 设置最大高度为屏幕高度的 50%
    //         ),
    //         decoration: BoxDecoration(
    //           color: AppColors.cE6E6E6,
    //           borderRadius: BorderRadius.circular(21.w),
    //         ),
    //         child: Row(
    //           crossAxisAlignment:
    //               CrossAxisAlignment.center, // 确保 Row 的子组件有合适的布局空间
    //           children: [
    //             Expanded(
    //               child: ConstrainedBox(
    //                 constraints: BoxConstraints(
    //                   minHeight: 42.w, // 给 TextField 设置一个最小高度
    //                 ),
    //                 child: TextField(
    //                   minLines: 1,
    //                   maxLines: 10,
    //                   controller: ctrl,
    //                   cursorColor: AppColors.cFF7954,
    //                   scrollPadding: const EdgeInsets.all(0),
    //                   decoration: InputDecoration(
    //                     contentPadding: EdgeInsets.all(10.w),
    //                     hintText: hintText,
    //                     hintStyle: 14.w4(color: AppColors.cB3B3B3),
    //                     border: const OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             IconButton(
    //               icon: const Icon(Icons.send),
    //               onPressed: () {
    //                 controller.sendReviews(
    //                     newsId, targetId: targetId, ctrl.text);
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

void showCommentBottomSheet(BuildContext context,
    {required int newsId, int parentId = 0, int targetId = 0}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // 设置为 true，允许内容随着键盘升起而调整
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CommentDialog(
        newsId: newsId,
        parentId: parentId,
        targetId: targetId,
      );
    },
  );
}
