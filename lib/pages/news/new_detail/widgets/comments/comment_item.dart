import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentItemView extends GetView<CommentController> {
  const CommentItemView({super.key, required this.item, required this.isSub});
  final Reviews item;
  final bool isSub;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWidget(
          url: "",
          width: isSub ? 36.w : 48.w,
          height: isSub ? 36.w : 48.w,
          borderRadius: BorderRadius.circular(24.w),
        ),
        6.hGap,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 用户信息
              Row(
                children: [
                  Text(
                    item.teamName ?? "",
                    style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  // 6.hGap,
                  // Container(
                  //   width: 36.w,
                  //   height: 14.w,
                  //   alignment: Alignment.center,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(7.w),
                  //       color: AppColors.cE7B6DF),
                  //   child: Text(
                  //     "KOI",
                  //     style: 10.w4(color: Colors.white),
                  //   ),
                  // ),
                  // 13.hGap,
                  if (item.targetId != 0)
                    Container(
                      // width: 70.w,
                      // constraints:
                      //     BoxConstraints(maxWidth: 120.w, minWidth: 70.w),
                      margin: EdgeInsets.only(left: 6.w),
                      child: Text(
                        " ${controller.getTeamName(item)}",
                        style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  10.hGap,
                  Text(
                    controller.timeAgo(item.updateTime ?? 0),
                    style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                  ),
                  Expanded(child: Container()),
                  // if (item.teamId != (controller.userEntity.team?.teamId ?? 0))
                  InkWell(
                    onTap: () async {
                      // int parentId = item.parentReviewId == 0
                      //     ? item.id!
                      //     : item.parentReviewId!;
                      String name = "@${item.teamName}";
                      await showCommentBottomSheet(context,
                          newsId: item.newsId ?? 0,
                          reviewsItem: item,
                          // targetId: item.id ?? 0,
                          hintText: name);
                      if (context.mounted) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: Text(
                      "Reple",
                      style: TextStyle(
                          color: AppColors.c666666,
                          fontSize: 12.h,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              9.vGap,

              /// 评论内容
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    item.context ?? "",
                    style: 14.w4(color: AppColors.c666666),
                  )),
                  30.hGap,
                ],
              ),
              // 10.vGap,
              // EmojiWidget(),

              /// 点赞和回复
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 80.w,
              //       child: Obx(() {
              //         return Text(
              //           "${item.likes} likes",
              //           style: 12.w4(color: AppColors.cB3B3B3),
              //         );
              //       }),
              //     ),
              //     if (item.teamId != (controller.userEntity.team?.teamId ?? 0))
              //       InkWell(
              //         onTap: () {
              //           int parentId = item.parentReviewId == 0
              //               ? item.id!
              //               : item.parentReviewId!;
              //           String name = "@${item.teamName}";
              //           showCommentBottomSheet(context,
              //               newsId: item.newsId ?? 0,
              //               parentId: parentId,
              //               targetId: item.id ?? 0,
              //               hintText: name);
              //         },
              //         child: Text(
              //           "Reple",
              //           style: 12.w4(color: AppColors.c666666),
              //         ),
              //       ),
              //   ],
              // ),

              /// 展开 收起
              // if (index == controller.count.value - 1)
            ],
          ),
        )
      ],
    );
  }
}

class SubCommentItemView extends GetView<CommentController> {
  const SubCommentItemView({super.key, required this.item});
  final Reviews item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        6.hGap,
        Expanded(
          child: Column(
            children: [
              /// 用户信息
              Row(
                children: [
                  ImageWidget(
                    url: "",
                    width: 17.5.w,
                    height: 17.5.w,
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  3.5.hGap,
                  item.teamId != (controller.userEntity.team?.teamId ?? 0)
                      ? Text(
                          item.teamName ?? "",
                          style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                        )
                      : Container(
                          width: 27.w,
                          height: 14.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.cFF7954,
                              borderRadius: BorderRadius.circular(4.w)),
                          child: Text(
                            "Me",
                            style: 12.w4(color: AppColors.cFFFFFF, height: 1),
                          ),
                        ),
                  if (item.targetId != 0)
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 120.w, minWidth: 70.w),
                      margin: EdgeInsets.only(left: 6.w),
                      child: Text(
                        " ${controller.getTeamName(item)}",
                        style: 12.w4(color: AppColors.cB3B3B3),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  10.hGap,
                  Text(
                    controller.timeAgo(item.updateTime ?? 0),
                    style: 12.w4(color: AppColors.cB3B3B3),
                  ),
                  Expanded(child: Container()),
                  // if (item.teamId != (controller.userEntity.team?.teamId ?? 0))
                  InkWell(
                    onTap: () {
                      // int parentId = item.parentReviewId == 0
                      //     ? item.id!
                      //     : item.parentReviewId!;
                      String name = "@${item.teamName}";
                      showCommentBottomSheet(context,
                          newsId: item.newsId ?? 0,
                          reviewsItem: item,
                          // targetId: item.id ?? 0,
                          hintText: name);
                    },
                    child: Text(
                      "Reple",
                      style: TextStyle(
                          color: AppColors.c666666,
                          fontSize: 12.h,
                          decoration: TextDecoration.underline,
                          height: 1),
                    ),
                  ),
                ],
              ),
              8.vGap,

              /// 评论内容
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    item.context ?? "",
                    style: 14.w4(color: AppColors.c666666, height: 1),
                  )),
                  30.hGap,
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class HotComment extends GetView<CommentController> {
  const HotComment({super.key, required this.item});
  final Reviews item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Comments (${item.sonReviews})",
          style: 14.w7(color: AppColors.c262626, height: 1),
        ),
        10.vGap,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              url: "",
              width: 48.w,
              height: 48.w,
              borderRadius: BorderRadius.circular(24.w),
            ),
            6.hGap,
            Expanded(
              child: Column(
                children: [
                  /// 用户信息
                  Row(
                    children: [
                      Text(
                        item.teamName ?? "",
                        style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                      ),
                      13.hGap,
                      Text(
                        controller.timeAgo(item.updateTime ?? 0),
                        style: 12.w4(color: AppColors.cB3B3B3, height: 1),
                      ),
                    ],
                  ),
                  10.vGap,

                  /// 评论内容
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                        item.context ?? "",
                        style: 14.w4(color: AppColors.c666666, height: 1),
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
