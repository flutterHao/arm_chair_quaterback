/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-18 15:38:51
 * @LastEditTime: 2024-10-21 14:39:41
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentsDialog extends GetView<CommentController> {
  const CommentsDialog({super.key, required this.detail});
  final NewsDetail detail;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.only(
      topLeft: Radius.circular(16.w),
      topRight: Radius.circular(16.w),
    );
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none, // 确保内容不被剪裁
        children: [
          Container(
            width: 375.w,
            height: 500.w,
            decoration: BoxDecoration(
              color: AppColors.cFF7954,
              borderRadius: borderRadius,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 3,
            bottom: 0,
            child: Container(
              width: 375.w,
              height: 500.w,
              decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: borderRadius,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12.w),
                    width: 64.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      color: AppColors.cB2B2B2,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                  ),
                  Expanded(child: CommentsList(detail: detail)),
                  30.vGap,
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SendCommentWidget(newsId: detail.id!))
        ],
      ),
    );
  }
}

class CommentsList extends GetView<CommentController> {
  const CommentsList({super.key, required this.detail});
  final NewsDetail detail;

  @override
  Widget build(BuildContext context) {
    RxBool isTop = false.obs;
    return GetBuilder<CommentController>(builder: (_) {
      var list =
          controller.mainList.where((e) => e.parentReviewId == 0).toList();
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12.w),
              child: Obx(() {
                return Text(
                  "Comments (${detail.reviewsCount!.value})",
                  style: 19.w7(),
                );
              }),
            ),
            Expanded(
              child: Obx(() {
                return SmartRefresher(
                  physics: isTop.value
                      ? const NeverScrollableScrollPhysics()
                      : const ClampingScrollPhysics(),
                  controller: controller.refhreshCtrl,
                  enablePullUp: true,
                  enablePullDown: false,
                  onLoading: () =>
                      controller.getReviews(detail.id!, isRefresh: false),
                  child: ListView.separated(
                      controller: ScrollController(),
                      shrinkWrap: false,
                      physics: isTop.value
                          ? const NeverScrollableScrollPhysics()
                          : const ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      itemCount: list.length,
                      separatorBuilder: (context, index) {
                        return 16.vGap;
                      },
                      itemBuilder: (context, index) {
                        // var subList = controller.subList
                        //     .where((e) =>
                        //         e.parentReviewId ==
                        //         list[index].id)
                        //     .toList();
                        return Column(
                          children: [
                            CommentItemView(item: list[index], isSub: false),
                            if (list[index].sonReviews > 0 ||
                                list[index].subList.isNotEmpty)
                              Container(
                                // width: 295.w,
                                margin: EdgeInsets.only(left: 48.w),
                                child: SubComentsListView(list[index]),
                              )
                          ],
                        );
                      }),
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}

///附属评论列表
class SubComentsListView extends GetView<CommentController> {
  const SubComentsListView(this.mainReviews, {super.key});
  // final List<Reviews> subList;
  final Reviews mainReviews;

  Widget _greyContainer({required Widget child}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.w), color: AppColors.cE6E6E),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // RxInt current = 0.obs;
    // int has = mainReviews.sonReviews - length;
    int has = mainReviews.sonReviews - mainReviews.current;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      child: ListView.separated(
          padding: EdgeInsets.only(top: 10.w),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mainReviews.current + 1,
          shrinkWrap: true,
          separatorBuilder: (context, index) => 15.vGap,
          itemBuilder: (context, index) {
            return index < mainReviews.current
                ? SubCommentItemView(item: mainReviews.subList[index])
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 6.w),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // current.value += current.value <= 1 ? 3 : 10;
                            controller.getSubReviews(mainReviews);
                          },
                          child: has > 0
                              ? _greyContainer(
                                  child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconWidget(
                                      iconWidth: 8.w,
                                      icon: Assets.uiIconUnfoldPng,
                                      iconColor: AppColors.c333333,
                                    ),
                                    4.hGap,
                                    Text(
                                      "more replies  (${has > 0 ? has : 0})",
                                      style: 12.w4(height: 1),
                                    )
                                  ],
                                ))
                              : SizedBox(width: 100.w),
                        ),
                        30.hGap,
                        if (mainReviews.current > 0)
                          InkWell(
                            onTap: () {
                              mainReviews.subList.clear();
                              mainReviews.current = 0;
                              mainReviews.page = 0;
                              controller.update();
                            },
                            child: _greyContainer(
                              // width: 100.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconWidget(
                                    iconWidth: 8.w,
                                    icon: Assets.uiIconShrinkPng,
                                    iconColor: AppColors.c333333,
                                  ),
                                  4.hGap,
                                  Text(
                                    "fold",
                                    style: 12.w4(height: 1),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
          }),
    );
  }
}
