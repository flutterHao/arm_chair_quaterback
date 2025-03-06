/*
 * @Description: 新闻的底部按钮点赞分享评论
 * @Author: lihonghao
 * @Date: 2024-10-17 17:02:35
 * @LastEditTime: 2025-03-06 16:32:11
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/services/sound.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comment_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/comments_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsBottomButton extends GetView<NewListController> {
  const NewsBottomButton(this.detail, {super.key, this.showCommentBt = true});
  final NewsListDetail detail;
  final bool showCommentBt;

  Widget _container({required double width, required Widget child}) {
    return Container(
      width: width,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(7.w),
          border: Border.all(
            width: 1.h,
            color: AppColors.c666666.withOpacity(0.3),
          )),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///点赞
        _container(
          width: 113.w,
          child: Obx(() {
            int like = detail.likes - detail.unLikes;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => controller.likeNews(detail),
                  child: Container(
                    width: 72.w,
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        7.hGap,
                        IconWidget(
                          iconWidth: 18.w,
                          icon: detail.isLike.value == 1
                              ? Assets.iconUiIconLike01
                              : Assets.iconUiIconLike02,
                          iconColor: detail.isLike.value == 1
                              ? AppColors.cFF7954
                              : AppColors.c000000,
                        ),
                        7.hGap,
                        Text(
                          "${like > 0 ? numFormat(like) : 0}",
                          style: 14.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            color: detail.isLike.value == 1
                                ? AppColors.cFF7954
                                : AppColors.c000000,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // if (detail.likes != 0)

                GestureDetector(
                  onTap: () => controller.likeNews(detail),
                  child: Container(
                    width: 1.w,
                    height: 24.w,
                    color: AppColors.ccccccc,
                  ),
                ),
                InkWell(
                  onTap: () => controller.unLikeNews(detail),
                  child: Container(
                    width: 37.w,
                    padding: EdgeInsets.only(top: 3.w),
                    alignment: Alignment.center,
                    // padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: IconWidget(
                      rotateAngle: 180,
                      iconWidth: 18.w,
                      icon: detail.isLike.value == -1
                          ? Assets.iconUiIconLike01
                          : Assets.iconUiIconLike02,
                      iconColor: detail.isLike.value == -1
                          ? AppColors.c2D84EF
                          : AppColors.c000000,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        12.hGap,

        ///评论
        if (showCommentBt)
          GestureDetector(
            onTap: () async {
              if (!Get.isRegistered<CommentController>(
                  tag: detail.id.toString())) {
                Get.put(CommentController(), tag: detail.id.toString());
              }
              final ctrl =
                  Get.find<CommentController>(tag: detail.id.toString());
              ctrl.getReviews(detail.id, isRefresh: true);
              // SoundServices.to.playSound(Assets.soundWindowOpen);
              await BottomTipDialog.showWithSound(
                isScrollControlled: true,
                context: Get.context!,
                // barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return VerticalDragBackWidget(
                      child: CommentsDialog(detail: detail));
                },
              );

              // NewsListDetail newsDetail = controller.state.newsFlowList
              //     .where((e) => e.id == detail.id)
              //     .first;

              // detail.reviewsCount.value = ctrl.mainList.length;
              detail.reviewsList = ctrl.mainList.value;
              ctrl.update();
              controller.update(["newsList"]);
              controller.update(["newsDetail"]);
            },
            child: _container(
                width: 76.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconWidget(
                      iconWidth: 18.w,
                      icon: Assets.iconUiIconChatting02,
                      iconColor: AppColors.c000000,
                    ),
                    // if (detail.likes != 0)
                    Obx(() {
                      return Container(
                        margin: EdgeInsets.only(left: 7.w),
                        child: Text(
                          numFormat(detail.reviewsCount.value),
                          style: 14.w4(
                            color: AppColors.c000000,
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      );
                    }),
                  ],
                )),
          ),
        // 4.hGap,
      ],
    );
  }
}

String numFormat(int num) {
  if (num >= 0 && num <= 999) {
    return "$num";
  } else {
    return "${(num / 1000).toStringAsFixed(1)}k";
  }
}
