/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-18 15:38:51
 * @LastEditTime: 2025-02-20 18:23:38
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentsDialog extends StatelessWidget {
  const CommentsDialog({super.key, required this.detail});
  final NewsListDetail detail;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.only(
      topLeft: Radius.circular(9.w),
      topRight: Radius.circular(9.w),
    );
    return InkWell(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none, // 确保内容不被剪裁
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 50.w),
            width: double.infinity,
            height: 650.h,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: borderRadius,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.w),
                  width: 44.w,
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
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SendCommentWidget(
                detail: detail,
                // key: UniqueKey(),
                // isReply: true,
                // key: Key("bottom"),
              ))
        ],
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({super.key, required this.detail});
  final NewsListDetail detail;

  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.find(tag: detail.id.toString());
    return GetBuilder<CommentController>(
        tag: detail.id.toString(),
        builder: (_) {
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
                      "Comments (${detail.reviewsCount.value})",
                      style: 16.w7(height: 1),
                    );
                  }),
                ),
                Expanded(
                    child: SmartRefresher(
                  // physics: isTop.value
                  //     ? const NeverScrollableScrollPhysics()
                  //     : const ClampingScrollPhysics(),
                  controller: controller.refhreshCtrl,
                  enablePullUp: true,
                  enablePullDown: false,
                  onLoading: () =>
                      controller.getReviews(detail.id, isRefresh: false),
                  child: list.isNotEmpty
                      ? ListView.separated(
                          controller: ScrollController(),
                          shrinkWrap: false,
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 12.w),
                          itemCount: list.length,
                          separatorBuilder: (context, index) {
                            return 24.vGap;
                          },
                          itemBuilder: (context, index) {
                            // var subList = controller.subList
                            //     .where((e) =>
                            //         e.parentReviewId ==
                            //         list[index].id)
                            //     .toList();
                            return Column(
                              children: [
                                CommentItemView(
                                    detail: detail, item: list[index]),
                                if (list[index].sonReviews > 0 ||
                                    list[index].subList.isNotEmpty)
                                  Container(
                                    // width: 295.w,
                                    margin: EdgeInsets.only(left: 42.w),
                                    child:
                                        SubComentsListView(list[index], detail),
                                  )
                              ],
                            );
                          })
                      : const Center(
                          child: LoadStatusWidget(
                          text: "No Comment",
                        )),
                )),
              ],
            ),
          );
        });
  }
}

///附属评论列表
class SubComentsListView extends GetView<CommentController> {
  const SubComentsListView(this.mainReviews, this.detail, {super.key});
  // final List<Reviews> subList;
  final ReviewEntity mainReviews;
  final NewsListDetail detail;

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
    CommentController controller = Get.find(tag: mainReviews.newsId.toString());
    // RxInt current = 0.obs;
    // int has = mainReviews.sonReviews - length;
    int has = mainReviews.sonReviews - mainReviews.current;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
      child: ListView.separated(
          padding: EdgeInsets.only(top: 23.w),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mainReviews.current + 1,
          shrinkWrap: true,
          separatorBuilder: (context, index) => 23.vGap,
          itemBuilder: (context, index) {
            return index < mainReviews.current
                ? SubCommentItemView(
                    item: mainReviews.subList[index],
                    detail: detail,
                  )
                : Container(
                    // color: Colors.red,
                    // padding: EdgeInsets.symmetric(vertical: 6.w),
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
                                      iconWidth: 11.w,
                                      icon: Assets.playerUiIconTriangle03,
                                      iconColor: AppColors.c333333,
                                      rotateAngle: 180,
                                    ),
                                    4.hGap,
                                    Text(
                                      "more replies (${has > 0 ? has : 0})",
                                      style: 12.w4(
                                          height: 1,
                                          fontFamily:
                                              FontFamily.fRobotoRegular),
                                    )
                                  ],
                                ))
                              : Container(),
                        ),
                        if (has > 0) 10.hGap,
                        if (mainReviews.current > 0)
                          InkWell(
                            onTap: () {
                              mainReviews.current = 0;
                              // mainReviews.subList.clear();
                              // mainReviews.page = 0;
                              controller.update();
                            },
                            child: _greyContainer(
                              // width: 100.w,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconWidget(
                                    iconWidth: 11.w,
                                    icon: Assets.playerUiIconTriangle03,
                                    iconColor: AppColors.c333333,
                                  ),
                                  4.hGap,
                                  Text(
                                    "fold (${mainReviews.current})",
                                    style: 12.w4(
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoRegular),
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

class DetailCommentWidget extends StatelessWidget {
  const DetailCommentWidget({super.key, required this.item});
  final NewsListDetail item;

  int getReviewCount(List<ReviewEntity> list) {
    var count = 0;
    list.forEach((element) {
      count += element.subList.length;
    });
    return count + list.length;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
        tag: item.id.toString(),
        builder: (comCtrl) {
          var list =
              comCtrl.mainList.where((e) => e.parentReviewId == 0).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 1.w,
                margin: EdgeInsets.symmetric(vertical: 25.w),
                width: double.infinity,
                color: AppColors.cE6E6E,
              ),
              Text(
                "Comments",
                style: 19.w7(height: 1),
              ),
              12.vGap,
              list.isNotEmpty
                  ? ListView.separated(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 12.w),
                      itemCount: list.length,
                      separatorBuilder: (context, index) {
                        return 30.vGap;
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CommentItemView(
                              item: list[index],
                              detail: item,
                            ),
                            if (list[index].sonReviews > 0 ||
                                list[index].subList.isNotEmpty)
                              Container(
                                // width: 295.w,
                                margin: EdgeInsets.only(left: 48.w),
                                child: SubComentsListView(list[index], item),
                              )
                          ],
                        );
                      })
                  : const SizedBox.shrink(),
              if (item.reviewsCount.value > getReviewCount(list))
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MtInkWell(
                        onTap: () => comCtrl.getReviews(item.id),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          child: Text(
                            "Show more comments",
                            textAlign: TextAlign.center,
                            style: 12.w4(color: AppColors.cB3B3B3),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          );
        });
  }
}
