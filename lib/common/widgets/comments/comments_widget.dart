import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/reviews.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/common/widgets/comments/comment_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key, required this.commentList});
  final List<Reviews> commentList;

  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.put(CommentController(commentList));
    // controller.setComments(commentList);
    return GetBuilder<CommentController>(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Comments(${commentList.length})",
                    style: 19.w7(),
                  ),
                ),

                ///TODO 显示查看数量
                // Text(
                //   "${commentList.length}",
                //   style: 10.w7(color: AppColors.cB3B3B3),
                // ),
                // 2.hGap,
                // IconWidget(
                //   iconWidth: 13.w,
                //   iconHeight: 12.w,
                //   icon: Assets.uiIconChatting_01Png,
                //   iconColor: AppColors.cB3B3B3,
                // )
              ],
            ),
            // 16.vGap,
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.mainList.length,
                separatorBuilder: (context, index) {
                  return 16.vGap;
                },
                itemBuilder: (context, index) {
                  var list = controller.subList
                      .where((e) =>
                          e.parentReviewId == controller.mainList[index].id)
                      .toList();
                  return Column(
                    children: [
                      CommentItemView(
                          item: controller.mainList[index], isSub: false),
                      if (list.isNotEmpty)
                        Container(
                          // width: 295.w,
                          margin: EdgeInsets.only(left: 25.w),
                          child: SubComentsListView(list),
                        )
                    ],
                  );
                }),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.w),
                child: Text(
                  commentList.isNotEmpty ? "No more" : "",
                  style: 14.w4(color: AppColors.cB3B3B3),
                ))
          ],
        ),
      );
    });
  }
}

///附属评论列表
class SubComentsListView extends GetView<CommentController> {
  const SubComentsListView(this.list, {super.key});
  final List<Reviews> list;

  @override
  Widget build(BuildContext context) {
    RxInt current = 3.obs;
    return SizedBox(
      // width: 295.w,
      child: Obx(() {
        int length = (current < list.length) ? current.value : list.length;
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: ListView.separated(
              padding: EdgeInsets.only(top: 20.w),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: length + 1,
              shrinkWrap: true,
              separatorBuilder: (context, index) => 5.vGap,
              itemBuilder: (context, index) {
                int has = list.length - current.value;
                return index < length
                    ? CommentItemView(item: list[index], isSub: true)
                    : Container(
                        padding: EdgeInsets.symmetric(vertical: 6.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                current.value += 3;
                              },
                              child: SizedBox(
                                width: 130.w,
                                child: has > 0
                                    ? Row(
                                        children: [
                                          IconWidget(
                                            iconWidth: 8.w,
                                            icon: Assets.uiIconUnfoldPng,
                                            iconColor: AppColors.c333333,
                                          ),
                                          4.hGap,
                                          Text(
                                            "more replies  (${has > 0 ? has : 0})",
                                            style: 12.w4(),
                                          )
                                        ],
                                      )
                                    : null,
                              ),
                            ),
                            30.hGap,
                            if (current.value != 0)
                              InkWell(
                                onTap: () {
                                  current.value = 0;
                                },
                                child: SizedBox(
                                  width: 100.w,
                                  child: Row(
                                    children: [
                                      IconWidget(
                                        iconWidth: 8.w,
                                        icon: Assets.uiIconShrinkPng,
                                        iconColor: AppColors.c333333,
                                      ),
                                      4.hGap,
                                      Text(
                                        "fold",
                                        style: 12.w4(),
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
      }),
    );
  }
}

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
            children: [
              /// 用户信息
              Row(
                children: [
                  Text(
                    item.teamName ?? "",
                    style: 12.w4(color: Colors.black),
                  ),
                  6.hGap,
                  Container(
                    width: 36.w,
                    height: 14.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.w),
                        color: AppColors.cE7B6DF),
                    child: Text(
                      "KOI",
                      style: 10.w4(color: Colors.white),
                    ),
                  ),
                  13.hGap,
                  if (item.targetId != 0)
                    Expanded(
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
                  )
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
                    style: 14.w4(color: AppColors.c666666),
                  )),
                  30.hGap,
                  InkWell(
                    onTap: () {
                      controller.likeReviews(
                          item.newsId ?? 0, item.id ?? 0, item);
                    },
                    child: Obx(() {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: IconWidget(
                          iconWidth: 15.w,
                          iconHeight: 12.w,
                          icon: item.isLike?.value == true
                              ? Assets.uiIconLike_01Png
                              : Assets.uiIconLike_02Png,
                          iconColor: item.isLike?.value == true
                              ? AppColors.cFF7954
                              : AppColors.cB3B3B3,
                        ),
                      );
                    }),
                  )
                ],
              ),
              10.vGap,

              /// 点赞和回复
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                    child: Obx(() {
                      return Text(
                        "${item.likes} likes",
                        style: 12.w4(color: AppColors.cB3B3B3),
                      );
                    }),
                  ),
                  InkWell(
                    onTap: () {
                      int parentId = item.parentReviewId == 0
                          ? item.id!
                          : item.parentReviewId!;
                      showCommentBottomSheet(
                        context,
                        newsId: item.newsId ?? 0,
                        parentId: parentId,
                        targetId: item.id ?? 0,
                      );
                    },
                    child: Text(
                      "Reple",
                      style: 12.w4(color: AppColors.c666666),
                    ),
                  ),
                ],
              ),

              /// 展开 收起
              // if (index == controller.count.value - 1)
            ],
          ),
        )
      ],
    );
  }
}
