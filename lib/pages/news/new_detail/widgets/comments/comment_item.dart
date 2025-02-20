import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/emoji_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/send_comment_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentItemView extends StatelessWidget {
  const CommentItemView({super.key, required this.item, required this.detail});
  final ReviewEntity item;
  final NewsListDetail detail;

  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.find(tag: item.newsId.toString());
    return InkWell(
      onTap: () async {
        if (item.teamId != (controller.userEntity.team?.teamId ?? 0)) {
          String name = "@${item.teamName}";
          await showCommentBottomSheet(context,
              detail: detail,
              reviewsItem: item,
              // targetId: item.id ?? 0,
              hintText: name);
          if (context.mounted) {
            FocusScope.of(context).unfocus();
          }
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvaterWidget(
            url: Utils.getAvatarUrl(item.teamLogo),
            width: 36.w,
            height: 36.w,
            radius: 18.w,
          ),
          // ImageWidget(
          //   url: Utils.getAvaterUrl(item.teamLogo),
          //   width: 36.w,
          //   height: 36.w,
          //   borderRadius: BorderRadius.circular(12.w),
          //   errorWidget: Container(
          //     width: 36.w,
          //     height: 36.w,
          //     alignment: Alignment.bottomCenter,
          //     decoration: BoxDecoration(
          //         color: AppColors.cD9D9D9,
          //         borderRadius: BorderRadius.circular(4.w)),
          //     child: Image.asset(
          //       Assets.uiDefault_03Png,
          //       width: 30.w,
          //       fit: BoxFit.fitWidth,
          //     ),
          //   ),
          // ),
          6.hGap,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 用户信息
                Row(
                  children: [
                    Text(
                      item.teamName,
                      style: 12.w4(
                          color: AppColors.c4D4D4D,
                          height: 1,
                          fontFamily: FontFamily.fRobotoRegular),
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
                        margin: EdgeInsets.only(left: 6.w),
                        child: Text(
                          " ${controller.getReplayTeamName(item)}",
                          style: 12.w4(
                              color: AppColors.c4D4D4D,
                              height: 1,
                              fontFamily: FontFamily.fRobotoRegular),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    10.hGap,
                    Text(
                      controller.timeAgo(item.updateTime),
                      style: 12.w4(
                        color: AppColors.cB3B3B3,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular,
                      ),
                    ),
                    Expanded(child: Container()),
                    if (item.teamId !=
                        (controller.userEntity.team?.teamId ?? 0))
                      InkWell(
                        onTap: () async {
                          // int parentId = item.parentReviewId == 0
                          //     ? item.id!
                          //     : item.parentReviewId!;
                          String name = "@${item.teamName}";
                          await showCommentBottomSheet(context,
                              detail: detail,
                              reviewsItem: item,
                              // targetId: item.id ?? 0,
                              hintText: name);
                          if (context.mounted) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: AppColors.cB3B3B3, width: 0.6),
                            ),
                          ),
                          child: Text(
                            "Reply",
                            style: TextStyle(
                                color: AppColors.cB3B3B3,
                                fontSize: 12.h,
                                height: 1),
                          ),
                        ),
                      ),
                  ],
                ),
                8.5.vGap,

                /// 评论内容
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      item.context,
                      style: 12.w4(
                          color: AppColors.c000000,
                          fontFamily: FontFamily.fRobotoRegular),
                    )),
                    30.hGap,
                  ],
                ),
                10.vGap,
                const EmojiWidget(),

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
                //           "Reply",
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
      ),
    );
  }
}

class SubCommentItemView extends StatelessWidget {
  const SubCommentItemView(
      {super.key, required this.item, required this.detail});
  final ReviewEntity item;
  final NewsListDetail detail;

  @override
  Widget build(BuildContext context) {
    CommentController controller = Get.find(tag: item.newsId.toString());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 用户信息
              Row(
                children: [
                  UserAvaterWidget(
                    url: Utils.getAvatarUrl(item.teamLogo),
                    width: 18.w,
                    height: 18.w,
                    radius: 9.w,
                  ),
                  // ImageWidget
                  //   url: Utils.getAvaterUrl(item.teamLogo),
                  //   width: 18.w,
                  //   height: 18.w,
                  //   borderRadius: BorderRadius.circular(6.w),
                  //   errorWidget: Container(
                  //     width: 18.w,
                  //     height: 18.w,
                  //     alignment: Alignment.bottomCenter,
                  //     decoration: BoxDecoration(
                  //         color: AppColors.cD9D9D9,
                  //         borderRadius: BorderRadius.circular(4.w)),
                  //     child: Image.asset(
                  //       Assets.uiDefault_03Png,
                  //       width: 15.w,
                  //       fit: BoxFit.fitWidth,
                  //     ),
                  //   ),
                  // ),
                  3.5.hGap,
                  item.teamId != (controller.userEntity.team?.teamId ?? 0)
                      ? Text(
                          item.teamName,
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
                            "ME",
                            style: 12.w4(color: AppColors.cFFFFFF, height: 1),
                          ),
                        ),
                  if (item.targetId != 0 &&
                      ObjectUtil.isNotEmpty(controller.getReplayTeamName(item)))
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 120.w, minWidth: 70.w),
                      margin: EdgeInsets.only(left: 6.w),
                      child: Text(
                        " ${controller.getReplayTeamName(item)}",
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
                  if (item.teamId != (controller.userEntity.team?.teamId ?? 0))
                    InkWell(
                      onTap: () {
                        // int parentId = item.parentReviewId == 0
                        //     ? item.id!
                        //     : item.parentReviewId!;
                        String name = "@${item.teamName}";
                        showCommentBottomSheet(context,
                            detail: detail,
                            reviewsItem: item,
                            // targetId: item.id ?? 0,
                            hintText: name);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: AppColors.cB3B3B3, width: 0.6),
                          ),
                        ),
                        child: Text(
                          "Reply",
                          style: TextStyle(
                              color: AppColors.cB3B3B3,
                              fontSize: 12.h,
                              height: 1),
                        ),
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
                    item.context,
                    style: 12.w4(
                        color: AppColors.c000000,
                        fontFamily: FontFamily.fRobotoRegular),
                  )),
                  30.hGap,
                ],
              ),

              10.vGap,
              const EmojiWidget()
            ],
          ),
        )
      ],
    );
  }
}

class HotComment extends StatelessWidget {
  const HotComment({super.key, required this.item});
  final ReviewEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 110.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.cE6E6E,
            margin: EdgeInsets.symmetric(vertical: 11.w),
          ),
          Row(
            children: [
              UserAvaterWidget(
                  url: Utils.getAvatarUrl(item.teamLogo),
                  width: 26.w,
                  height: 26.w,
                  radius: 23.w),
              6.hGap,
              Expanded(
                child: Text(
                  item.context,
                  style: 14.w4(
                    color: AppColors.c4D4D4D,
                    height: 1,
                    fontFamily: FontFamily.fRobotoRegular,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              11.hGap,
              IconWidget(iconWidth: 12.w, icon: Assets.newsUiIconFire),
              4.hGap,

              ///TODO:热度
              // Text(
              //   "${item.likes}",
              //   style: 12.w4(
              //     color: AppColors.c000000,
              //     fontFamily: FontFamily.fRobotoRegular,
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
