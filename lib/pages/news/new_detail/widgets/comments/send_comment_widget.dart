/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-12 16:34:46
 * @LastEditTime: 2024-11-07 11:34:11
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendCommentWidget extends StatefulWidget {
  const SendCommentWidget(
      {super.key,
      required this.newsId,
      this.reviewsItem,
      // this.targetId = 0,
      this.isReply = false,
      // this.showKeyboard,
      this.hintText = 'Say something...'});
  final String hintText;
  final int newsId;
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
    return GetBuilder<CommentController>(
        id: "commentDialog",
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
            ),
            child: Container(
              color: isDarkMode ? AppColors.c262626 : AppColors.cFFFFFF,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.w),
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
                                      focusNode:
                                          widget.isReply ? focusNode : null,
                                      // keyboardAppearance:Brightness.light,
                                      cursorColor: isDarkMode
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      scrollPadding: const EdgeInsets.all(0),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.w),
                                        hintText: widget.hintText,
                                        hintStyle:
                                            14.w4(color: AppColors.cB3B3B3),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                      style: 14.w4(
                                          color: isDarkMode
                                              ? AppColors.cF2F2F2
                                              : AppColors.c262626),
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
                                          String content = ctrl.text;
                                          ctrl.text = "";
                                          FocusScope.of(context).unfocus();
                                          Get.find<CommentController>()
                                              .sendReviews(
                                            context,
                                            widget.newsId,
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
            ),
          );
        });
  }
}

// class SendCommentWidget extends GetView<CommentController> {
//   const SendCommentWidget(
//       {super.key,
//       required this.newsId,
//       this.reviewsItem,
//       // this.targetId = 0,
//       this.isReply = false,
//       this.showKeyboard,
//       this.hintText = 'Say something...'});
//   final String hintText;
//   final int newsId;
//   final Reviews? reviewsItem;
//   // final int targetId;
//   final bool isReply;
//   final Function? showKeyboard;

//   @override
//   Widget build(BuildContext context) {
//     // 使用 MediaQuery 来获取键盘的高度
//     var ctrl = TextEditingController();
//     var hasText = false.obs;
//     // NewsDetail detail =
//     //     Get.find<NewsDetailController>(tag: newsId.toString()).state.newDetail;
//     // controller.focusNode.requestFocus();    final FocusNode focusNode = FocusNode();
//     final isDarkMode =
//         MediaQuery.of(context).platformBrightness == Brightness.dark;
//     final FocusNode focusNode = FocusNode();
//     if (isReply) focusNode.requestFocus();
//     // if (showKeyboard != null) {
//     //   showKeyboard!(context);
//     // }
//     return GetBuilder<CommentController>(
//         id: "commentDialog",
//         builder: (_) {
//           return Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom, // 键盘高度
//             ),
//             child: Container(
//               color: isDarkMode ? AppColors.c262626 : AppColors.cF2F2F2,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                               alignment: Alignment.center,
//                               constraints: BoxConstraints(minHeight: 42.w),
//                               decoration: BoxDecoration(
//                                   border: isDarkMode
//                                       ? Border.all(
//                                           width: 1.w, color: AppColors.cFF7954)
//                                       : null,
//                                   color: AppColors.cE6E6E6,
//                                   borderRadius: BorderRadius.circular(24.w)),
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Expanded(
//                                     child: TextField(
//                                       controller: ctrl,
//                                       minLines: 1,
//                                       maxLines: 10,
//                                       focusNode: focusNode,
//                                       // keyboardAppearance:Brightness.light,
//                                       // focusNode: controller.focusNode,
//                                       cursorColor: AppColors.cFF7954,
//                                       scrollPadding: const EdgeInsets.all(0),
//                                       decoration: InputDecoration(
//                                         contentPadding: EdgeInsets.all(10.w),
//                                         hintText: hintText,
//                                         hintStyle:
//                                             14.w4(color: AppColors.cB3B3B3),
//                                         border: const OutlineInputBorder(
//                                             borderSide: BorderSide.none),
//                                       ),
//                                       onChanged: (v) {
//                                         hasText.value =
//                                             ObjectUtil.isNotEmpty(v);
//                                       },
//                                     ),
//                                   ),
//                                   Obx(() {
//                                     return AnimatedOpacity(
//                                       opacity: hasText.value ? 1.0 : 0.0,
//                                       duration:
//                                           const Duration(milliseconds: 200),
//                                       child: IconButton(
//                                         icon: Container(
//                                           width: 30.w,
//                                           height: 30.w,
//                                           decoration: BoxDecoration(
//                                               color: AppColors.cFF7954,
//                                               borderRadius:
//                                                   BorderRadius.circular(15.w)),
//                                           child: Transform.rotate(
//                                             angle: 90 * (pi / 180),
//                                             child: IconWidget(
//                                               iconWidth: 15.w,
//                                               icon: Assets.iconIconBack,
//                                               iconColor: AppColors.c262626,
//                                             ),
//                                           ),
//                                         ),
//                                         onPressed: () {
//                                           String content = ctrl.text;
//                                           ctrl.text = "";
//                                           FocusScope.of(context).unfocus();
//                                           controller.sendReviews(
//                                             context,
//                                             newsId,
//                                             // targetId: targetId,
//                                             reviews: reviewsItem,
//                                             content,
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   }),
//                                 ],
//                               )),
//                         ),
//                       ),
//                       // InkWell(
//                       //   onTap: () {
//                       //     detail.isLike.value == true
//                       //         ? controller.unLikeNews(detail)
//                       //         : controller.likeNews(detail);
//                       //   },
//                       //   child: Padding(
//                       //     padding: const EdgeInsets.all(4.0),
//                       //     child: Column(
//                       //       mainAxisAlignment: MainAxisAlignment.center,
//                       //       children: [
//                       //         IconWidget(
//                       //           iconWidth: 30.w,
//                       //           icon: detail.isLike.value == true
//                       //               ? Assets.iconUiIconLike01
//                       //               : Assets.iconUiIconLike02,
//                       //           iconColor: detail.isLike.value == true
//                       //               ? AppColors.cFF7954
//                       //               : AppColors.cB3B3B3,
//                       //         ),
//                       //         // if ((detail.likes ?? 0) > 0)
//                       //         Text(
//                       //           "${detail.likes}",
//                       //           style: 14.w4(
//                       //             color: detail.isLike.value == true
//                       //                 ? AppColors.cFF7954
//                       //                 : AppColors.cB3B3B3,
//                       //           ),
//                       //         )
//                       //       ],
//                       //     ),
//                       //   ),
//                       // )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }

Future showCommentBottomSheet(BuildContext context,
    {required int newsId,
    required ReviewEntity reviewsItem,
    // int targetId = 0,
    String hintText = "Say something..."}) async {
  await showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true, // 设置为 true，允许内容随着键盘升起而调整
    backgroundColor: Colors.transparent,
    builder: (context) {
      return SendCommentWidget(
        newsId: newsId,
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
